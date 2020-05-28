using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataWebApp.Model;

namespace DataWebApp.admin.QLDuyetAnh
{
    public partial class DuyetAnhTheoNhom : System.Web.UI.Page
    {
        Group _group = new Group();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGroupAll();
            }
        }
        void LoadGroupAll()
        {
            rptGroup.DataSource = _group.GetGroupList();
            rptGroup.DataBind();
        }

        protected void rptGroup_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Response.Redirect("DuyetAnhTungTaiKhoan.aspx?id=" + e.CommandArgument.ToString());
        }
    }
}