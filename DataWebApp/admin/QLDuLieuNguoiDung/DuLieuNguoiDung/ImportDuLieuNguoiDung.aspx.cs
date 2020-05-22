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

namespace DataWebApp.admin.QLDuLieuNguoiDung.DuLieuNguoiDung
{
    public partial class ImportDuLieuNguoiDung : System.Web.UI.Page
    {
        Group _group = new Group();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDataDrpChonTruong();
                //LoadDataDrpChonKhoa();
                //LoadDataDrpChonLop();
            }
        }
        void LoadDataDrpChonTruong()
        {
            drpChonTruong.DataSource = _group.GetTruongList();
            drpChonTruong.DataValueField = "id_Group";
            drpChonTruong.DataTextField = "name_Group";
            drpChonTruong.DataBind();
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
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fileUploadExcel.HasFile)
            {
                string FileName = Path.GetFileName(fileUploadExcel.PostedFile.FileName);
                string Extension = Path.GetExtension(fileUploadExcel.PostedFile.FileName);
                string FolderPath = ConfigurationManager.AppSettings["FolderPath"];

                string FilePath = Server.MapPath(FolderPath + FileName);
                fileUploadExcel.SaveAs(FilePath);
                
            }
        }

        private DataTable ReadExelFile(string sheetName, string path)
        {
            using(OleDbConnection conn = new OleDbConnection())
            {
                DataTable dt = new DataTable();
                conn.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties='Excel 12.0 Xml;HDR=Yes;IMEX=1 ;MAXSCANROWS=0'";
                using(OleDbCommand comm = new OleDbCommand())
                {
                    comm.CommandText = "Select * from [" + sheetName + " $]";
                    comm.Connection = conn;
                    using(OleDbDataAdapter da = new OleDbDataAdapter())
                    {
                        da.SelectCommand = comm;
                        da.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        protected void drpChonKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDataDrpChonLopByKhoa();
        }

        protected void drpChonLop_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void drpChonTruong_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDataDrpChonKhoaByTruong();
        }
    }
}