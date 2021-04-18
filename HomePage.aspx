﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="QuickStudyWebsite.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Quick Study</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
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
                        <h1 id="deckTitle"></h1>
                        <button id="btnPrevDeck" onclick="prevDeck()">Previous</button>
                        <button id="btnNextDeck" onclick="nextDeck()">Next</button><br />
                        <button onclick="openNameWindow()">Create new deck</button>
                        <button onclick="deleteDeck()">Delete current deck</button>
                        <!--Popup dialogue-->
                        <div class="form_popup" id="nameForm">
                            <form class="form_container">
                                <h1>New Deck</h1>
                                <input type="text" id="newDeckName" placeholder="Enter a name" required />
                                <button type="button" onclick="newDeck()">Save</button>
                                <button type="button" onclick="closeNameWindow()">Close</button>
                            </form>
                        </div>
                        <!--Popup dialouge END-->
                    </div>
                    <!--Current Card-->
                    <div>
                        <label id="currentSide"></label>
                        <label id="cardNumber"></label>
                        <table class="flashcard">
                            <tr>
                                <td id="card"><textarea id="cardText" readonly="readonly" cols="30" rows="5"></textarea></td>
                            </tr>
                        </table>
                        <button id="btnPrevCard" onclick="prevCard()">Previous</button>
                        <button id="btnFlip" onclick="flipCard()">Flip</button>
                        <button id="btnNextCard" onclick="nextCard()">Next</button>
                        <button id="btnRandom" onclick="randomCard()">Random</button>
                        <button id="btnDelete" onclick="deleteCard()">Delete</button>
                    </div>
                    <!--Current Card END-->
                    <!--New Card-->
                    <div>
                        <table class="flashcard">
                            <tr>
                                <td class="padding"><textarea id="sideA" cols="30" rows="5" placeholder="Side A"></textarea></td>
                            </tr>
                            <tr>
                                <td class="padding"><textarea id="sideB" cols="30" rows="5" placeholder="Side B"></textarea></td>
                            </tr>
                        </table>
                        <button id="btnAdd" onclick="addCard()">Add Card</button>
                    </div>
                    <!--New Card END-->
                </div>
            </div>
        </div>
        <script src="js/FlashCard.js"></script>
</body>
</html>
