using DataWebApp.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataWebApp.admin.QLDSNhomCoDinh
{
    public partial class XemDanhSachNhom : System.Web.UI.Page
    {
        Group _group = new Group();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGroupAll();
                LoadChonTruong();
                LoadChonKhoa();
                LoadChonTruong1();
                LoadChonKhoa1();
            }
        }
        void LoadGroupAll()
        {
            rptGroup.DataSource = _group.GetGroupList();
            rptGroup.DataBind();
        }
        void LoadLopListByKhoa()
        {
            rptGroup.DataSource = _group.GetLopListByKhoa(int.Parse(drpChonKhoa1.SelectedValue.ToString()));
            rptGroup.DataBind();
        }
        void LoadChonTruong()
        {
            drpChonTruong1.DataSource = _group.GetTruongList();
            drpChonTruong1.DataValueField = "id_Group";
            drpChonTruong1.DataTextField = "name_Group";
            drpChonTruong1.DataBind();
        }
        void LoadChonKhoa()
        {
            drpChonKhoa.DataSource = _group.GetKhoaList();
            drpChonKhoa.DataValueField = "id_Group";
            drpChonKhoa.DataTextField = "name_Group";
            drpChonKhoa.DataBind();
        }
        void LoadChonTruong1()
        {
            drpChonTruong.DataSource = _group.GetTruongList();
            drpChonTruong.DataValueField = "id_Group";
            drpChonTruong.DataTextField = "name_Group";
            drpChonTruong.DataBind();
        }
        void LoadChonKhoa1()
        {
            drpChonKhoa1.DataSource = _group.GetKhoaList();
            drpChonKhoa1.DataValueField = "id_Group";
            drpChonKhoa1.DataTextField = "name_Group";
            drpChonKhoa1.DataBind();
        }
        void LoadDataDrpChonKhoaByTruong()
        {
            drpChonKhoa1.DataSource = _group.GetKhoaListByTruong(int.Parse(drpChonTruong.SelectedValue.ToString()));
            drpChonKhoa1.DataValueField = "id_Group";
            drpChonKhoa1.DataTextField = "name_Group";
            drpChonKhoa1.DataBind();
        }
        
        protected void lnkUpdate_Click(object sender, EventArgs e)
        {
            hdInsert.Value = "insert";
            if (drpLevelGroup.SelectedValue.ToString() == "khoa")
            {
                mul.ActiveViewIndex = 1;
            }
            else if (drpLevelGroup.SelectedValue.ToString() == "lop")
            {
                mul.ActiveViewIndex = 2;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtTenKhoa.Text.Trim()))
            {
                if (hdInsert.Value == "insert")
                {
                    //Thêm mới khoa
                    bool active = chkActive1.Checked ? true : false;
                    _group.Insert(txtTenKhoa.Text.Trim(), 2, int.Parse(drpChonTruong1.SelectedValue.ToString()), DateTime.Now, DateTime.Now, active);
                }
                else
                {
                    //Cập nhật
                    bool active = chkActive1.Checked ? true : false;
                    _group.Update(int.Parse(hdIDGroup.Value.ToString()), txtTenKhoa.Text.Trim(), 2, int.Parse(drpChonTruong1.SelectedValue.ToString()), DateTime.Now, DateTime.Now, active);
                }
                Response.Redirect(Request.Url.ToString());
            }
        }

        protected void btnUpdate1_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtTenLop.Text.Trim()))
            {
                if (hdInsert.Value == "insert")
                {
                    //Thêm mới khoa
                    bool active = chkActive2.Checked ? true : false;
                    _group.Insert(txtTenLop.Text.Trim(), 3, int.Parse(drpChonKhoa.SelectedValue.ToString()), DateTime.Now, DateTime.Now, active);
                }
                else
                {
                    //Cập nhật
                    bool active = chkActive2.Checked ? true : false;
                    _group.Update(int.Parse(hdIDGroup.Value.ToString()), txtTenLop.Text.Trim(), 3, int.Parse(drpChonKhoa.SelectedValue.ToString()), DateTime.Now, DateTime.Now, active);
                }
                Response.Redirect(Request.Url.ToString());
            }
        }
        protected void msgDelete(object sender, System.EventArgs e)
        {
            ((LinkButton)sender).Attributes["onclick"] = "return confirm('Delete selected Category?')";
        }

        protected void rptGroup_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = _group.GetGroupByID(int.Parse(e.CommandArgument.ToString()));
            switch (e.CommandName.ToString())
            {
                case "update":
                    if (dt.Rows.Count > 0)
                    {
                        if (int.Parse(dt.Rows[0]["level_Group"].ToString()) == 2)
                        {
                            drpChonTruong1.SelectedValue = dt.Rows[0]["parent_Group"].ToString();
                            txtTenKhoa.Text = dt.Rows[0]["name_Group"].ToString();
                            chkActive1.Checked = ((bool)dt.Rows[0]["active"]) ? true : false;

                            hdIDGroup.Value = e.CommandArgument.ToString();
                            hdInsert.Value = "update";

                            mul.ActiveViewIndex = 1;
                        }
                        else if (int.Parse(dt.Rows[0]["level_Group"].ToString()) == 3)
                        {
                            drpChonKhoa.SelectedValue = dt.Rows[0]["parent_Group"].ToString();
                            txtTenLop.Text = dt.Rows[0]["name_Group"].ToString();
                            chkActive2.Checked = ((bool)dt.Rows[0]["active"]) ? true : false;

                            hdIDGroup.Value = e.CommandArgument.ToString();
                            hdInsert.Value = "update";

                            mul.ActiveViewIndex = 2;
                        }
                    }
                    break;
                case "delete":
                    if (dt.Rows.Count > 0)
                    {
                        //Xóa dữ liệu trong csdl
                        _group.Delete(int.Parse(e.CommandArgument.ToString()));
                        Response.Redirect(Request.Url.ToString());
                    }
                    break;
            }
        }

        protected void drpChonTruong_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDataDrpChonKhoaByTruong();
        }

        protected void drpChonKhoa1_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadLopListByKhoa();
        }
    }
}