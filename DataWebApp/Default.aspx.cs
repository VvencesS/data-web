using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataWebApp.Model;
using DataWebApp.Function;
using System.IO;

namespace DataWebApp
{
    public partial class _Default : Page
    {
        User _user = new User();
        Group _group = new Group();
        Question _ques = new Question();
        Image_ _image = new Image_();
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
                loadImgQuestion();
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
            hdIDUser.Value = dt.Rows[0]["id_User"].ToString();

            DataTable dt1 = new DataTable();
            dt1 = _group.GetGroupByID(int.Parse(dt.Rows[0]["id_Group"].ToString()));
            lblLop.Text = dt1.Rows[0]["name_Group"].ToString();

            DataTable dt2 = new DataTable();
            dt2 = _group.GetKhoaByParent(int.Parse(dt1.Rows[0]["parent_Group"].ToString()));
            lblKhoa.Text = dt2.Rows[0]["name_Group"].ToString();
        }
        void loadImgQuestion()
        {
            DataTable dt = new DataTable();
            dt = _image.GetImageListByIDUser(int.Parse(hdIDUser.Value.ToString()));
            if(dt.Rows.Count <= 0)
            {
                rptImgUserInsert.DataSource = _ques.GetListAll();
                rptImgUserInsert.DataBind();
                mul.ActiveViewIndex = 0;
            }
            else
            {
                rptImgUserUpDate.DataSource = dt;
                rptImgUserUpDate.DataBind();
                mul.ActiveViewIndex = 1;
            }
            
        }

        protected void rptImgUserInsert_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            hdInsert.Value = "insert";
            hdIDQues.Value = e.CommandArgument.ToString();
            hdView.Value = "1";

            DataTable dt = new DataTable();
            dt = _ques.GetListByIDQues(int.Parse(hdIDQues.Value.ToString()));
            if(dt.Rows.Count > 0)
            {
                lblCauHoi.Text = dt.Rows[0]["content"].ToString();
                imgDes.ImageUrl = "/images/question/" + dt.Rows[0]["image_Des"].ToString();
                imgPath.ImageUrl = "/images/admin/image-user.png";
            }

            mul.ActiveViewIndex = 2;
        }

        protected void rptImgUserUpDate_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            hdInsert.Value = "update";
            hdIDImg.Value = e.CommandArgument.ToString();
            hdView.Value = "2";

            DataTable dt = new DataTable();
            dt = _image.GetImageListByIDImg(int.Parse(hdIDImg.Value.ToString()));
            if (dt.Rows.Count > 0)
            {
                lblCauHoi.Text = dt.Rows[0]["content"].ToString();
                imgDes.ImageUrl = "/images/question/" + dt.Rows[0]["image_Des"].ToString();
                imgPath.ImageUrl = "/images/UserImages/" + dt.Rows[0]["image_Path"].ToString();
            }

            mul.ActiveViewIndex = 2;
        }

        protected void lnkInsertUpdate_Click(object sender, EventArgs e)
        {
            //Upload image
            string typefile = "";
            string file = ""; //Nếu file chưa có thì sẽ là rỗng

            if (fileUpImg.FileName.Length > 0)
            {
                if (fileUpImg.PostedFile.ContentLength < 5000000)
                {
                    if (fileUpImg.PostedFile.ContentType.Equals("image/jpeg")
                        || fileUpImg.PostedFile.ContentType.Equals("image/pjpeg")
                        || fileUpImg.PostedFile.ContentType.Equals("image/x-png")
                        || fileUpImg.PostedFile.ContentType.Equals("image/png")
                        || fileUpImg.PostedFile.ContentType.Equals("image/gif")
                        || fileUpImg.PostedFile.ContentType.Equals("image/x-shockwave-flash"))
                    {
                        typefile = Path.GetExtension(fileUpImg.FileName).ToLower();
                        file = Path.GetFileName(fileUpImg.PostedFile.FileName);
                        file = fileUpImg.FileName.Replace(file, "DataWeb_UserImage_" + DateTime.Now.Year + DateTime.Now.Month + DateTime.Now.Day + DateTime.Now.Hour + DateTime.Now.Minute + DateTime.Now.Second + typefile);
                        fileUpImg.PostedFile.SaveAs(Server.MapPath("~/images/UserImages/") + file);
                    }
                }
            }

            if (!string.IsNullOrEmpty(fileUpImg.ToString()))
            {
                if (hdInsert.Value == "insert")
                {
                    //Thêm mới
                    _image.Insert(file, int.Parse(hdIDUser.Value.ToString()), int.Parse(hdIDQues.Value.ToString()), DateTime.Now, DateTime.Now, false);
                    loadImgQuestion();
                    mul.ActiveViewIndex = 0;
                }
                else
                {
                    //Cập nhật
                    _image.Update(int.Parse(hdIDImg.Value.ToString()), file, DateTime.Now);
                    loadImgQuestion();
                    mul.ActiveViewIndex = 1;
                }
            }
        }

        protected void lnkLuu_Click(object sender, EventArgs e)
        {
            loadImgQuestion();
        }
    }
}