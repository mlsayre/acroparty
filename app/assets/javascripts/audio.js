var allSFX = [letterTurnSFX, answerAcceptSFX, badAnswerSFX];
var allMUS = [gameplayMUS, resultsMUS];

// Music
var gameplayMUS = new Howl({
  urls: ['/assets/Energize.mp3'],
  volume: 0.2
});

var resultsMUS = new Howl({
  urls: ['/assets/Results.mp3'],
  volume: 0.5
});

//Sound effects
var letterTurnSFX = new Howl({
  urls: ['/assets/LetterTurn.mp3']
});

var answerAcceptSFX = new Howl({
  urls: ['/assets/AnswerAccept.mp3']
});

var badAnswerSFX = new Howl({
  urls: ['/assets/BadAnswer.mp3']
});
