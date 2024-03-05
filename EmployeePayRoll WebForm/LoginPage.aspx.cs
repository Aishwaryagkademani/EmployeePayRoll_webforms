using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeePayRoll_WebForm
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (Request.Cookies["Login"] != null)
                {
                    // Response.Redirect("HomePage");
                    EmployeeId.Text = Request.Cookies["Login"]["EmployeeId"];
                    FullName.Text = Request.Cookies["Login"]["EmployeeName"];
                    Remember.Checked = true;
                }

            }

        }

        string connectionString = @"Server=DESKTOP-BD26R3U\SQLEXPRESS;Database=EmployeePayRoll_WebForm_DB;Trusted_Connection=True;TrustServerCertificate=True;MultipleActiveResultSets=true";

        protected void LoginButton(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("login_sp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Eid", int.Parse(EmployeeId.Text));
            cmd.Parameters.Add("@FullName", FullName.Text);
            var res= cmd.ExecuteReader();
            if (res !=null)
            {
                //Cookies are used
                if (Remember.Checked)
                {
                    // LoginButton(sender,e);
                    HttpCookie cookie = new HttpCookie("Login");
                    cookie["EmployeeId"] = EmployeeId.Text;
                    cookie["EmployeeName"] = FullName.Text;
                    cookie.Expires = DateTime.Now.AddMinutes(30);
                    Response.Cookies.Add(cookie);
                }
                //sessions are used
                if (Remember.Checked)
                {
                    Session["EmployeeId"] = EmployeeId.Text;
                    Session["EmployeeName"]= FullName.Text;
                  
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Logined');", true);
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('User not found , Register first');", true);
                
            }


        }
    }
}