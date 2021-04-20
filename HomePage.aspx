<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="QuickStudyWebsite.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quick Study</title>
    <link rel="stylesheet" href="styles.css" />
	<style type="text/css">
		.auto-style1 {
			padding: 10px;
			width: 219px;
		}
	</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <!--Navigation Side Bar START-->
            <div class="sidebar">
                <h2>Quick Study</h2>
                <ul>
                    <li><a href="HomePage.aspx"><img class="icon" src="assets/icons/home.png" />Home</a></li>
                    <li><a href="todo.html"><img class="icon" src="assets/icons/todo.png" />To-Do</a></li>
                    <li><a href="LogInWebform.aspx"><img class="icon" src="assets/icons/login.png" />Log In</a></li>
                    <li><a href="SignUpWebform.aspx"><img class="icon" src="assets/icons/signup.png" />Sign Up</li>
                    <li><a href="about.html"><img class="icon" src="assets/icons/about.png" />About</a></li>
                </ul>
            </div>
            <!--Navigation Side Bar END-->
            <div class="main_content">
                <div class="header">Home</div>
                <div class="info">
                    <div class="decks">
						<asp:Label ID="deckTitle" runat="server" Text="Title"></asp:Label><br />
                        <asp:button runat="server" id="btnPrevDeck" Text="Previous" OnClick="btnPrevDeck_Click"/>
                        <asp:button runat="server" id="btnNextDeck" Text="Next" OnClick="btnNextDeck_Click"/>
                        <asp:button runat="server" Text="Create new deck"/>
                        <asp:button runat="server" Text="Delete current deck"/>
                        <!--Popup dialogue-->
                        <div class="form_popup" id="nameForm">
                            </div>
                                <h1>New Deck</h1>
                                <input type="text" id="newDeckName" placeholder="Enter a name" required />
                                <asp:button runat="server" type="button" Text="Save"/>
                                <asp:button runat="server" type="button" Text="Close"/>
                        </div>
                        <!--Popup dialouge END-->
                    </div>
                    <!--Current Card-->
                    <div>
                        <asp:label runat="server" id="currentSide"></asp:label>
                        <asp:label runat="server" id="cardNumber"></asp:label>
                        <table class="flashcard">
                            <tr>
                                <td id="card"><asp:TextBox ID="cardText" runat="server" Columns="30" Rows="5" TextMode="MultiLine"></asp:TextBox></td>
                            </tr>
                        </table>
                        <asp:button runat="server" id="btnPrevCard" Text="Previous" OnClick="btnPrevCard_Click"/>
                        <asp:button runat="server" id="btnFlip" Text="Flip"/>
                        <asp:button runat="server" id="btnNextCard" Text="Next" OnClick="btnNextCard_Click" />
                        <asp:button runat="server" id="btnRandom" Text="Random"/>
                        <asp:button runat="server" id="btnDelete" Text="Delete"/>
                    </div>
                    <!--Current Card END-->
                    <!--New Card-->
                    <div>
                        <table class="flashcard">
                            <tr>
                                <td class="auto-style1"><asp:TextBox ID="sideA" runat="server" Columns="30" Rows="5" placeholder="Side A" TextMode="MultiLine"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="auto-style1"><asp:TextBox ID="sideB" runat="server" Columns="30" Rows="5" placeholder="Side B" TextMode="MultiLine"></asp:TextBox>
								</td>
                            </tr>
                        </table>
                        <asp:button runat="server" id="btnAdd" Text="Add Card"/>
                    	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UserConnectionString %>" SelectCommand="SELECT * FROM [Users] WHERE ([User_UserName] = @User_UserName)">
							<SelectParameters>
								<asp:SessionParameter Name="User_UserName" SessionField="username" Type="String" />
							</SelectParameters>
						</asp:SqlDataSource>
                    </div>
                    <!--New Card END-->
                </div>
            </div>
        </div>
    </form>
		</body>
</html>
