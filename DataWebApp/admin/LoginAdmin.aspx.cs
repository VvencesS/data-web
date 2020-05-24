using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataWebApp.Model;

namespace DataWebApp.admin
{
    public partial class LoginAdmin : System.Web.UI.Page
    {
        clsAdmin _admin = new clsAdmin();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtUserName.Text.Trim())
                && !string.IsNullOrEmpty(txtPassword.Text.Trim()))
            {
                DataTable dt = new DataTable();
                dt = _admin.Login(txtUserName.Text.Trim(), txtPassword.Text.Trim());
                if (dt.Rows.Count > 0)
                {
                    Session["username"] = txtUserName.Text.Trim();
                    Response.Redirect("~/admin/QLDuLieuNguoiDung/DuLieuNguoiDung/XemDuLieuNguoiDung.aspx");
                }
            }
        }
    }
}