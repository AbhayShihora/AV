using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Data.OleDb;

namespace Project_Attendance_System
{
    public partial class addstud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";

            string query = "INSERT INTO student (rno, snm, class, sem, div, mno) VALUES (@rno, @snm, @class, @sem, @div, @mno)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@rno", rollNumber.Text);
                    command.Parameters.AddWithValue("@snm", studentName.Text);
                    command.Parameters.AddWithValue("@class", ddlClass.SelectedValue);
                    command.Parameters.AddWithValue("@sem", ddlSem.SelectedValue);
                    command.Parameters.AddWithValue("@div", ddlDivision.SelectedValue);
                    command.Parameters.AddWithValue("@mno", mobileNumber.Text);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                    Response.Write("Data inserted successfully!");
                }
            }
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage_Student");
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string filePath = Server.MapPath("~/Uploads/") + FileUpload1.FileName;
                FileUpload1.SaveAs(filePath);

                string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";

                string excelConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath + ";Extended Properties=\"Excel 12.0 Xml;HDR=YES\"";

                using (OleDbConnection excelConnection = new OleDbConnection(excelConnectionString))
                {
                    excelConnection.Open();

                    OleDbCommand excelCommand = new OleDbCommand("SELECT * FROM [Sheet1$]", excelConnection);

                    OleDbDataReader excelReader = excelCommand.ExecuteReader();

                    DataTable dataTable = new DataTable();
                    dataTable.Load(excelReader);

                    excelReader.Close(); // Close the DataReader
                    excelConnection.Close();

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        foreach (DataRow row in dataTable.Rows)
                        {
                            string query = "SELECT * FROM student WHERE rno = @rno AND class = @class AND sem = @sem";

                            using (SqlCommand command = new SqlCommand(query, connection))
                            {
                                command.Parameters.AddWithValue("@rno", row["rno"]);
                                command.Parameters.AddWithValue("@class", row["class"]);
                                command.Parameters.AddWithValue("@sem", row["sem"]);

                                using (SqlDataReader reader1 = command.ExecuteReader())
                                {
                                    if (!reader1.HasRows)
                                    {
                                        reader1.Close(); // Close the DataReader

                                        // Insert the data if it doesn't exist
                                        query = "INSERT INTO student (rno, snm, class, sem, div, mno) VALUES (@rno, @snm, @class, @sem, @div, @mno)";

                                        using (SqlCommand insertCommand = new SqlCommand(query, connection))
                                        {
                                            insertCommand.Parameters.AddWithValue("@rno", row["rno"]);
                                            insertCommand.Parameters.AddWithValue("@snm", row["snm"]);
                                            insertCommand.Parameters.AddWithValue("@class", row["class"]);
                                            insertCommand.Parameters.AddWithValue("@sem", row["sem"]);
                                            insertCommand.Parameters.AddWithValue("@div", row["div"]);
                                            insertCommand.Parameters.AddWithValue("@mno", row["mno"].ToString().Substring(0, Math.Min(10, row["mno"].ToString().Length))); // Truncate the value to 10 characters

                                            insertCommand.ExecuteNonQuery();
                                        }
                                    }
                                    else
                                    {
                                        reader1.Close(); // Close the DataReader
                                    }
                                }
                            }
                        }

                        connection.Close();
                    }
                }
            }
            else
            {
                Response.Write("Please select a file to upload.");
            }
        }
    }
}