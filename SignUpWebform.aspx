<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUpWebform.aspx.cs" Inherits="QuickStudyWebsite.SignUpWebform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <!--Navigation Side Bar START-->
            <div class="sidebar">
                <h2>Quick Study</h2>
                <ul>
                    <li><a href="Index.html"><img class="icon" src="assets/icons/home.png" />Home</a></li>
                    <li><a href="todo.html"><img class="icon" src="assets/icons/todo.png" />To-Do</a></li>
                    <li><a href="LogInWebform.aspx"><img class="icon" src="assets/icons/login.png" />Log In</a></li>
                    <li><a href="SignUpWebform.aspx"><img class="icon" src="assets/icons/signup.png" />Sign Up</li>
                    <li><a href="about.html"><img class="icon" src="assets/icons/about.png" />About</a></li>
                </ul>
            </div>
            <!--Navigation Side Bar END-->
            <div class="main_content">
                <div class="header">Sign Up</div>
                <div class="info">
                    <div>
						<table class="table">
							<tr>
								<td colspan="2"><h2>Sign Up</h2></td>
							</tr>
							<tr>
								<td>User Name</td>
								<td>
									<asp:TextBox ID="txtboxUserName" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="valUserName" runat="server" ControlToValidate="txtboxUserName" ErrorMessage="User Name is required" ForeColor="Red">*</asp:RequiredFieldValidator>
								</td>
							</tr>
							<tr>
								<td>Email</td>
								<td>
									<asp:TextBox ID="txtboxEmail" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="valEmail" runat="server" ControlToValidate="txtboxEmail" ErrorMessage="Email is required" ForeColor="Red">*</asp:RequiredFieldValidator>
								</td>
							</tr>
							<tr>
								<td>Password</td>
								<td>
									<asp:TextBox ID="txtboxPassword" runat="server" TextMode="Password"></asp:TextBox>
									<asp:RequiredFieldValidator ID="valPassword" runat="server" ControlToValidate="txtboxPassword" ErrorMessage="Password is required" ForeColor="Red">*</asp:RequiredFieldValidator>
								</td>
							</tr>
							<tr>
								<td>Confirm Password</td>
								<td>
									<asp:TextBox ID="txtboxConPassword" runat="server" TextMode="Password"></asp:TextBox>
									<asp:CompareValidator ID="valConPassword" runat="server" ControlToCompare="txtboxPassword" ControlToValidate="txtboxConPassword" ErrorMessage="Password does not match" ForeColor="Red">*</asp:CompareValidator>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="button">
									<asp:Button ID="btnCreateAccount" runat="server" Text="Create Account" OnClick="btnCreateAccount_Click" />
								</td>
							</tr>
						</table>
					</div>
					<div class="ValidSummary">

						<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UserConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>

						<asp:ValidationSummary ID="ValidationSummary1" runat="server" />

					</div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
