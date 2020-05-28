using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataWebApp.Model;

namespace DataWebApp.admin.QLDuyetAnh
{
    public partial class DuyetAnhTungTaiKhoan : System.Web.UI.Page
    {
        Group _group = new Group();
        User _user = new User();
        Image_ _image = new Image_();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Nếu chưa login
            if (Session["username"] == null)
            {
                Response.Redirect("../../LoginAdmin.aspx");
            }
            string idGroup = Request["id"];
            if (idGroup != "")
            {
                GetUserImgByIDGroup(int.Parse(idGroup));
            }
            else if (!IsPostBack)
            {
                BindGridview();
            }
        }
        void BindGridview()
        {
            rptUser.DataSource = _user.GetUserListAll();
            rptUser.DataBind();
        }
        void GetUserImgByIDGroup(int idG)
        {
            rptUser.DataSource = _image.GetUserImagesByIDGroup(idG);
            rptUser.DataBind();
        }

        protected void rptUser_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = _image.GetImageListByIDImg(int.Parse(e.CommandArgument.ToString()));
            if (dt.Rows.Count > 0)
            {
                hdIDUser.Value = dt.Rows[0]["id_User"].ToString();
                hdIDImg.Value = e.CommandArgument.ToString();
                txtGHiChu.Text = "";

                lblCauHoi.Text = dt.Rows[0]["content"].ToString();
                imgDes.ImageUrl = "/images/question/" + dt.Rows[0]["image_Des"].ToString();
                imgPath.ImageUrl = "/images/UserImages/" + dt.Rows[0]["image_Path"].ToString();

                mul.ActiveViewIndex = 1;
            }

        }

        protected void lnkInsertUpdate_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt = _image.GetImageListByIDImg(int.Parse(hdIDImg.Value.ToString()));

            bool status = bool.Parse(drpDuyet.SelectedValue.ToString());
            if (dt.Rows.Count > 0)
            {
                _image.CensorshipImg(int.Parse(hdIDImg.Value.ToString()), status, DateTime.Now, txtGHiChu.Text.ToString());
            }
            GetUserImgByIDGroup(int.Parse(dt.Rows[0]["id_Group"].ToString()));
            mul.ActiveViewIndex = 0;
        }
    }
}