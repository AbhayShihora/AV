using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Project_Attendance_System.Files
{
    public partial class Add_Teacher : System.Web.UI.Page
    {
        // Connection String (Make sure to update the path if needed)
        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            lblErrorMessage.Text = "";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage_Teacher.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtUid.Text) || string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text) || string.IsNullOrWhiteSpace(txtMobile.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                lblErrorMessage.Text = "All fields are required.";
                return;
            }

            // Validate mobile number length
            if (txtMobile.Text.Length != 10)
            {
                lblErrorMessage.Text = "Mobile number must be exactly 10 digits.";
                return;
            }

            // Check if the UID already exists
            if (IsUserIdExists(txtUid.Text))
            {
                lblErrorMessage.Text = "User ID already exists. Please use a different User ID.";
                return;
            }

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO [user] (uid, unm, psw, mo, email) VALUES (@uid, @unm, @psw, @mo, @email)";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@uid", txtUid.Text.Trim());
                        command.Parameters.AddWithValue("@unm", txtName.Text.Trim());
                        command.Parameters.AddWithValue("@psw", txtPassword.Text.Trim());
                        command.Parameters.AddWithValue("@mo", txtMobile.Text.Trim());
                        command.Parameters.AddWithValue("@email", txtEmail.Text.Trim());

                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();
                        connection.Close();

                        if (rowsAffected > 0)
                        {
                            lblMessage.Text = "Faculty added successfully!";
                            ClearFields();
                        }
                        else
                        {
                            lblErrorMessage.Text = "Error! Unable to insert data.";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = "Error: " + ex.Message;
            }
        }

        // Check if the given User ID already exists in the database
        private bool IsUserIdExists(string uid)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM [user] WHERE uid = @uid";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@uid", uid);
                    connection.Open();
                    int count = (int)command.ExecuteScalar();
                    connection.Close();
                    return count > 0;
                }
            }
        }

        // Clear input fields after successful insert
        private void ClearFields()
        {
            txtUid.Text = "";
            txtName.Text = "";
            txtPassword.Text = "";
            txtMobile.Text = "";
            txtEmail.Text = "";
        }
    }
}
