using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Ajax.Utilities;

namespace EmployeePayRoll_WebForm
{
    public partial class ManupulateEmployeeDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string[] url = HttpContext.Current.Request.Url.AbsolutePath.Split('/');
            //int emp = Convert.ToInt32(url[2]);
            //SearchEmp(emp);
        }

        string connectionString = @"Server=DESKTOP-BD26R3U\SQLEXPRESS;Database=EmployeePayRoll_WebForm_DB;Trusted_Connection=True;TrustServerCertificate=True;MultipleActiveResultSets=true";

        protected void UpdateEmployeeDetails(object sender, EventArgs e)
        {

                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("UpdateEmployee", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@EmployeeId", int.Parse(EmployeeId.Text));
                cmd.Parameters.Add("@FullName", FullName.Text);
                cmd.Parameters.Add("@ImagePath", SelectImage.SelectedValue.ToString());
                cmd.Parameters.Add("@Gender", Gender.SelectedValue);
                cmd.Parameters.Add("@Department", Department.SelectedValue);
                cmd.Parameters.Add("@Salary", Salary.Text);
                cmd.Parameters.Add("@StartDate", StartDate.Value);
                cmd.Parameters.Add("@Notes", Notes.Text);
                var res = cmd.ExecuteNonQuery();
                con.Close();
                if (res > 0)
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Updated');", true);
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Update failed');", true);
          
        }

        protected void DeleteEmployeeDetails(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("DeleteEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@EmployeeId", int.Parse(EmployeeId.Text));
            var res = cmd.ExecuteNonQuery();
            con.Close();
            if (res > 0)
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Deleted');", true);
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Delete failed,Employee doesnot exist,Enter existing employee');", true);
        }

        protected void BascToList_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeDetails");
        }


        //Routing method to search employee by id
        public void SearchEmp(int emp)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("GetEmpByNameOrId", con);
            cmd.CommandType = CommandType.StoredProcedure;

            //Routing
            string EmpId = Page.RouteData.Values["id"] as string;

            if (emp > 0)
            {
                cmd.Parameters.AddWithValue("@EmployeeId", emp);
                cmd.Parameters.AddWithValue("@FullName", DBNull.Value);
            }

            Gridload(cmd);

        }

        protected void SearchEmployee(object sender, EventArgs e)
        {
           
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("GetEmpByNameOrId", con);
            cmd.CommandType = CommandType.StoredProcedure;

            

            // Check if EmployeeId.Text is empty, if not, search by ID
            if (!string.IsNullOrEmpty(EmployeeId.Text))
            {
                cmd.Parameters.AddWithValue("@EmployeeId", Convert.ToInt32(EmployeeId.Text));
            }
            else
            {
                // If EmployeeId.Text is empty, pass NULL as the parameter value
                cmd.Parameters.AddWithValue("@EmployeeId", DBNull.Value);
            }

            // Check if Fullname.Text is empty, if not, search by FullName
            if (!string.IsNullOrEmpty(FullName.Text))
            {
               cmd.Parameters.AddWithValue("@FullName", FullName.Text);
            }
            else
            {
                // If Fullname.Text is empty, pass NULL as the parameter value
                cmd.Parameters.AddWithValue("@FullName", DBNull.Value);
            }



            Gridload(cmd);
            //if (!string.IsNullOrEmpty(EmployeeId.Text))
            //{
            //    cmd.Parameters.Add("@EmployeeId", int.Parse(EmployeeId.Text));
            //    cmd.Parameters.Add("@FullName", DBNull.Value);
            //    var res = cmd.ExecuteReader();
            //    con.Close();
            //    if (res != null)
            //        Gridload(cmd);
            //    else
            //        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Search failed,Employee doesnot exist,Enter existing employee');", true);
            //}
            //else if(!string.IsNullOrEmpty(FullName.Text))
            //{
            //    cmd.Parameters.Add("@FullName", FullName.Text);
            //    cmd.Parameters.Add("@EmployeeId", DBNull.Value);
            //    var res = cmd.ExecuteReader();
            //    con.Close();
            //    if (res != null)
            //        Gridload(cmd);
            //    else
            //        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Search failed,Employee doesnot exist,Enter existing employee');", true);
            //}
            //else
            //{
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please provide name or id to search');", true);
            //}
        }

        public void Gridload(SqlCommand cmd)
        {
            SearchGridView.Visible = true;
            DataTable dt = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);

            adapter.Fill(dt);
            if(dt.Rows.Count ==0)
            {
                 ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Please provide valid name or id to search');", true);
            }
            else
            {
                // Bind the DataTable to the GridView
                SearchGridView.DataSource = dt;
                SearchGridView.DataBind();

            }
        }
    }
}