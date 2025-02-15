using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data;

namespace Project_Attendance_System.Files
{
    public partial class Attendance : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {            
            Session["class"] = ddlClass.SelectedValue.ToString();
            Session["sem"] = ddlSem.SelectedValue.ToString();
            Session["div"] = ddlDivision.SelectedValue.ToString();
            Session["dt"] = txtDate.Text.ToString();
            Session["sub"] = txtSubject.Text.ToString();
            Session["ses"] = txtSession.Text.ToString();

            Response.Redirect("Attendance_Take.aspx");

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
                            string query = "SELECT * FROM attendance WHERE dt = @dt AND class = @class AND sem = @sem AND session = @ses AND rno = @rno";

                            using (SqlCommand command = new SqlCommand(query, connection))
                            {
                                command.Parameters.AddWithValue("@dt", row["dt"]);
                                command.Parameters.AddWithValue("@class", row["class"]);
                                command.Parameters.AddWithValue("@sem", row["sem"]);
                                command.Parameters.AddWithValue("@ses", row["session"]);
                                command.Parameters.AddWithValue("@rno", row["rno"]);

                                using (SqlDataReader reader1 = command.ExecuteReader())
                                {
                                    if (!reader1.HasRows)
                                    {
                                        reader1.Close(); // Close the DataReader

                                        // Insert the data if it doesn't exist
                                        query = "INSERT INTO attendance (dt, class, sem, div,subject, session, rno, snm, attendance) VALUES (@dt, @class, @sem, @div, @sub, @ses, @rno, @snm, @att)";

                                        using (SqlCommand insertCommand = new SqlCommand(query, connection))
                                        {
                                            insertCommand.Parameters.AddWithValue("@dt", row["dt"]);
                                            insertCommand.Parameters.AddWithValue("@class", row["class"]);
                                            insertCommand.Parameters.AddWithValue("@sem", row["sem"]);
                                            insertCommand.Parameters.AddWithValue("@div", row["div"]);
                                            insertCommand.Parameters.AddWithValue("@ses", row["session"]);
                                            insertCommand.Parameters.AddWithValue("@sub", row["subject"]);
                                            insertCommand.Parameters.AddWithValue("@rno", row["rno"]);
                                            insertCommand.Parameters.AddWithValue("@snm", row["snm"]);
                                            insertCommand.Parameters.AddWithValue("@att", "P");

                                            insertCommand.ExecuteNonQuery();
                                            Response.Write("Data Inserted Successfully!");
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
        public class Student
        {
            public string Rno { get; set; }
            public string Snm { get; set; }
        }
 
    }
}