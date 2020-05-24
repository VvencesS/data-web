using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Configuration;
using DataWebApp.Model;
using System.Data.Common;
using DataWebApp.Function;

namespace DataWebApp.admin.QLDuLieuNguoiDung.DuLieuNguoiDung
{
    public partial class ImportDuLieuNguoiDung : System.Web.UI.Page
    {
        Group _group = new Group();
        User _user = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDataDrpChonTruong();
                LoadDataDrpChonKhoa();
                BindGridview();
            }
        }
        void LoadDataDrpChonTruong()
        {
            drpChonTruong.DataSource = _group.GetTruongList();
            drpChonTruong.DataValueField = "id_Group";
            drpChonTruong.DataTextField = "name_Group";
            drpChonTruong.DataBind();
        }
        void LoadDataDrpChonKhoa()
        {
            drpChonKhoa.DataSource = _group.GetKhoaList();
            drpChonKhoa.DataValueField = "id_Group";
            drpChonKhoa.DataTextField = "name_Group";
            drpChonKhoa.DataBind();
        }
        void LoadDataDrpChonKhoaByTruong()
        {
            drpChonKhoa.DataSource = _group.GetKhoaListByTruong(int.Parse(drpChonTruong.SelectedValue.ToString()));
            drpChonKhoa.DataValueField = "id_Group";
            drpChonKhoa.DataTextField = "name_Group";
            drpChonKhoa.DataBind();
        }
        void LoadDataDrpChonLopByKhoa()
        {
            drpChonLop.DataSource = _group.GetLopListByKhoa(int.Parse(drpChonKhoa.SelectedValue.ToString()));
            drpChonLop.DataValueField = "id_Group";
            drpChonLop.DataTextField = "name_Group";
            drpChonLop.DataBind();
        }

        void BindGridview()
        {
            gvUser.DataSource = _user.GetUserListAll();
            gvUser.DataBind();
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string path = string.Concat(Server.MapPath("~/UploadFile/" + fileUploadExcel.FileName));
            fileUploadExcel.SaveAs(path);

            if (fileUploadExcel.HasFile)
            {
                // Đọc dữ liệu từ tập tin excel trả về DataTable
                DataTable data = ReadDataFromExcelFile(path);

                // Import dữ liệu đọc được vào database
                ImportIntoDatabase(data);

                // Lấy hết dữ liệu import từ database hiển thị lên gridView
                ShowData();
            }
            else
            {
                Response.Write("Vui lòng chọn tập tin Excel cần import");
            }
        }
        private DataTable ReadDataFromExcelFile(string path)
        {
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=Excel 8.0";
            // Tạo đối tượng kết nối
            OleDbConnection oledbConn = new OleDbConnection(connectionString);
            DataTable data = null;
            try
            {
                // Mở kết nối
                oledbConn.Open();

                // Tạo đối tượng OleDBCommand và query data từ sheet có tên "Sheet1"
                OleDbCommand cmd = new OleDbCommand("SELECT * FROM [Sheet1$]", oledbConn);

                // Tạo đối tượng OleDbDataAdapter để thực thi việc query lấy dữ liệu từ tập tin excel
                OleDbDataAdapter oleda = new OleDbDataAdapter();

                oleda.SelectCommand = cmd;

                // Tạo đối tượng DataSet để hứng dữ liệu từ tập tin excel
                DataSet ds = new DataSet();

                // Đổ đữ liệu từ tập excel vào DataSet
                oleda.Fill(ds);

                data = ds.Tables[0];
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            finally
            {
                // Đóng chuỗi kết nối
                oledbConn.Close();
            }
            return data;
        }
        private void ImportIntoDatabase(DataTable data)
        {
            if (data != null && data.Rows.Count > 0)
            {
                try
                {
                    for (int i = 0; i < data.Rows.Count; i++)
                    {
                        bool gender = data.Rows[i]["Giới tính"].ToString().Trim() == "Nam" ? true : false;
                        DateTime ngaySinh = XyLyNgayThang.XuLyChuoiNgayThang(data.Rows[i]["Ngày sinh"].ToString().Trim().Substring(0, 10));
                        DataTable existingUser = _user.GetUserListByStudentCode(data.Rows[i]["Mã sinh viên"].ToString().Trim());
                        // Nếu mã sinh viên chưa tồn tại trong DB thì thêm mới
                        if (existingUser == null || existingUser.Rows.Count == 0)
                        {
                            _user.Insert(int.Parse(drpChonLop.SelectedValue.ToString()), data.Rows[i]["Mã sinh viên"].ToString().Trim(), 
                                data.Rows[i]["Tên sinh viên"].ToString().Trim(), gender, data.Rows[i]["CMT"].ToString().Trim(),
                                ngaySinh, data.Rows[i]["Địa chỉ"].ToString().Trim(), data.Rows[i]["SDT"].ToString().Trim(), 
                                data.Rows[i]["Email"].ToString().Trim(), DateTime.Now, DateTime.Now, false, true);
                        }
                        // Ngược lại, nhân viên đã tồn tại trong DB thì update
                        else
                        {
                            _user.UpdateByStudentCode(int.Parse(drpChonLop.SelectedValue.ToString()), data.Rows[i]["Mã sinh viên"].ToString().Trim(),
                                data.Rows[i]["Tên sinh viên"].ToString().Trim(), gender, data.Rows[i]["CMT"].ToString().Trim(),
                                ngaySinh, data.Rows[i]["Địa chỉ"].ToString().Trim(), data.Rows[i]["SDT"].ToString().Trim(),
                                data.Rows[i]["Email"].ToString().Trim(), DateTime.Now, false, true);
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }

            }
        }
        private void ShowData()
        {
            gvUser.DataSource = _user.GetUserListAll();
            gvUser.DataBind();
        }

        protected void drpChonTruong_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDataDrpChonKhoaByTruong();
        }

        protected void drpChonKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDataDrpChonLopByKhoa();
        }
    }
}