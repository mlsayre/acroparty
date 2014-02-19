
var answercount=61;
var votecount=26;

  var counter=setInterval(timer, 1000);

  function timer() {
    answercount=answercount-1;
    if (answercount <= -1)
    {
      clearInterval(counter);
      return;
    }
    document.getElementById('timertext').innerHTML=answercount;
  }

function votetimer() {
  votecount=votecount-1;
  if (votecount <= 0)
  {
    clearInterval(counter);
    return;
  }
}
