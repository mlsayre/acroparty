var allSFX = [letterTurnSFX, answerAcceptSFX, badAnswerSFX];
var allMUS = [gameplayMUS, resultsMUS];

// Music
var gameplayMUS = new Howl({
  urls: ['/assets/Gameplay.mp3'],
  volume: 0.15
});

var voteMUS = new Howl({
  urls: ['/assets/Vote.mp3'],
  volume: 0.15
});

var resultsMUS = new Howl({
  urls: ['/assets/Results.mp3'],
  volume: 0.3
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

var answerFieldAppearSFX = new Howl({
  urls: ['/assets/AnswerFieldAppear.mp3']
});

var voteClickSFX = new Howl({
  urls: ['/assets/VoteClick.mp3']
});
