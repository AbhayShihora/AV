using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Attendance_System
{
    public partial class Attendance_Tack : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string querys = "SELECT rno, snm FROM student where class=@class and sem=@sem and div=@div ORDER BY snm";

                String class1 = Session["class"].ToString();
                String sem = Session["sem"].ToString();
                String div = Session["div"].ToString();

                using (SqlCommand command = new SqlCommand(querys, connection))
                {
                    command.Parameters.AddWithValue("@class", class1);
                    command.Parameters.AddWithValue("@sem", sem);
                    command.Parameters.AddWithValue("@div", div);

                    SqlDataReader reader = command.ExecuteReader();

                    tblResult.Rows.Clear();

                    TableRow headerRow = new TableRow();
                    headerRow.BackColor = System.Drawing.ColorTranslator.FromHtml("#337AB7"); // blue color
                    headerRow.Font.Bold = true;

                    TableCell headerCell1 = new TableCell();
                    headerCell1.Text = "Roll Number";
                    headerCell1.HorizontalAlign = HorizontalAlign.Center;
                    headerRow.Cells.Add(headerCell1);

                    TableCell headerCell2 = new TableCell();
                    headerCell2.Text = "Student Name";
                    headerCell2.HorizontalAlign = HorizontalAlign.Center;
                    headerRow.Cells.Add(headerCell2);

                    TableCell headerCell3 = new TableCell();
                    headerCell3.Text = "Select";
                    headerCell3.HorizontalAlign = HorizontalAlign.Center;
                    headerRow.Cells.Add(headerCell3);

                    tblResult.Rows.Add(headerRow);

                    while (reader.Read())
                    {
                        string rno = reader["rno"].ToString();
                        string snm = reader["snm"].ToString();

                        TableRow row = new TableRow();

                        TableCell cell1 = new TableCell();
                        cell1.Text = rno;
                        row.Cells.Add(cell1);

                        TableCell cell2 = new TableCell();
                        cell2.Text = snm;
                        row.Cells.Add(cell2);

                        TableCell cell3 = new TableCell();
                        CheckBox checkBox = new CheckBox();
                        checkBox.ID = "chk_" + rno;
                        checkBox.AutoPostBack = true;
                        checkBox.CheckedChanged += new EventHandler(CheckBox_CheckedChanged);
                        cell3.Controls.Add(checkBox);
                        row.Cells.Add(cell3);

                        tblResult.Rows.Add(row);
                    }
                }
            }
        }

        protected void CheckBox_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox checkBox = (CheckBox)sender;
            TableRow row = (TableRow)checkBox.Parent.Parent;
            if (checkBox.Checked)
            {
                row.BackColor = System.Drawing.Color.PowderBlue;
            }
            else
            {
                row.BackColor = System.Drawing.Color.Empty;
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                int countp = 0;
                String class1 = Session["class"].ToString();
                String sem = Session["sem"].ToString();
                String div = Session["div"].ToString();
                String dt = Session["dt"].ToString();
                String sub = Session["sub"].ToString();
                String ses = Session["ses"].ToString();

                L1.Text = "Not Enter in foreach loop"; // Clear the label text
               
                foreach (TableRow row in tblResult.Rows)
                {
                    L1.Text = " --> loop";
                    if (row.Cells.Count >= 3)
                    {
                        L1.Text = "--> row.cell.count>0";
                        string rno = row.Cells[0].Text;
                        string snm = row.Cells[1].Text;

                        Control control = row.Cells[2].Controls.Count > 0 ? row.Cells[2].Controls[0] : null;
                        if (control is CheckBox)
                        {
                            L1.Text = "--> control is checkbox";
                            CheckBox checkBox = (CheckBox)control;
                            if (checkBox.Checked)
                            {
                                L1.Text = "--> checkbox.checked";
                                //L1.Text = "Roll Number: " + rno + ", Student Name: " + snm + "<br />";
                                countp++;
                                // Your existing code to insert attendance data into the database
                                string query = "INSERT INTO Attendance (dt, class, sem, div, subject, session, rno, snm, attendance) VALUES (@dt, @class, @sem, @div, @subject, @session, @rno, @snm, @att)";

                                using (SqlCommand command = new SqlCommand(query, connection))
                                {
                                    command.Parameters.AddWithValue("@dt", dt);
                                    command.Parameters.AddWithValue("@class", class1);
                                    command.Parameters.AddWithValue("@sem", sem);
                                    command.Parameters.AddWithValue("@div", div);
                                    command.Parameters.AddWithValue("@subject", sub);
                                    command.Parameters.AddWithValue("@session", ses);
                                    command.Parameters.AddWithValue("@rno", rno);
                                    command.Parameters.AddWithValue("@snm", snm);
                                    String att = "P";
                                    command.Parameters.AddWithValue("@att", att);
                                    
                                    //command.ExecuteNonQuery();
                                    try
                                    {
                                        int rowsAffected = command.ExecuteNonQuery();
                                        if (rowsAffected > 0)
                                        {
                                            L1.Text = "Attendance inserted successfully for " + countp + " Students. " + "<br />";

                                        }
                                    }
                                    catch (Exception ex)
                                    {
                                        L1.Text = "Error inserting attendance for " + rno + " - " + snm + ": " + ex.Message + "<br />";
                                    }
                                }
                            }
                            
                        }
                    }
                }
                Response.Redirect("Attendance_Result.aspx");
            }
        }
    }
}