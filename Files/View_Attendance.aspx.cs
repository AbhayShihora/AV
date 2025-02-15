using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_Attendance_System
{
    public partial class View_Attendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvAttendance.DataSource = null;
                gvAttendance.DataBind();

                LoadFacultyDropdown();
            }
        }
        private void LoadFacultyDropdown()
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT sub_name FROM [Subject]", conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    ddlSubject.Items.Add(new ListItem(reader["sub_name"].ToString()));
                }
            }
        }
        protected void btnFilter_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\SEM-5\\Project\\Project_Attendance_System\\App_Data\\Attendance_System.mdf;Integrated Security=True";
            string query = "SELECT * FROM Attendance";

            List<SqlParameter> parameters = new List<SqlParameter>();

            bool whereAdded = false;

            if (!string.IsNullOrEmpty(txtRollNumber.Text))
            {
                if (!whereAdded)
                {
                    query += " WHERE rno = @rno";
                    whereAdded = true;
                }
                else
                {
                    query += " AND rno = @rno";
                }
                parameters.Add(new SqlParameter("@rno", txtRollNumber.Text));
            }

            if (!string.IsNullOrEmpty(txtName.Text))
            {
                if (!whereAdded)
                {
                    query += " WHERE snm = @snm";
                    whereAdded = true;
                }
                else
                {
                    query += " AND snm = @snm";
                }
                parameters.Add(new SqlParameter("@snm", txtName.Text));
            }

            if (!string.IsNullOrEmpty(txtStartDate.Text))
            {
                if (!whereAdded)
                {
                    query += " WHERE dt >= @sdt";
                    whereAdded = true;
                }
                else
                {
                    query += " AND dt >= @sdt";
                }
                parameters.Add(new SqlParameter("@sdt", txtStartDate.Text));
            }

            if (!string.IsNullOrEmpty(txtEndDate.Text))
            {
                if (!whereAdded)
                {
                    query += " WHERE dt <= @edt";
                    whereAdded = true;
                }
                else
                {
                    query += " AND dt <= @edt";
                }
                parameters.Add(new SqlParameter("@edt", txtEndDate.Text));
            }

            if (!string.IsNullOrEmpty(ddlClass.SelectedValue))
            {
                if (!whereAdded)
                {
                    query += " WHERE class = @class";
                    whereAdded = true;
                }
                else
                {
                    query += " AND class = @class";
                }
                parameters.Add(new SqlParameter("@class", ddlClass.SelectedValue));
            }

            if (!string.IsNullOrEmpty(ddlSem.SelectedValue))
            {
                if (!whereAdded)
                {
                    query += " WHERE sem = @sem";
                    whereAdded = true;
                }
                else
                {
                    query += " AND sem = @sem";
                }
                parameters.Add(new SqlParameter("@sem", ddlSem.SelectedValue));
            }

            if (!string.IsNullOrEmpty(ddlDivision.SelectedValue))
            {
                if (!whereAdded)
                {
                    query += " WHERE div = @div";
                    whereAdded = true;
                }
                else
                {
                    query += " AND div = @div";
                }
                parameters.Add(new SqlParameter("@div", ddlDivision.SelectedValue));
            }

            if (!string.IsNullOrEmpty(ddlSubject.SelectedValue))
            {
                if (!whereAdded)
                {
                    query += " WHERE subject = @subject";
                    whereAdded = true;
                }
                else
                {
                    query += " AND subject = @subject";
                }
                parameters.Add(new SqlParameter("@subject", ddlSubject.SelectedValue));
            }

            if (!string.IsNullOrEmpty(ddlSession.SelectedValue))
            {
                if (!whereAdded)
                {
                    query += " WHERE session = @session";
                    whereAdded = true;
                }
                else
                {
                    query += " AND session = @session";
                }
                parameters.Add(new SqlParameter("@session", ddlSession.SelectedValue));
            }

            if (!whereAdded)
            {
                query += " WHERE attendance = @att";
                whereAdded = true;
            }
            else
            {
                query += " AND attendance = @att";
            }
            parameters.Add(new SqlParameter("@att", "P"));

            query += " ORDER BY dt,session,snm ASC;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddRange(parameters.ToArray());

                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable table = new DataTable();
                adapter.Fill(table);

                gvAttendance.DataSource = table;
                gvAttendance.DataBind();

            }
        }

    }
}