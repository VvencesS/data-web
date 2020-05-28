using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataWebApp.Model;

namespace DataWebApp.admin.QLDuLieuNguoiDung.QLKichHoatTaiKhoan
{
    public partial class KichHoatTungTaiKhoan : System.Web.UI.Page
    {
        Group _group = new Group();
        User _user = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Nếu chưa login
            if (Session["username"] == null)
            {
                Response.Redirect("../../LoginAdmin.aspx");
            }
            string idGroup = Request["id"];
            if(idGroup != "")
            {
                GetUserByIDGroup(int.Parse(idGroup));
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
        void GetUserByIDGroup(int idG)
        {
            rptUser.DataSource = _user.GetUserListByIDGroup(idG);
            rptUser.DataBind();
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
                        _user.UpdateStatus(int.Parse(e.CommandArgument.ToString()), true);
                    }
                    break;
            }
            BindGridview();
        }
    }
}