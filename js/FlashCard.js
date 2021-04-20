var Deck = [];
var DeckName = [];
var cardText = document.getElementById("cardText");
var deckTitle = document.getElementById("deckTitle");
var currentSide = document.getElementById("currentSide");
var cardNumber = 1;
var deckIndex = 0;
var cardIndex = 0;
var showingA = true;
var newCard = ["", ""]; // A blank card used for newly created decks. Get's overridden in addCard() function.
var currentUser = document.getElementById("currentUser"); //currentUser.value = the user name of the user.

var card1 = ["HTML", "HyperText Markup Language"];
var card2 = ["CSS", "Cascading Style Sheet"];
var card3 = ["Browser", "A piece of software such as Mozilla Firefox and Internet Explorer that allows a computer to access and display documents, view pictures, hear sound, and view video clips from the World Wide Web."];
var card4 = ["HTTP", "The abbreviation for Hypertext Transfer Protocol. It is the set of rules by which Web pages are transferred across the Internet."];
var card5 = ["E-mail", "Mail that's electronically transmitted by your computer. As opposed to snail mail, e-mail sends your messages instantaneously, anywhere in the world. It has the capability to send messages at any time and to anyone."];
var card6 = ["Homepage", "The first page that is viewed when the browser starts. It is also the page of a Web site that provides the introduction or content with links."];

Deck[0] = [card1, card2, card3, card4, card5, card6];
DeckName[0] = "Internet Programming";

cardText.innerHTML = Deck[deckIndex][cardIndex][0];
deckTitle.innerHTML = DeckName[0];
updateSideTracker(); // Updates a label that says what side the card is facing.
updateCardCounter(); // Updates a label that shows what the current card you are at is.

//Flip button
function flipCard() {
    if (showingA) {
        cardText.innerHTML = Deck[deckIndex][cardIndex][1];
        showingA = false;
        updateSideTracker();
    }
    else {
        cardText.innerHTML = Deck[deckIndex][cardIndex][0];
        showingA = true;
        updateSideTracker();
    }
}

//Add card
function addCard() {
    var sideA = document.getElementById("sideA").value;
    var sideB = document.getElementById("sideB").value;
    if (sideA != "" && sideB != "") {
        if (Deck[deckIndex][0][0] == "") {
            // If newCard (blank) then replace the first element with the new card.
            Deck[deckIndex][0] = [sideA, sideB];
            cardText.innerHTML = Deck[deckIndex][0][0]; // Show sideA of the brand new card.
            showingA = true;
            updateSideTracker();
        }
        else {
            Deck[deckIndex].push([sideA, sideB]);
        }
        document.getElementById("sideA").value = "";
        document.getElementById("sideB").value = "";
    }
    else {
        alert('Both sides of the card must be filled');
    }
    updateCardCounter();
}

function deleteCard() {
    Deck[deckIndex].splice(cardIndex, 1);
    cardText.innerHTML = "";
    prevCard();
    updateCardCounter();
}

function nextCard() {
    cardIndex = (cardIndex + 1) % Deck[deckIndex].length;
    cardText.innerHTML = Deck[deckIndex][cardIndex][0];
    cardNumber.innerHTML = cardIndex;
    showingA = true;
    updateSideTracker();
    updateCardCounter();
}

function prevCard() {
    if (cardIndex > 0) {
        cardIndex = (cardIndex - 1);
    }
    else if (cardIndex == 0) {
        cardIndex = Deck[deckIndex].length - 1;
    }
    cardNumber.innerHTML = cardIndex;
    cardText.innerHTML = Deck[deckIndex][cardIndex][0];
    showingA = true;
    updateSideTracker();
    updateCardCounter();
}

function randomCard() {
    var randomNum = Math.floor(Math.random() * Deck[deckIndex].length); // Returns a random integer from 0 to the current deck length.
    if (randomNum == cardIndex) {
        nextCard();
    }
    else {
        cardIndex = randomNum;
    }
    cardNumber.innerHTML = cardIndex;
    cardText.innerHTML = Deck[deckIndex][cardIndex][0];
    showingA = true;
    updateSideTracker();
    updateCardCounter();
}

//Deck Functions

function nextDeck() {
    deckIndex = (deckIndex + 1) % Deck.length;
    deckTitle.innerHTML = DeckName[deckIndex];
    cardText.innerHTML = Deck[deckIndex][0][0];
    showingA = true;
    updateSideTracker();
    updateCardCounter();
}

function prevDeck() {
    if (deckIndex > 0) {
        deckIndex = (deckIndex - 1);
    }
    else if (deckIndex == 0) {
        deckIndex = Deck.length - 1;
    }
    deckTitle.innerHTML = DeckName[deckIndex];
    cardText.innerHTML = Deck[deckIndex][0][0];
    showingA = true;
    updateSideTracker();
    updateCardCounter();
}

//When the user clicks the "Create new deck" button
function openNameWindow() {
    document.getElementById("nameForm").style.display = "block";
}
function closeNameWindow() {
    document.getElementById("nameForm").style.display = "none";
}

function newDeck() {
    var newDeckName = document.getElementById("newDeckName").value;
    if (newDeckName != "") {
        Deck[Deck.length] = [newCard];
        DeckName[DeckName.length] = newDeckName;
        closeNameWindow();
    }
    updateCardCounter();
}

//Delete current deck
function deleteDeck() {
    Deck.splice(deckIndex, 1);
    DeckName.splice(deckIndex, 1);
    prevDeck();
    updateCardCounter();
}

function updateCardCounter() {
    cardNumber = cardIndex + 1;
    document.getElementById("cardNumber").innerHTML = "Card " + cardNumber + "/" + Deck[deckIndex].length;
}
function updateSideTracker() {
    if (showingA) {
        currentSide.innerHTML = "Front";
    }
    else {
        currentSide.innerHTML = "Back";
    }
}