if (gon.playerlistcount > 1)
  {
  $("#acroletters").replaceWith('Waiting for at least 3 players...');
  }
else
  {
  $("#acroletters").hide();
  };

PrivatePub.subscribe("/familyroom/game", function(data, channel) {
  $("#roundtext").replaceWith(data.game_message);
});
