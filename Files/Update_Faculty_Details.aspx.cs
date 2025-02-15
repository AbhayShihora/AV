using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Project_Attendance_System.Files
{
    public partial class Update_Faculty_Details : System.Web.UI.Page
    {
        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // Only load data on first request
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    LoadFacultyDetails(id);
                }
                else
                {
                    Response.Write("<script>alert('No ID Provided!');</script>");
                }
            }
        }

        private void LoadFacultyDetails(int id)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "SELECT uid, unm, psw, email, mo FROM [user] WHERE Id = @Id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Id", id);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        txtUid.Text = reader["uid"].ToString();
                        txtFnm.Text = reader["unm"].ToString();
                        txtPsw.Text = reader["psw"].ToString();
                        txtemail.Text = reader["email"].ToString();
                        txtMo.Text = reader["mo"].ToString();
                    }
                    else
                    {
                        Response.Write("<script>alert('No record found!');</script>");
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            UpdateFacultyDetails(id);
        }

        private void UpdateFacultyDetails(int id)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "UPDATE [user] SET unm = @Name, email = @Email, psw = @psw, mo = @Mobile WHERE Id = @Id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Name", txtFnm.Text);
                    cmd.Parameters.AddWithValue("@Email", txtemail.Text);
                    cmd.Parameters.AddWithValue("@Mobile", txtMo.Text);
                    cmd.Parameters.AddWithValue("@psw", txtPsw.Text);
                    cmd.Parameters.AddWithValue("@Id", id);

                    int rows = cmd.ExecuteNonQuery();
                    if (rows > 0)
                    {
                        Response.Write("<script>alert('Faculty details updated successfully!');window.location='Manage_Teacher.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Update failed!');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage_Teacher.aspx");
        }
    }
}
