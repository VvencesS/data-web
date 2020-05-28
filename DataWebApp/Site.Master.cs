using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataWebApp
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkDangXuat_Click(object sender, EventArgs e)
        {
            Session["name"] = null;
            Response.Redirect("~/LoginUser.aspx");
        }
    }
}