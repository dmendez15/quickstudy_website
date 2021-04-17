var Deck = [];
var DeckName = [];
var cardText = document.getElementById("cardText");
var deckTitle = document.getElementById("deckTitle");
var deckIndex = 0;
var cardIndex = 0;
var showingA = true;

var card1 = ["Byte", "A group of binary digits or bits (usually eight) operated on as a unit."];
var card2 = ["HTML", "Hypertext Markup Language, a standardized system for tagging text files to achieve font, color, graphic, and hyperlink effects on World Wide Web pages."];
var card3 = ["CSS", "Stands for Cascading Style Sheet."];

Deck[0] = [card1, card2, card3];
DeckName[0] = "Internet Programming";

var card4 = ["This is card4 A", "This is card4 B"];
var card5 = ["This is card5 A", "This is card5 B"];
var card6 = ["This is card6 A", "This is card6 B"];

Deck[1] = [card4, card5, card6];
DeckName[1] = "Test Deck";

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

function addCard() {
    
    
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

//When the user clicks the "Create new deck" button
function openNameWindow() {
    document.getElementById("nameForm").style.display = "block";
}
function closeNameWindow() {
    document.getElementById("nameForm").style.display = "none";
}