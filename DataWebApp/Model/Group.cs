using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DataWebApp.Model
{
    public class Group
    {
        public DataTable GetTruongList()
        {
            SqlCommand command = new SqlCommand("Select * from Group_ where level_Group=1");
            command.CommandType = CommandType.Text;
            return SQLDB.SQLDB.GetData(command);
        }
        public DataTable GetKhoaList()
        {
            SqlCommand command = new SqlCommand("Select * from Group_ where level_Group=2 and active='True'");
            command.CommandType = CommandType.Text;
            return SQLDB.SQLDB.GetData(command);
        }
        public DataTable GetLopList()
        {
            SqlCommand command = new SqlCommand("Select * from Group_ where level_Group=3 and active='True'");
            command.CommandType = CommandType.Text;
            return SQLDB.SQLDB.GetData(command);
        }
        public DataTable GetKhoaListByTruong(int parentGroup)
        {
            SqlCommand command = new SqlCommand("Select * from Group_ where level_Group=2 and parent_Group=@parentGroup and active='True'");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@parentGroup", parentGroup);
            return SQLDB.SQLDB.GetData(command);
        }
        public DataTable GetLopListByKhoa(int parentGroup)
        {
            SqlCommand command = new SqlCommand("Select * from Group_ where level_Group=3 and parent_Group=@parentGroup and active='True'");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@parentGroup", parentGroup);
            return SQLDB.SQLDB.GetData(command);
        }
        public DataTable GetGroupList()
        {
            SqlCommand command = new SqlCommand("Select * from Group_ order by level_Group");
            command.CommandType = CommandType.Text;

            return SQLDB.SQLDB.GetData(command);
        }
        public void Insert(string name, int level, int parent, DateTime create, DateTime update, bool active)
        {
            SqlCommand command = new SqlCommand("Insert into Group_ values(@name,@level,@parent, @create, '', @update, '',@active)");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@name", name);
            command.Parameters.AddWithValue("@level", level);
            command.Parameters.AddWithValue("@parent", parent);
            command.Parameters.AddWithValue("@create", create);
            command.Parameters.AddWithValue("@update", update);
            command.Parameters.AddWithValue("@active", active);

            SQLDB.SQLDB.ExecuteNoneQuery(command);
        }
        public void Update(int id, string name, int level, int parent, DateTime create, DateTime update, bool active)
        {
            SqlCommand command = new SqlCommand("Update Group_ set name_Group=@name, level_Group=@level, parent_Group=@parent, created_Date=@create, updated_Date=@update, active=@active where id_Group=@id");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@name", name);
            command.Parameters.AddWithValue("@level", level);
            command.Parameters.AddWithValue("@parent", parent);
            command.Parameters.AddWithValue("@create", create);
            command.Parameters.AddWithValue("@update", update);
            command.Parameters.AddWithValue("@active", active);
            command.Parameters.AddWithValue("@id", id);

            SQLDB.SQLDB.ExecuteNoneQuery(command);
        }
        public void Delete(int id)
        {
            SqlCommand command = new SqlCommand("Delete from Group_ where id_Group=@id");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@id", id);

            SQLDB.SQLDB.ExecuteNoneQuery(command);
        }
        public DataTable GetGroupByID(int id)
        {
            SqlCommand command = new SqlCommand("Select * from Group_ where id_Group=@id");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@id", id);

            return SQLDB.SQLDB.GetData(command);
        }
    }
}