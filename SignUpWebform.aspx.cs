using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace QuickStudyWebsite
{
    public partial class SignUpWebform : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                using (SqlConnection sqlCon = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\UserDatabase.mdf;Integrated Security=True"))
                {
                    sqlCon.Open();
                    string query = "select count(1) from Users where User_UserName=@username or User_Email=@email";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@username", txtboxUserName.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@email", txtboxEmail.Text.Trim());
                    int count = Convert.ToInt32(sqlCmd.ExecuteScalar());

                    if (count >= 1)
                    {
                        Response.Write("Username or Email already exists.");
                    }
                    else
                    {
                        string insert = "insert into Users (User_UserName,User_Email,User_Password) values (@username, @email, @password)";
                        SqlCommand cmd = new SqlCommand(insert, sqlCon);
                        cmd.Parameters.AddWithValue("@username", txtboxUserName.Text.Trim());
                        cmd.Parameters.AddWithValue("@email", txtboxEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@password", txtboxPassword.Text.Trim());

                        cmd.ExecuteNonQuery();
                        Response.Redirect("LogInWebform.aspx");
                    }
                    sqlCon.Close();
                }
            }
        }
    }
}