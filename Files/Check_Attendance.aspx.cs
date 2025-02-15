using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Project_Attendance_System.Files
{
    public partial class Check_Attendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string course = ddlCourse.SelectedValue;
            string semester = ddlSemester.SelectedValue;
            string division = ddlDivision.SelectedValue;
            int totalSessions;

            if (string.IsNullOrEmpty(txtTotalSessions.Text))
                totalSessions = 0;
            else
                totalSessions = int.Parse(txtTotalSessions.Text);

            lblClass.Text = "Class : " + course;
            lblSem.Text = "Semester : " + semester;
            lblDiv.Text = "Division : " + division; ;

            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("SELECT s.snm, s.rno, COUNT(a.session) AS AttendedSessions " +
                                                    "FROM student s " +
                                                    "LEFT JOIN Attendance a ON s.rno = a.rno " +
                                                    "WHERE s.class = @course AND s.sem = @semester AND s.div = @division AND a.attendance = @att " +
                                                    "GROUP BY s.snm, s.rno ORDER BY s.snm ASC", connection);

                command.Parameters.AddWithValue("@course", course);
                command.Parameters.AddWithValue("@semester", semester);
                command.Parameters.AddWithValue("@division", division);
                command.Parameters.AddWithValue("@att", "P");

                DataTable dt = new DataTable();
                dt.Columns.Add("rno", typeof(string));
                dt.Columns.Add("snm", typeof(string));
                dt.Columns.Add("AttendedSessions", typeof(string));
                dt.Columns.Add("totalSessions", typeof(string));
                dt.Columns.Add("AttendancePercentage", typeof(string));

                SqlDataReader reader = command.ExecuteReader();
                dt.Load(reader);

                if (dt.Rows.Count == 0)
                {
                    gvAttendance.EmptyDataText = "<span style='color: red; font-size: 20px;'><b>No data found for the selected course, semester and division.</b></span>";
                    gvAttendance.DataBind();
                }
                else
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        row["totalSessions"] = totalSessions.ToString();
                        int attendedSessions = int.Parse(row["AttendedSessions"].ToString());
                        if (attendedSessions > 0)
                        {
                            double percentage = (attendedSessions / (double)totalSessions) * 100;
                            row["AttendancePercentage"] = percentage.ToString("F2") + "%";
                        }
                        else
                        {
                            row["AttendancePercentage"] = "0.00%";
                        }
                    }
                    gvAttendance.DataSource = dt;
                    gvAttendance.DataBind();
                }
            }
        }
        protected void gvAttendance_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string attendancePercentage = e.Row.Cells[4].Text;
                string percentage = attendancePercentage.Replace("%", "");

                if (double.Parse(percentage) < 50)
                {
                    e.Row.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}