using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DataWebApp.Model
{
    public class User
    {
        public DataTable GetUserListAll()
        {
            SqlCommand command = new SqlCommand("Select * from User_ where active='True'");
            command.CommandType = CommandType.Text;
            return SQLDB.SQLDB.GetData(command);
        }
        public DataTable GetUserListByStudentCode(string code)
        {
            SqlCommand command = new SqlCommand("Select * from User_ where active='True' and student_Code=@code");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@code", code);

            return SQLDB.SQLDB.GetData(command);
        }
        public DataTable GetUserByID(int id)
        {
            SqlCommand command = new SqlCommand("Select * from User_ where active='True' and id_User=@id");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@id", id);

            return SQLDB.SQLDB.GetData(command);
        }
        public DataTable GetUserListByIDGroup(int idG)
        {
            SqlCommand command = new SqlCommand("Select * from User_ where active='True' and id_Group=@idG");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@idG", idG);
            return SQLDB.SQLDB.GetData(command);
        }
        public void Insert(int idGroup, string studentCode, string name, bool gener, string cmt, 
            DateTime birthday, string address, string phone, string email, DateTime create, DateTime update, bool status, bool active)
        {
            SqlCommand command = new SqlCommand(
                "Insert into User_ values(@idGroup,@studentCode,@name,@gener," +
                "@cmt,@birthday,@address,@phone,@email,@status,@create,'',@update,'',@active)");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@idGroup", idGroup);
            command.Parameters.AddWithValue("@studentCode", studentCode);
            command.Parameters.AddWithValue("@name", name);
            command.Parameters.AddWithValue("@gener", gener);
            command.Parameters.AddWithValue("@cmt", cmt);
            command.Parameters.AddWithValue("@birthday", birthday);
            command.Parameters.AddWithValue("@address", address);
            command.Parameters.AddWithValue("@phone", phone);
            command.Parameters.AddWithValue("@email", email);
            command.Parameters.AddWithValue("@create", create);
            command.Parameters.AddWithValue("@update", update);
            command.Parameters.AddWithValue("@status", status);
            command.Parameters.AddWithValue("@active", active);

            SQLDB.SQLDB.ExecuteNoneQuery(command);
        }
        public void Update(int id, int idGroup, string studentCode, string name, bool gener, string cmt,
            DateTime birthday, string address, string phone, string email, DateTime update, bool status, bool active)
        {
            SqlCommand command = new SqlCommand("Update User_ set id_Group=@idGroup,student_Code=@studentCode," +
                "name=@name,gener=@gener,cmt=@cmt,birthday=@birthday,address=@address,phone=@phone,email=@email," +
                "status=@status,updated_Date=@update,active=@active where id_User=@id");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@idGroup", idGroup);
            command.Parameters.AddWithValue("@studentCode", studentCode);
            command.Parameters.AddWithValue("@name", name);
            command.Parameters.AddWithValue("@gener", gener);
            command.Parameters.AddWithValue("@cmt", cmt);
            command.Parameters.AddWithValue("@birthday", birthday);
            command.Parameters.AddWithValue("@address", address);
            command.Parameters.AddWithValue("@phone", phone);
            command.Parameters.AddWithValue("@email", email);
            command.Parameters.AddWithValue("@update", update);
            command.Parameters.AddWithValue("@status", status);
            command.Parameters.AddWithValue("@active", active);
            command.Parameters.AddWithValue("@id", id);

            SQLDB.SQLDB.ExecuteNoneQuery(command);
        }
        public void UpdateByStudentCode(int idGroup, string studentCode, string name, bool gener, string cmt,
            DateTime birthday, string address, string phone, string email, DateTime update, bool status, bool active)
        {
            SqlCommand command = new SqlCommand("Update User_ set id_Group=@idGroup," +
                "name=@name,gener=@gener,cmt=@cmt,birthday=@birthday,address=@address,phone=@phone,email=@email," +
                "status=@status,updated_Date=@update, active=@active where student_Code=@studentCode");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@idGroup", idGroup);
            command.Parameters.AddWithValue("@studentCode", studentCode);
            command.Parameters.AddWithValue("@name", name);
            command.Parameters.AddWithValue("@gener", gener);
            command.Parameters.AddWithValue("@cmt", cmt);
            command.Parameters.AddWithValue("@birthday", birthday);
            command.Parameters.AddWithValue("@address", address);
            command.Parameters.AddWithValue("@phone", phone);
            command.Parameters.AddWithValue("@email", email);
            command.Parameters.AddWithValue("@update", update);
            command.Parameters.AddWithValue("@status", status);
            command.Parameters.AddWithValue("@active", active);

            SQLDB.SQLDB.ExecuteNoneQuery(command);
        }
        public void UpdateStatus(int id, bool status)
        {
            SqlCommand command = new SqlCommand("Update User_ set status=@status where id_User=@id");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@status", status);
            command.Parameters.AddWithValue("@id", id);

            SQLDB.SQLDB.ExecuteNoneQuery(command);
        }
        public void Delete(int id)
        {
            SqlCommand command = new SqlCommand("Update User_ set active='False' where id_User=@id");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@id", id);

            SQLDB.SQLDB.ExecuteNoneQuery(command);
        }
    }
}