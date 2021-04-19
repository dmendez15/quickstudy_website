<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="QuickStudyWebsite.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quick Study</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <form runat="server">
        <div class="wrapper">
            <!--Navigation Side Bar START-->
            <div class="sidebar">
                <h2>Quick Study</h2>
                <ul>
                    <li><a href="HomePage.aspx"><img class="icon" src="assets/icons/home.png"/>Home</a></li>
                    <li><a href="todo.html"><img class="icon" src="assets/icons/todo.png"/>To-Do</a></li>
                    <li><a href="LogInWebform.aspx"><img class="icon" src="assets/icons/login.png"/>Log In</a></li>
                    <li><a href="SignUpWebform.aspx"><img class="icon" src="assets/icons/signup.png"/>Sign Up</a></li>
                    <li><a href="about.html"><img class="icon" src="assets/icons/about.png"/>About</a></li>
                </ul>
            </div>
            <!--Navigation Side Bar END-->
            <div class="main_content">
                <div class="header">Home</div>
                <div class="info">
                    <div class="decks">
						<asp:Label ID="deckTitle" runat="server" Text=""></asp:Label>
                        <asp:button runat="server" id="btnPrevDeck" class="homeButton" Text="Previous" />
                        <asp:button runat="server" id="btnNextDeck" class="homeButton" Text="Next" /><br />
                        <asp:button runat="server" ID="btnCreateNewDeck" CssClass="homeButton" Text="Create new deck"/>
                        <asp:button runat="server" id="btnDeleteDeck" CssClass="homeButton" Text="Delete current deck" />
                        <!--Popup dialogue-->
                        <div class="form_popup" id="nameForm">
                            <div class="form_container">
                                <h1>New Deck</h1>
                                <input type="text" id="newDeckName" placeholder="Enter a name" required />
                                <button type="button" onclick="newDeck()">Save</button>
                                <button type="button" onclick="closeNameWindow()">Close</button>
                            </div>
                        </div>
                        <!--Popup dialouge END-->
                    </div>
                    <!--Current Card-->
                    <div>
						<asp:Label ID="currentSide" runat="server" Text=""></asp:Label>
						<asp:Label ID="cardNumber" runat="server" Text=""></asp:Label>
                        <table class="flashcard">
                            <tr>
                                <td id="card"><asp:TextBox ID="cardText" runat="server" ReadOnly="True" TextMode="MultiLine" Columns="30" Rows="5"></asp:TextBox></td>
                            </tr>
                        </table>
                        <asp:button runat="server" id="btnPrevCard" Text="Previous" />
                        <asp:button runat="server" id="btnFlip" Text="Flip" />
                        <asp:button runat="server" id="btnNextCard" Text="Next" />
                        <asp:button runat="server" id="btnRandom" Text="Random" />
                        <asp:button runat="server" id="btnDelete" Text="Delete" />
                    </div>
                    <!--Current Card END-->
                    <!--New Card-->
                    <div>
                        <table class="flashcard">
                            <tr>
                                <td class="padding"><asp:TextBox ID="sideA" runat="server" Columns="30" Rows="5" TextMode="MultiLine" placeholder="Side A"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="padding"><asp:TextBox ID="sideB" runat="server" Columns="30" Rows="5" TextMode="MultiLine" placeholder="Side B"></asp:TextBox></td>
                            </tr>
                        </table>
                        <asp:button runat="server" id="btnAdd" Text="Add Card" />
                    </div>
                    <!--New Card END-->
                </div>
            </div>
        </div>
        <!--<script src="js/FlashCard.js"></script>-->
    </form>
        </body>
</html>
