using System;
using System.Data;
using System.Data.SqlClient;

namespace Project_Attendance_System.Files
{
    public partial class View_Student_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int studentId = Convert.ToInt32(Request.QueryString["Id"]);
                DisplayStudentDetails(studentId);
            }
        }

        private void DisplayStudentDetails(int studentId)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";
            string query = "SELECT * FROM student WHERE Id = @Id";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id", studentId);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblRollNumber.Text = reader["rno"].ToString();
                            lblName.Text = reader["snm"].ToString();
                            lblClass.Text = reader["class"].ToString();
                            lblSemester.Text = reader["sem"].ToString();
                            lblDivision.Text = reader["div"].ToString();
                            lblMobileNumber.Text = reader["mno"].ToString();
                        }
                    }
                }
            }
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage_Student");
        }
    }
}