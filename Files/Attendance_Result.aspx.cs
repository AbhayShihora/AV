using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Attendance_System
{
    public partial class Attendance_Result : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT dt, class, sem, div, subject, session, rno, snm FROM Attendance WHERE dt=@dt AND class=@class AND sem=@sem AND div=@div AND subject=@subject AND session=@session";

                String class1 = Session["class"].ToString();
                String sem = Session["sem"].ToString();
                String div = Session["div"].ToString();
                String dt = Session["dt"].ToString();
                String sub = Session["sub"].ToString();
                String ses = Session["ses"].ToString();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@dt", dt);
                    command.Parameters.AddWithValue("@class", class1);
                    command.Parameters.AddWithValue("@sem", sem);
                    command.Parameters.AddWithValue("@div", div);
                    command.Parameters.AddWithValue("@subject", sub);
                    command.Parameters.AddWithValue("@session", ses);

                    SqlDataReader reader = command.ExecuteReader();

                    txtdt.Text = "Date : " + dt;
                    txtclass.Text = "Class : " + class1;
                    txtsem.Text = "Semester : " + sem;
                    txtdiv.Text = "Division : " + div;
                    txtsub.Text = "Subject : " + sub;
                    txtses.Text = "Session : " + ses;

                    tblResult.Rows.Clear();

                    TableRow headerRow = new TableRow();
                    headerRow.BackColor = System.Drawing.ColorTranslator.FromHtml("#337AB7"); // blue color
                    headerRow.Font.Bold = true;

                    TableCell headerCell7 = new TableCell();
                    headerCell7.Text = "Roll Number";
                    headerCell7.HorizontalAlign = HorizontalAlign.Center;
                    headerRow.Cells.Add(headerCell7);

                    TableCell headerCell8 = new TableCell();
                    headerCell8.Text = "Student Name";
                    headerCell8.HorizontalAlign = HorizontalAlign.Center;
                    headerRow.Cells.Add(headerCell8);

                    tblResult.Rows.Add(headerRow);

                    while (reader.Read())
                    {
                        string date = reader["dt"].ToString();
                        string className = reader["class"].ToString();
                        string semester = reader["sem"].ToString();
                        string division = reader["div"].ToString();
                        string subject = reader["subject"].ToString();
                        string session = reader["session"].ToString();
                        string rollNumber = reader["rno"].ToString();
                        string studentName = reader["snm"].ToString();

                        TableRow row = new TableRow();

                        TableCell cell7 = new TableCell();
                        cell7.Text = rollNumber;
                        row.Cells.Add(cell7);

                        TableCell cell8 = new TableCell();
                        cell8.Text = studentName;
                        row.Cells.Add(cell8);

                        tblResult.Rows.Add(row);
                    }
                }
            }
        }
    }
}