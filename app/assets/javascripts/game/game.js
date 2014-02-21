


function votetimer() {
  votecount=votecount-1;
  if (votecount <= 0)
  {
    clearInterval(counter);
    return;
  }
}
