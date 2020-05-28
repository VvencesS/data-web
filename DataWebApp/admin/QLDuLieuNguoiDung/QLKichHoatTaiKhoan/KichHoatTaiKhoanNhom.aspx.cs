using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataWebApp.Model;

namespace DataWebApp.admin.QLDuLieuNguoiDung.QLKichHoatTaiKhoan
{
    public partial class KichHoatTaiKhoanNhom : System.Web.UI.Page
    {
        Group _group = new Group();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Nếu chưa login
            if (Session["username"] == null)
            {
                Response.Redirect("../../LoginAdmin.aspx");
            }
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
            Response.Redirect("KichHoatTungTaiKhoan.aspx?id=" + e.CommandArgument.ToString());
        }
    }
}