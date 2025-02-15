using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Attendance_System.Files
{
    public partial class Manage_Teacher : System.Web.UI.Page
    {
        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTeachers();
            }
        }

        private void LoadTeachers()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "SELECT Id, uid, unm, email, mo FROM [user]";
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
                Response.Redirect("Update_Teacher.aspx?id=" + id);
            }
            else if (e.CommandName == "Delete")
            {
                DeleteTeacher(id);
            }
        }

        private void DeleteTeacher(int id)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "DELETE FROM [user] WHERE Id = @Id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    LoadTeachers(); // Refresh the GridView after deletion
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }

        protected void AddFaculty_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Add_Teacher.aspx");
        }
    }
}
