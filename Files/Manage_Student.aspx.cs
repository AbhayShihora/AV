using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using static Project_Attendance_System.Files.Attendance;

namespace Project_Attendance_System.Files
{
    public partial class Manage_Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //BindGrid();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";
            string query = "SELECT * FROM student WHERE class = @class AND sem = @sem AND div = @div ORDER BY snm ASC";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@class", ddlCourse.SelectedValue);
                    command.Parameters.AddWithValue("@sem", ddlSemester.SelectedValue);
                    command.Parameters.AddWithValue("@div", ddlDivision.SelectedValue);

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable table = new DataTable();
                        adapter.Fill(table);

                        gvStudents.DataSource = table;
                        gvStudents.DataBind();

                        if (table.Rows.Count == 0)
                        {
                            txtNoStudent.Text = "No any single Student is in " + ddlCourse.SelectedValue + " Sem-" + ddlSemester.SelectedValue + " Division-" + ddlDivision.SelectedValue + ".";
                            txtNoStudent.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {
                            txtNoStudent.Text = "Total " + table.Rows.Count.ToString() + " Students are there in " + ddlCourse.SelectedValue + " Sem-" + ddlSemester.SelectedValue + " Division-" + ddlDivision.SelectedValue + ".";
                            txtNoStudent.ForeColor = System.Drawing.Color.Green;
                        }
                        
                    }
                }
            }
        }

        private void BindGrid()
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";
            string query = "SELECT * FROM student";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable table = new DataTable();
                        adapter.Fill(table);

                        gvStudents.DataSource = table;
                        gvStudents.DataBind();
                    }
                }
            }
        }

        protected void gvStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateStudent")
            {
                int studentId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Update_Student_Details.aspx?Id=" + studentId);
            }
            else if (e.CommandName == "DeleteStudent")
            {
                int studentId = Convert.ToInt32(e.CommandArgument);
                DeleteStudent(studentId);

                // After Deletind Record, Display new data
                string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";
                string query = "SELECT * FROM student WHERE class = @class AND sem = @sem AND div = @div ORDER BY snm ASC";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@class", ddlCourse.SelectedValue);
                        command.Parameters.AddWithValue("@sem", ddlSemester.SelectedValue);
                        command.Parameters.AddWithValue("@div", ddlDivision.SelectedValue);

                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            DataTable table = new DataTable();
                            adapter.Fill(table);

                            gvStudents.DataSource = table;
                            gvStudents.DataBind();
                        }
                    }
                }
            }
            else if (e.CommandName == "ViewStudent")
            {
                int studentId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("View_Student_Details.aspx?Id=" + studentId);
            }
        }

        private void DeleteStudent(int studentId)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";

            // First, delete all attendance records for the student
            string query = "DELETE FROM Attendance WHERE rno IN (SELECT rno FROM student WHERE Id = @Id)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id", studentId);
                    command.ExecuteNonQuery();
                }
            }

            // Then, delete the student record
            query = "DELETE FROM student WHERE Id = @Id";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id", studentId);
                    command.ExecuteNonQuery();

                }
            }

                        //BindGrid(); // Rebind the grid to reflect the changes
                    }
        protected void AddStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("addstud.aspx");
        }
    }
}