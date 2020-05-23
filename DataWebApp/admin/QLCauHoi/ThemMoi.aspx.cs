using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataWebApp.Model;

namespace DataWebApp.admin.QLCauHoi
{
    public partial class ThemMoi : System.Web.UI.Page
    {
        Question _question = new Question();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            hdInsert.Value = "insert";
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
                    //_question.Update(int.Parse(hdIDQuestion.Value.ToString()),
                    //    txaContent.Text.Trim(), bool.Parse(drpTrangThai.SelectedValue.ToString()),
                    //    bool.Parse(drpBatBuoc.SelectedValue.ToString()), file, DateTime.Now, DateTime.Now, true);
                }
                Response.Redirect("XemSuaXoa.aspx");
            }
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("XemSuaXoa.aspx");
        }
    }
}