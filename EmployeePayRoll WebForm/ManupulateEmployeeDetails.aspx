<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ManupulateEmployeeDetails.aspx.cs" Inherits="EmployeePayRoll_WebForm.ManupulateEmployeeDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    
<style>
    .form{
        display:flex;
        justify-content: center;
        align-items: center;
    }

    .line{
        font-size:30px;
        font-weight:bold;
        font-family:Cambria;
        color:#900a0a;
    }

    .SelectImage{
        height:70px;
        width:70px;
        border-radius:50%;
    }


    .formDesign{
        background-position: center center; 
        padding-top: 40px; 
        margin: 50px;
        padding-bottom:40px;
        padding-left:150px;
        padding-right:70px;
        border: thick double #900a0a;
        background: conic-gradient(from  4.14rad at 60%,#e6e0b8, plum,#0094ffcc);

    }


</style>
    <div class="form" aria-atomic="True" aria-orientation="vertical">

    <main aria-labelledby="title">
        <formView>
        <div  class="formDesign" aria-orientation="horizontal" >
                <p class="line">Enter Employee Details</p>
                <p class="line">
                    <asp:Label ID="lable" runat="server" Font-Bold="True" ForeColor="#743D3D" Text="Employee Id" Font-Names="Cambria" Font-Size="18pt"></asp:Label>
                </p>
                <p >
                    <asp:TextBox ID="EmployeeId" runat="server" Font-Names="Agency FB" Width="274px" Font-Bold="True" Font-Size="Large" ></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Search" runat="server" BackColor="#336600" Font-Bold="True" Font-Names="Cambria" ForeColor="#CCFFCC" Text="Search" OnClick="SearchEmployee" CausesValidation="False" />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredEmployeeIdField" runat="server" ErrorMessage="Employee Id is required" Fore-color="red" ControlToValidate="EmployeeId" ValidationGroup="DeleteValidation" Font-Bold="True" ForeColor="Red" Font-Size="15px"></asp:RequiredFieldValidator>
               </p>
                <p>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#743D3D" Text="Full Name" Font-Names="Cambria" Font-Size="18pt"></asp:Label>
                <p>
                    <asp:TextBox ID="FullName" runat="server" Font-Names="Agency FB" Width="274px" Font-Bold="True" Font-Size="Large"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredNameFieldValidation" runat="server" ErrorMessage="Name is required" Fore-color="red" ControlToValidate="FullName" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator> </p>
                </p>
                <p>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#743D3D" Text="Select Image" Font-Names="Cambria" Font-Size="18pt"></asp:Label>
                </p>
                <p>
                    <asp:RadioButtonList  ID="SelectImage" runat="server" RepeatDirection="Horizontal" ItemType="image" CellPadding="0" Width="340px" TextAlign="Right">
                                    <asp:ListItem Value="Images/p1.jpg" ><img class="SelectImage" src="Images/p1.jpg" alt="no image" /></asp:ListItem>
                                    <asp:ListItem Value="Images/p2.jpg"><img class="SelectImage" src="Images/p2.jpg" alt="no image" /></asp:ListItem>
                                    <asp:ListItem Value="Images/p3.jpg"><img class="SelectImage" src="Images/p3.jpg" alt="no image" /></asp:ListItem>
                                    <asp:ListItem Value="Images/p4.jpg"><img class="SelectImage" src="Images/p4.jpg" alt="no image" /></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredImageField" runat="server" ErrorMessage="Image is required" Fore-color="red" ControlToValidate="SelectImage" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator> </p>
                <p>

                    <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="#743D3D" Text="Gender" Font-Names="Cambria" Font-Size="18pt"></asp:Label>
                </p>
                <p>
                    <asp:RadioButtonList ID="Gender" runat="server"  Font-Size="15pt"  ForeColor="#743D3D"  RepeatDirection="Horizontal" Width="246px" Font-Bold="True">
                                    <asp:ListItem>Female</asp:ListItem>
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Others</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredGenderField" runat="server" ErrorMessage="Gender is required" Fore-color="red" ControlToValidate="Gender" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator> 

                </p>
                <p>
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="#743D3D" Text="Select Department" Font-Names="Cambria" Font-Size="18pt"></asp:Label>
                </p>
                <p>
                    <asp:DropDownList ID="Department" runat="server" Width="187px" Font-Bold="True" ForeColor="#743D3D" Font-Size="Large">
                                    <asp:ListItem>IT</asp:ListItem>
                                    <asp:ListItem>Sales</asp:ListItem>
                                    <asp:ListItem>Marketing</asp:ListItem>
                                    <asp:ListItem>Finance</asp:ListItem>
                                    <asp:ListItem>others</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredDepartmentField" runat="server" ErrorMessage="Gender is required" Fore-color="red" ControlToValidate="Department" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator> 
                 </p>
                 <p aria-atomic="False" aria-dropeffect="none" aria-grabbed="undefined">
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="#743D3D" Text="Salary" Font-Names="Cambria" Font-Size="18pt"></asp:Label>
                 </p>
                 <p>
                    <asp:TextBox ID="Salary" runat="server" Font-Names="Agency FB" Width="274px" Font-Bold="True" Font-Size="Large"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredSalaryField" runat="server" ErrorMessage="Salary is required" Fore-color="red" ControlToValidate="Salary" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator> 
                 </p>
                 <p>
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="#743D3D" Text="Start Date" Font-Names="Cambria" Font-Size="18pt"></asp:Label>
                 </p>
                 <p>
                    <input type="date" id="StartDate" runat="server" size="large" />
                    <asp:RequiredFieldValidator ID="RequiredStartDateField" runat="server" ErrorMessage="Start date is required" Fore-color="red" ControlToValidate="StartDate" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator> 
                 </p>

                 <p>
                    <asp:Label ID="Label7" runat="server" Font-Bold="True" ForeColor="#743D3D" Text="Notes" Font-Names="Cambria" Font-Size="18pt"></asp:Label>
                </p>
                <p>
                    <asp:TextBox ID="Notes" runat="server" Font-Names="Agency FB" Width="274px" Font-Bold="True" Font-Size="Large"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredNotesField" runat="server" ErrorMessage="Notes is required" Fore-color="red" ControlToValidate="Notes" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator> 
                </p>
                    <asp:Button ID="Update" runat="server" BackColor="#CC99FF" Font-Bold="True" Font-Names="Cambria" ForeColor="#660033" Text="Update" OnClick="UpdateEmployeeDetails"/>
            &nbsp;&nbsp;&nbsp;<asp:Button ID="Delete" runat="server" BackColor="Red" Font-Bold="True" Font-Names="Cambria" ForeColor="#FFFF66" Text="Delete" OnClick="DeleteEmployeeDetails" ValidationGroup="DeleteValidation"/>
            &nbsp;&nbsp;&nbsp;
                    <br />
                <br />
                    <br />
                <asp:GridView ID="SearchGridView" runat="server"  Visible="False">
                </asp:GridView>
            </div>
        </formView>
    </main>
    <br />
    <br />
    <br />
    <br />
    </div>
    <a href="CreateNewEmployee.aspx">About.aspx</a>
</asp:Content>
