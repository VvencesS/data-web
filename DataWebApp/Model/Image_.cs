﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DataWebApp.Model
{
    public class Image_
    {
        public DataTable GetImageListByIDUser(int id)
        {
            SqlCommand command = new SqlCommand("Select User_.id_User, Image_.id_Image, Image_.image_Path, Image_.note," +
                "Image_.status, Question.id_Question, Question.[content], Question.image_Des, Question.active " +
                "from Image_ inner join User_ on Image_.id_User = User_.id_User inner join Question on Image_.id_Question = Question.id_Question where User_.id_User=@id");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@id", id);

            return SQLDB.SQLDB.GetData(command);
        }
        public DataTable GetUserImagesByIDGroup(int id)
        {
            SqlCommand command = new SqlCommand("Select User_.id_User, User_.student_Code, User_.name, User_.gener, User_.cmt, User_.email, Image_.note," +
                "User_.birthday, User_.address, User_.phone, User_.status, User_.id_Group, Image_.id_Image, Image_.image_Path, Image_.status as statusImg, " +
                "Question.id_Question, Question.[content], Question.image_Des, Question.active " +
                "from Image_ inner join User_ on Image_.id_User = User_.id_User inner join Question on " +
                "Image_.id_Question = Question.id_Question where User_.status = 'True' and User_.id_Group=@id");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@id", id);

            return SQLDB.SQLDB.GetData(command);
        }
        public DataTable GetImageListByIDImg(int id)
        {
            SqlCommand command = new SqlCommand("Select User_.id_User, Image_.image_Path, Image_.note, User_.id_Group," +
                "Image_.status, Question.id_Question, Question.[content], Question.image_Des, Question.active " +
                "from Image_ inner join User_ on Image_.id_User = User_.id_User inner join Question on Image_.id_Question = Question.id_Question where id_Image=@id");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@id", id);

            return SQLDB.SQLDB.GetData(command);
        }
        public void Insert(string image_Path, int id_User, int id_Question, DateTime create, DateTime update, bool status, string note)
        {
            SqlCommand command = new SqlCommand("Insert into Image_ values(@image_Path,@status, @create, '', @update, '',@id_User,@id_Question,@note)");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@image_Path", image_Path);
            command.Parameters.AddWithValue("@id_User", id_User);
            command.Parameters.AddWithValue("@id_Question", id_Question);
            command.Parameters.AddWithValue("@create", create);
            command.Parameters.AddWithValue("@update", update);
            command.Parameters.AddWithValue("@status", status);
            command.Parameters.AddWithValue("@note", note);

            SQLDB.SQLDB.ExecuteNoneQuery(command);
        }
        public void Update(int id, string image_Path, DateTime update, string note)
        {
            SqlCommand command = new SqlCommand("Update Image_ set image_Path=@image_Path, updated_Date=@update, note=@note where id_Image=@id");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@image_Path", image_Path);
            command.Parameters.AddWithValue("@update", update);
            command.Parameters.AddWithValue("@note", note);
            command.Parameters.AddWithValue("@id", id);

            SQLDB.SQLDB.ExecuteNoneQuery(command);
        }
        public void CensorshipImg(int id, bool status, DateTime update, string note)
        {
            SqlCommand command = new SqlCommand("Update Image_ set status=@status, updated_Date=@update, note=@note where id_Image=@id");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@status", status);
            command.Parameters.AddWithValue("@update", update);
            command.Parameters.AddWithValue("@note", note);
            command.Parameters.AddWithValue("@id", id);

            SQLDB.SQLDB.ExecuteNoneQuery(command);
        }
    }
}