var Deck = [];
var cardText = document.getElementById("cardText");
var sideA = document.getElementById("sideA");
var sideB = document.getElementById("sideB");
var deckIndex = 0;
var cardIndex = 0;
var showingA = true;

var card1 = ["Byte", "A group of binary digits or bits (usually eight) operated on as a unit."];
var card2 = ["HTML", "Hypertext Markup Language, a standardized system for tagging text files to achieve font, color, graphic, and hyperlink effects on World Wide Web pages."];
var card3 = ["CSS", "Stands for Cascading Style Sheet."];

Deck[0] = [card1, card2, card3];

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
        cardIndex = randomNum + 1; //todo FIX may go out of bounds.
    }
    else {
        cardIndex = randomNum;
    }
    cardText.innerHTML = Deck[deckIndex][cardIndex][0];
    showingA = true;
}