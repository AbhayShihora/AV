using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Attendance_System
{
    public partial class Add_Subject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFacultyDropdown();
            }
        }

        private void LoadFacultyDropdown()
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT unm FROM [user]", conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    faculty.Items.Add(new ListItem(reader["unm"].ToString()));
                }
            }
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO [Subject] (sub_code, sub_name, sub_teacher, sub_class, sub_sem, sub_div) VALUES (@sub_code, @sub_name, @sub_teacher, @sub_class, @sub_sem, @sub_div)", conn);
                cmd.Parameters.AddWithValue("@sub_code", subCode.Text);
                cmd.Parameters.AddWithValue("@sub_name", subName.Text);
                cmd.Parameters.AddWithValue("@sub_teacher", faculty.SelectedValue);
                cmd.Parameters.AddWithValue("@sub_class", ddlClass.SelectedValue);
                cmd.Parameters.AddWithValue("@sub_sem", ddlSem.SelectedValue);
                cmd.Parameters.AddWithValue("@sub_div", ddlDivision.SelectedValue);

                cmd.ExecuteNonQuery();

                msg.Text = "Subject Inserted!";
            }
        }
    }
}