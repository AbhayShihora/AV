using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Attendance_System.Files
{
    public partial class Manage_Subject : System.Web.UI.Page
    {
        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSubject();
            }
        }

        private void LoadSubject()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "SELECT Id, sub_code, sub_name, sub_teacher, sub_class, sub_sem, sub_div FROM [Subject]";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        gvTeachers.DataSource = dt;
                        gvTeachers.DataBind();
                    }
                    else
                    {
                        gvTeachers.DataSource = null;
                        gvTeachers.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }
        protected void gvTeachers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Update")
            {
                Response.Redirect("Update_Subject.aspx?id=" + id);
            }
            else if (e.CommandName == "Delete")
            {
                DeleteSubject(id);
            }
        }

        private void DeleteSubject(int id)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "DELETE FROM [Subject] WHERE Id = @Id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    LoadSubject(); // Refresh the GridView after deletion
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }

        protected void AddSubject_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_Subject.aspx");
        }
    }
}