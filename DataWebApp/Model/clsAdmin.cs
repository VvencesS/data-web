using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace DataWebApp.Model
{
    public class clsAdmin
    {
        public DataTable Login(string userName, string password)
        {
            SqlCommand command = new SqlCommand("Select * from Admin where user_Name=@userName and password=@password");
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@userName", userName);
            command.Parameters.AddWithValue("@password", BuildPassword(password));

            return SQLDB.SQLDB.GetData(command);
        }
        protected string BuildPassword(string input)
        {
            MD5 md5Hasher = MD5.Create();
            byte[] data = md5Hasher.ComputeHash(Encoding.Default.GetBytes(input));
            StringBuilder stringBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                stringBuilder.Append(data[i].ToString("x2"));
            }
            return stringBuilder.ToString();
        }
    }
}