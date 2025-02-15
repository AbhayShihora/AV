using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Project_Attendance_System.Files
{
    public partial class Admin_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";
                string query = "SELECT * FROM [dbo].[Teacher] WHERE unm = @unm AND psw = @psw";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@unm", txtUserName.Text);
                        command.Parameters.AddWithValue("@psw", txtPassword.Text);

                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                // User credentials are correct, redirect to Home.aspx
                                Response.Redirect("Home_Admin.aspx");
                            }
                        }
                        else
                        {
                            // User credentials are incorrect, display error message
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            lblMessage.Text = "Invalid User Name or Password";
                        }
                    }
                }
            }
        }
    }
}