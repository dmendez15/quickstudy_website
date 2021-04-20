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
    public partial class LogInWebform : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                using (SqlConnection sqlCon = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\UserDatabase.mdf;Integrated Security=True"))
                {
                    sqlCon.Open();
                    string query = "select count(1) from Users where User_UserName=@username and User_Password=@password";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@username", txtboxUserName.Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@password", txtboxPassword.Text.Trim());
                    int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
                    if (count == 1)
                    {
                        Session["username"] = txtboxUserName.Text.Trim();
                        Response.Redirect("HomePage.aspx");
                        // To have a user Log Out, place these next 2 lines on a log out button click:
                        // Session.Abandon();
                        // Response.Redirect("LogInWebform.aspx");
                    }
                    
                    sqlCon.Close();
                }
            }
        }
    }
}