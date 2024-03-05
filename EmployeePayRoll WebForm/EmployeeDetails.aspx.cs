using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Drawing;

namespace EmployeePayRoll_WebForm
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //imagebindGrid();
            string connectionString = @"Server=DESKTOP-BD26R3U\SQLEXPRESS;Database=EmployeePayRoll_WebForm_DB;Trusted_Connection=True;TrustServerCertificate=True;MultipleActiveResultSets=true";

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("GetAllEmployees", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader read = cmd.ExecuteReader();
            while(read.Read())
            {
                TableRow row= new TableRow();
                for(int i = 0; i < read.FieldCount; i++)
                {
                    TableCell cell = new TableCell();
                    cell.Text = read[i].ToString();
                    row.Cells.Add(cell);
                }
                Table.Rows.Add(row);
            }

        }

        //public void imagebindGrid()
        //{
        //    string connectionString = @"Server=DESKTOP-BD26R3U\SQLEXPRESS;Database=EmployeePayRoll_WebForm_DB;Trusted_Connection=True;TrustServerCertificate=True;MultipleActiveResultSets=true";

        //    SqlConnection con = new SqlConnection(connectionString);
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("GetAllEmployees", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    SqlDataReader dr = cmd.ExecuteReader();
        //    empGridView.DataSource = dr;
        //    empGridView.DataBind();
        //    con.Close();
        //}
    }
}