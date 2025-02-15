using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Project_Attendance_System.Files
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";
                string query = "SELECT * FROM [dbo].[user] WHERE uid = @uid AND psw = @psw";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@uid", txtUserId.Text);
                        command.Parameters.AddWithValue("@psw", txtPassword.Text);

                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                // User credentials are correct, redirect to Home.aspx
                                Response.Redirect("Home.aspx");
                            }
                        }
                        else
                        {
                            // User credentials are incorrect, display error message
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            lblMessage.Text = "Invalid User ID or Password";
                        }
                    }
                }
            }
        }

        protected void ButtonLogin_Click1(object sender, EventArgs e)
        {
            // Call the Page_Load method to check user credentials
            Page_Load(sender, e);
        }
    }
}