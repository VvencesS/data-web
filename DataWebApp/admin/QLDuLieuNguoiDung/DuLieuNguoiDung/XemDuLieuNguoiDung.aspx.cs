using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataWebApp.Model;
using DataWebApp.Function;

namespace DataWebApp.admin.QLDuLieuNguoiDung.DuLieuNguoiDung
{
    public partial class XemDuLieuNguoiDung : System.Web.UI.Page
    {
        Group _group = new Group();
        User _user = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDataDrpChonTruong();
                LoadDataDrpChonKhoa();
                LoadDataDrpChonLop();
                LoadDataDrpLop();
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
        void LoadDataDrpChonLop()
        {
            drpChonLop.DataSource = _group.GetLopList();
            drpChonLop.DataValueField = "id_Group";
            drpChonLop.DataTextField = "name_Group";
            drpChonLop.DataBind();
        }
        void LoadDataDrpLop()
        {
            drpLop.DataSource = _group.GetLopList();
            drpLop.DataValueField = "id_Group";
            drpLop.DataTextField = "name_Group";
            drpLop.DataBind();
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
            rptUser.DataSource = _user.GetUserListAll();
            rptUser.DataBind();
        }
        protected void msgDelete(object sender, System.EventArgs e)
        {
            ((LinkButton)sender).Attributes["onclick"] = "return confirm('Delete selected Category?')";
        }

        protected void drpChonTruong_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDataDrpChonKhoaByTruong();
        }

        protected void drpChonKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDataDrpChonLopByKhoa();
        }

        protected void lnkImport_Click(object sender, EventArgs e)
        {
            Response.Redirect("ImportDuLieuNguoiDung.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtMaSV.Text.Trim()))
            {
                if (hdInsert.Value != "insert")
                {
                    //Cập nhật
                    DateTime ngaySinh = XyLyNgayThang.XuLyChuoiNgayThang(txtNgaySinh.Text.Substring(0, 10));
                    bool gender = chkGT.Checked ? true : false;
                    _user.Update(int.Parse(hdIDUser.Value.ToString()), int.Parse(drpLop.SelectedValue.ToString()), txtMaSV.Text.Trim(),
                        txtTenSV.Text.ToString(), gender, txtCMT.Text.ToString(), ngaySinh, txtDiaChi.Text.ToString(),
                        txtSDT.Text.ToString(), txtEmail.Text.ToString(), DateTime.Now, false, true);
                }
                Response.Redirect(Request.Url.ToString());
            }
        }

        protected void rptUser_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = _user.GetUserByID(int.Parse(e.CommandArgument.ToString()));
            switch (e.CommandName.ToString())
            {
                case "update":
                    if (dt.Rows.Count > 0)
                    {
                        txtMaSV.Text = dt.Rows[0]["student_Code"].ToString();
                        txtTenSV.Text = dt.Rows[0]["name"].ToString();
                        drpLop.SelectedValue = dt.Rows[0]["id_Group"].ToString();
                        chkGT.Checked = ((bool)dt.Rows[0]["gener"]) ? true : false;
                        txtCMT.Text = dt.Rows[0]["cmt"].ToString();
                        txtNgaySinh.Text = dt.Rows[0]["birthday"].ToString();
                        txtDiaChi.Text = dt.Rows[0]["address"].ToString();
                        txtSDT.Text = dt.Rows[0]["phone"].ToString();
                        txtEmail.Text = dt.Rows[0]["email"].ToString();

                        hdIDUser.Value = e.CommandArgument.ToString();
                        hdInsert.Value = "update";

                        mul.ActiveViewIndex = 1;
                    }
                    break;
                case "delete":
                    if (dt.Rows.Count > 0)
                    {
                        //Xóa dữ liệu trong csdl
                        _user.Delete(int.Parse(e.CommandArgument.ToString()));
                        Response.Redirect(Request.Url.ToString());
                    }
                    break;
            }
        }

        protected void lnkExport_Click(object sender, EventArgs e)
        {

        }
    }
}