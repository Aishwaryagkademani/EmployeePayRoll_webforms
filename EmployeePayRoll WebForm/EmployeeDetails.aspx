<%@ Page Title="EmployeeDetails" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeDetails.aspx.cs" Inherits="EmployeePayRoll_WebForm.Contact" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <style>
    .tableStyle{
                display:flex;
                justify-content:center;
                align-items:center;
                text-align:center;
    }

      #title{
       margin-top:40px;
      font-size:30px;
      font-weight:bold;
      font-family:Cambria;
      color:#900a0a;
  }
      .tableDesign{
             font-size:25px;
             background-position: center center; 
             padding-top: 40px; 
             margin: 50px;
             padding-bottom:40px;
             padding-left:150px;
             padding-right:150px;
             border: thick double #900a0a;
/*             background: conic-gradient(from  4.14rad at 60%,#F3C6D3,#DF698A,#94469D,#743E9B);
*/
             background-image:linear-gradient(to left,#e6e0b8,plum,#0094ffcc);    
                
}
      .tableHead{
          color:brown;
          background: #DF698A;

      }

</style>
    <main aria-labelledby="title">
        <div class="tableStyle">
            <br />
        <h2 id="title">All Employee Details<br />
            <asp:Table ID="Table" runat="server" class="tableDesign"  Font-Bold="True" Font-Names="Cambria" GridLines="Both" Height="40px" Width="1013px" HorizontalAlign="Center">
                <asp:TableRow runat="server" class="tableHead">
                    <asp:TableCell runat="server">Employee Id</asp:TableCell>
                    <asp:TableCell runat="server">Full Name</asp:TableCell>
                    <asp:TableCell runat="server">Image</asp:TableCell>
                    <asp:TableCell runat="server">Gender</asp:TableCell>
                    <asp:TableCell runat="server">Department</asp:TableCell>
                    <asp:TableCell runat="server">Salary</asp:TableCell>
                    <asp:TableCell runat="server">Start Date</asp:TableCell>
                    <asp:TableCell runat="server">Notes</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
    </h2>
            </div>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    </main>
</asp:Content>
