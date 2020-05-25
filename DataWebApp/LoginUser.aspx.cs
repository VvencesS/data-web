using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataWebApp.Model;

namespace DataWebApp
{
    public partial class LoginUser : System.Web.UI.Page
    {
        User _user = new User();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtName.Text.Trim())
                && !string.IsNullOrEmpty(txtCMT.Text.Trim())
                && !string.IsNullOrEmpty(txtBirthday.Text.Trim()))
            {
                DataTable dt = new DataTable();
                dt = _user.Login(txtName.Text.Trim(), txtCMT.Text.Trim(), txtBirthday.Text.Trim());
                if (dt.Rows.Count > 0)
                {
                    Session["name"] = dt.Rows[0]["name"].ToString();
                    Session["cmt"] = dt.Rows[0]["cmt"].ToString();
                    Session["birthday"] = dt.Rows[0]["birthday"].ToString();
                    Response.Redirect("~/Default.aspx");
                }
            }
        }
    }
}