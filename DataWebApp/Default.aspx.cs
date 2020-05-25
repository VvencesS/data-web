using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataWebApp.Model;
using DataWebApp.Function;

namespace DataWebApp
{
    public partial class _Default : Page
    {
        User _user = new User();
        Group _group = new Group();
        Question _ques = new Question();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Nếu chưa login
            if (Session["name"] == null)
            {
                Response.Redirect("~/LoginUser.aspx");
            }
            if (!IsPostBack)
            {
                LoadData();
                loadQuestion();
            }
        }
        void LoadData()
        {
            DataTable dt = new DataTable();
            dt = _user.Login(Session["name"].ToString(), Session["cmt"].ToString(), Session["birthday"].ToString());

            lblMaSV.Text = dt.Rows[0]["student_Code"].ToString();
            lblTenSV.Text = dt.Rows[0]["name"].ToString();
            lblCMT.Text = dt.Rows[0]["cmt"].ToString();
            lblNS.Text = dt.Rows[0]["birthday"].ToString().Substring(0, 10);

            DataTable dt1 = new DataTable();
            dt1 = _group.GetGroupByID(int.Parse(dt.Rows[0]["id_Group"].ToString()));
            lblLop.Text = dt1.Rows[0]["name_Group"].ToString();

            DataTable dt2 = new DataTable();
            dt2 = _group.GetKhoaByParent(int.Parse(dt1.Rows[0]["parent_Group"].ToString()));
            lblKhoa.Text = dt2.Rows[0]["name_Group"].ToString();
        }
        void loadQuestion()
        {
            rptImgUser.DataSource = _ques.GetListAll();
            rptImgUser.DataBind();
        }
    }
}