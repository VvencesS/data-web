using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace DataWebApp.Model
{
    public class Question
    {
        public DataTable GetListAll()
        {
            SqlCommand command = new SqlCommand("Select * from Question");
            command.CommandType = CommandType.Text;

            return SQLDB.SQLDB.GetData(command);
        }
        public DataTable GetListByIDQues(int id)
        {
            SqlCommand command = new SqlCommand("Select * from Question where id_Question=@id");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@id", id);

            return SQLDB.SQLDB.GetData(command);
        }
        public DataTable GetListByStatus(bool status)
        {
            SqlCommand command = new SqlCommand("Select * from Question where status=@status");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@status", status);

            return SQLDB.SQLDB.GetData(command);
        }
        public DataTable GetListByContent(string content)
        {
            SqlCommand command = new SqlCommand("Select * from Question where content LIKE N'%' + @content + '%'");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@content", content);

            return SQLDB.SQLDB.GetData(command);
        }
        public void Insert(string content, bool status, bool obli, string img, DateTime create, DateTime update, bool active)
        {
            SqlCommand command = new SqlCommand("Insert into Question values(@content,@status,@obli,@img,@create,'',@update,'',@active)");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@content", content);
            command.Parameters.AddWithValue("@status", status);
            command.Parameters.AddWithValue("@obli", obli);
            command.Parameters.AddWithValue("@img", img);
            command.Parameters.AddWithValue("@create", create);
            command.Parameters.AddWithValue("@update", update);
            command.Parameters.AddWithValue("@active", active);

            SQLDB.SQLDB.ExecuteNoneQuery(command);
        }
        public void Update(int id, string content, bool status, bool obli, string img, DateTime create, DateTime update, bool active)
        {
            SqlCommand command = new SqlCommand("Update Question set [content]=@content, status=@status, obligatory=@obli, image_Des=@img, created_Date=@create, updated_Date=@update, active=@active where id_Question=@id");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@content", content);
            command.Parameters.AddWithValue("@status", status);
            command.Parameters.AddWithValue("@obli", obli);
            command.Parameters.AddWithValue("@img", img);
            command.Parameters.AddWithValue("@create", create);
            command.Parameters.AddWithValue("@update", update);
            command.Parameters.AddWithValue("@active", active);
            command.Parameters.AddWithValue("@id", id);

            SQLDB.SQLDB.ExecuteNoneQuery(command);
        }
        public void Delete(int id)
        {
            SqlCommand command = new SqlCommand("Delete from Question where id_Question=@id");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@id", id);

            SQLDB.SQLDB.ExecuteNoneQuery(command);
        }
    }
}