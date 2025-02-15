using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Project_Attendance_System.Files
{
    public partial class Update_Student_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int studentId = Convert.ToInt32(Request.QueryString["Id"]);
                BindForm(studentId);
            }
        }

        private void BindForm(int studentId)
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
                        while (reader.Read())
                        {
                            txtRno.Text = reader["rno"].ToString();
                            txtSnm.Text = reader["snm"].ToString();
                            ddlCourse.Text = reader["class"].ToString();
                            txtSem.Text = reader["sem"].ToString();
                            txtDiv.Text = reader["div"].ToString();
                            txtMno.Text = reader["mno"].ToString();
                        }
                    }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int studentId = Convert.ToInt32(Request.QueryString["Id"]);
            UpdateStudent(studentId);
        }

        private void UpdateStudent(int studentId)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";
            string query = "UPDATE student SET rno = @rno, snm = @snm, class = @class, sem = @sem, div = @div, mno = @mno WHERE Id = @Id";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@rno", txtRno.Text);
                    command.Parameters.AddWithValue("@snm", txtSnm.Text);
                    command.Parameters.AddWithValue("@class", ddlCourse.SelectedValue);
                    command.Parameters.AddWithValue("@sem", txtSem.Text);
                    command.Parameters.AddWithValue("@div", txtDiv.Text);
                    command.Parameters.AddWithValue("@mno", txtMno.Text);
                    command.Parameters.AddWithValue("@Id", studentId);

                    command.ExecuteNonQuery();
                }
            }

            Response.Redirect("Manage_Student.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage_Student.aspx");
        }
    }
}