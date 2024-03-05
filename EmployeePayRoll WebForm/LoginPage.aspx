<%@ Page Title="Login Page"  Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="LoginPage.aspx.cs" Inherits="EmployeePayRoll_WebForm.LoginPage" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
            .line{
            text-align:center;
            font:bold;
            font-size:40px;
            font-family:Cambria;
            color:#743d3d;
                }

            .loginForm{
                display:flex;
                align-items: center;
                justify-items:center;
                margin-left:500px;
            }

    </style>
    <div class="loginForm">
    <main >         
               <span class="line">Login Page</span> <br />
                <br />
                <asp:Label ID="label" runat="server" Text="Employee Id"></asp:Label>
                <asp:TextBox ID="EmployeeId" runat="server" Width="213px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="lable" runat="server" Text="Employee Name"></asp:Label>
                <asp:TextBox ID="FullName" runat="server" Width="213px"></asp:TextBox>
                <br />
                <br />
                <asp:CheckBox ID="Remember" runat="server" Text="Remenber me" />
                <br />
                <br />
                <asp:Button ID="Login" runat="server" BackColor="#0099FF" Text="Login" ValidateRequestMode="Enabled" OnClick="LoginButton" />
&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Register" runat="server" BackColor="#FF6666" Text="Register" />

                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />

                <br />
                <br />              
    </main>
     </div>
    </asp:content>
