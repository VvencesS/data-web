using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataWebApp.Model;

namespace DataWebApp.admin.QLCauHoi
{
    public partial class XemSuaXoa : System.Web.UI.Page
    {
        Question _question = new Question();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Nếu chưa login
            if (Session["username"] == null)
            {
                Response.Redirect("../../LoginAdmin.aspx");
            }
            if (!IsPostBack)
            {
                LoadQuesList();
            }
        }
        void LoadQuesList()
        {
            rptQuestion.DataSource = _question.GetListAll();
            rptQuestion.DataBind();
        }
        void LoadQuesListByStatus()
        {
            rptQuestion.DataSource = _question.GetListByStatus(bool.Parse(drpChonTrangThai.SelectedValue.ToString()));
            rptQuestion.DataBind();
        }
        void LoadQuesListByContent()
        {
            rptQuestion.DataSource = _question.GetListByContent(txtTimKiem.Text.ToString());
            rptQuestion.DataBind();
        }
        protected void lnkThemMoi_Click(object sender, EventArgs e)
        {
            Response.Redirect("ThemMoi.aspx");
        }
        protected void msgDelete(object sender, System.EventArgs e)
        {
            ((LinkButton)sender).Attributes["onclick"] = "return confirm('Delete selected Category?')";
        }

        protected void rptQuestion_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = _question.GetListByIDQues(int.Parse(e.CommandArgument.ToString()));
            switch (e.CommandName.ToString())
            {
                case "update":
                    if (dt.Rows.Count > 0)
                    {
                        drpTrangThai.SelectedValue = dt.Rows[0]["status"].ToString();
                        txaContent.Text = dt.Rows[0]["Content"].ToString();
                        drpBatBuoc.SelectedValue = dt.Rows[0]["obligatory"].ToString();
                        hdImage.Value = dt.Rows[0]["image_Des"].ToString();

                        hdIDQuestion.Value = e.CommandArgument.ToString();
                        hdInsert.Value = "update";

                        mul.ActiveViewIndex = 1;
                    }
                    break;
                case "delete":
                    if (dt.Rows.Count > 0)
                    {
                        //Xóa hình ảnh project
                        if (System.IO.File.Exists(Server.MapPath("~/images/question/" + dt.Rows[0]["image_Des"])) == true)
                        {
                            System.IO.File.Delete(Server.MapPath("~/images/question/" + dt.Rows[0]["image_Des"]));
                        }

                        //Xóa dữ liệu trong csdl
                        _question.Delete(int.Parse(e.CommandArgument.ToString()));
                        Response.Redirect(Request.Url.ToString());
                    }
                    break;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //Upload image
            string typefile = "";
            string file = hdImage.Value; //Nếu file chưa có thì sẽ là rỗng

            if (fUp.FileName.Length > 0)
            {
                if (fUp.PostedFile.ContentLength < 5000000)
                {
                    if (fUp.PostedFile.ContentType.Equals("image/jpeg")
                        || fUp.PostedFile.ContentType.Equals("image/pjpeg")
                        || fUp.PostedFile.ContentType.Equals("image/x-png")
                        || fUp.PostedFile.ContentType.Equals("image/png")
                        || fUp.PostedFile.ContentType.Equals("image/gif")
                        || fUp.PostedFile.ContentType.Equals("image/x-shockwave-flash"))
                    {
                        typefile = Path.GetExtension(fUp.FileName).ToLower();
                        file = Path.GetFileName(fUp.PostedFile.FileName);
                        file = fUp.FileName.Replace(file, "DataWeb_QuestionImage_" + DateTime.Now.Year + DateTime.Now.Month + DateTime.Now.Day + DateTime.Now.Hour + DateTime.Now.Minute + DateTime.Now.Second + typefile);
                        fUp.PostedFile.SaveAs(Server.MapPath("~/images/question/") + file);
                    }
                }
            }

            //Kiểm tra image đã tồn tại
            if (!file.Equals(hdImage.Value))
            {
                if (!hdImage.Value.Equals(""))
                {
                    if (System.IO.File.Exists(Server.MapPath("~/images/question/" + hdImage.Value)) == true)
                    {
                        System.IO.File.Delete(Server.MapPath("~/images/question/" + hdImage.Value));
                    }
                }
            }

            if (!string.IsNullOrEmpty(txaContent.Text.Trim()))
            {
                if (hdInsert.Value == "insert")
                {
                    //Thêm mới
                    _question.Insert(txaContent.Text.Trim(), bool.Parse(drpTrangThai.SelectedValue.ToString()),
                        bool.Parse(drpBatBuoc.SelectedValue.ToString()), file, DateTime.Now, DateTime.Now, true);
                }
                else
                {
                    //Cập nhật
                    _question.Update(int.Parse(hdIDQuestion.Value.ToString()),
                        txaContent.Text.Trim(), bool.Parse(drpTrangThai.SelectedValue.ToString()),
                        bool.Parse(drpBatBuoc.SelectedValue.ToString()), file, DateTime.Now, DateTime.Now, true);
                }
                Response.Redirect(Request.Url.ToString());
            }
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            mul.ActiveViewIndex = 0;
        }

        protected void drpChonTrangThai_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(drpChonTrangThai.SelectedValue == "True" || drpChonTrangThai.SelectedValue == "False")
            {
                LoadQuesListByStatus();
            }
            
        }

        protected void lnkTimKiem_Click(object sender, EventArgs e)
        {
            LoadQuesListByContent();
        }
    }
}