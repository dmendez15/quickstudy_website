var Deck = [];
var DeckName = [];
var cardText = document.getElementById("cardText");
var deckTitle = document.getElementById("deckTitle");
var deckIndex = 0;
var cardIndex = 0;
var showingA = true;

var newCard = ["", ""]; // A blank card used for newly created decks. Get's overridden in addCard() function.

var card1 = ["Byte", "A group of binary digits or bits (usually eight) operated on as a unit."];
var card2 = ["HTML", "Hypertext Markup Language, a standardized system for tagging text files to achieve font, color, graphic, and hyperlink effects on World Wide Web pages."];
var card3 = ["CSS", "Stands for Cascading Style Sheet."];

Deck[0] = [card1, card2, card3];
DeckName[0] = "Internet Programming";

cardText.innerHTML = Deck[deckIndex][cardIndex][0];
deckTitle.innerHTML = DeckName[0];

//Flip button
function flipCard() {
    if (showingA) {
        cardText.innerHTML = Deck[deckIndex][cardIndex][1];
        showingA = false;
    }
    else {
        cardText.innerHTML = Deck[deckIndex][cardIndex][0];
        showingA = true;
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
    
}

function deleteCard() {
    Deck[deckIndex].splice(cardIndex, 1);
    cardText.innerHTML = "";
    prevCard();
}

function nextCard() {
    cardIndex = (cardIndex + 1) % Deck[deckIndex].length;
    cardText.innerHTML = Deck[deckIndex][cardIndex][0];
    showingA = true;
}

function prevCard() {
    if (cardIndex > 0) {
        cardIndex = (cardIndex - 1);
    }
    else if (cardIndex == 0) {
        cardIndex = Deck[deckIndex].length - 1;
    }
    cardText.innerHTML = Deck[deckIndex][cardIndex][0];
    showingA = true;
}

function randomCard() {
    var randomNum = Math.floor(Math.random() * Deck[deckIndex].length); // Returns a random integer from 0 to the current deck length.
    if (randomNum == cardIndex) {
        nextCard();
    }
    else {
        cardIndex = randomNum;
    }
    cardText.innerHTML = Deck[deckIndex][cardIndex][0];
    showingA = true;
}

//Deck Functions

function nextDeck() {
    deckIndex = (deckIndex + 1) % Deck.length;
    deckTitle.innerHTML = DeckName[deckIndex];
    cardText.innerHTML = Deck[deckIndex][0][0];
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
}

//Delete current deck
function deleteDeck() {
    Deck.splice(deckIndex, 1);
    DeckName.splice(deckIndex, 1);
    prevDeck();
}