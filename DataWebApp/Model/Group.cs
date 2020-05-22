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
    }
}