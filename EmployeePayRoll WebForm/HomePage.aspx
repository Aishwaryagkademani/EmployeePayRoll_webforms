<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="EmployeePayRoll_WebForm._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .welcome{
            text-align:center;
            font:bold;
            font-size:60px;
            font-family:Cambria;
            color:#743d3d;
        }
    </style>
    <main>
        <div class="row">
<%--            <section class="col-md-4" aria-labelledby="hostingTitle">--%>
              
                <p >
                    &nbsp;</p>
                <p >
                    &nbsp;</p>
            <p >
                    &nbsp;</p>
            <p >
                    &nbsp;</p>
            <p >
                    &nbsp;</p>
                <p class="welcome" aria-orientation="vertical">
                    <asp:Label ID="NameLabel" runat="server" Visible="False"></asp:Label>
&nbsp;WELCOME</p>
            <p class="welcome" aria-orientation="vertical">
                    &nbsp;TO <br />
                    EMPLOYEE PAY ROLL APPLICATION</p>
                <p>
                    &nbsp;</p>
                <p>
                    &nbsp;</p>
                <p>
                    &nbsp;</p>
                <p>
                    &nbsp;</p>
                <p>
                    &nbsp;</p>
                <p>
                    <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
                </p>
<%--            </section>--%>
        </div>
    </main>

</asp:Content>
