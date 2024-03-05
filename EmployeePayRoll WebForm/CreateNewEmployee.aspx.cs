using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeePayRoll_WebForm
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //ClearPage(sender, e);
            }

        }

        string connectionString = @"Server=DESKTOP-BD26R3U\SQLEXPRESS;Database=EmployeePayRoll_WebForm_DB;Trusted_Connection=True;TrustServerCertificate=True;MultipleActiveResultSets=true"; 
        protected void CreateEmployee(object sender, EventArgs e)
        {
            SqlConnection con=new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("InsertEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@FullName",FullName.Text);
            cmd.Parameters.Add("@ImagePath", SelectImage.SelectedValue.ToString());
            cmd.Parameters.Add("@Gender", Gender.SelectedValue);
            cmd.Parameters.Add("@Department", Department.SelectedValue);
            cmd.Parameters.Add("@Salary", Salary.Text);
            cmd.Parameters.Add("@StartDate", StartDate.Value);
            cmd.Parameters.Add("@Notes", Notes.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Created');", true);
          //  Response.Redirect("EmployeeDetails.aspx");
        }

        protected void ClearPage(object sender, EventArgs e)
        {
           // ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('refresh...,');window.location='CreateNewEmployee.aspx'", true);
           Response.Redirect("CreateNewEmployee.aspx");
        }
    }
}