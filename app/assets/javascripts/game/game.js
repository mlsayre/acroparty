// init player when entering room
function playerEnterInit(){
  $.ajax({
    url: "/room/playerenterinit",
    type: "POST"
  });
  $("#votediv").dialog({
      autoOpen: false,
      closeOnEscape: false,
      draggable: false,
      resizable: false,
      position: { my: "center top", at: "center top-10", of: "#categorytext" },
      title: "Pick your favorite...",
      width: "auto",

    });
  $("#resultsdiv").dialog({
      autoOpen: false,
      closeOnEscape: false,
      draggable: false,
      resizable: false,
      position: { my: "center top", at: "center top-10", of: "#categorytext" },
      title: "Pick your favorite...",
      width: "auto",

    });
  $("#endofgamediv").dialog({
        autoOpen: false,
        closeOnEscape: false,
        draggable: false,
        resizable: false,
        position: { my: "center top", at: "center top-10", of: "#categorytext" },
        title: "Pick your favorite...",
        width: "auto",

      });
  function updateUserBox() {
    $("#userlistbox").load("/room/familyroom #userlistbox");
  }
  setTimeout(updateUserBox, 500);
}

function hideTextStart() {
  $("#acceptedtext").hide();
  $("#votediv").hide();
  $("#resultsdiv").hide();
  $("#endofgamediv").hide();
}

// to clear the answers during round prep
function roundPrep(){
  $.ajax({
    url: "/room/roundprep",
    type: "POST"
  });
}

// Writing and voting timer
function wtimer(time) {
  var answercount=time; // Answer write time (s)
  var writecounter=setInterval(writingtimer, 1000);
  $("#timertext").css('color', 'black');
  $("#timertext").show();
  function writingtimer() {
    answercount=answercount-1;
    if ( answercount == time - 1 ) {
      if (time == 51) {
        gameplay50MUS.play();
      }
      else if (time == 61) {
        gameplayMUS.play();
      }
      else if (time == 81) {
        gameplay80MUS.play();
      }
    }
    if ( answercount == 0 )
    {
      $("#answertextfield").attr("disabled", true);
      $("#answersubmit").attr("disabled", true);
      function loadTheAnswers(){
        $("#votediv").load("/room/familyroom #votediv");
      }
      setTimeout(loadTheAnswers, 500);
    }
    if ( answercount <= -1 )
    {
      clearInterval(writecounter);
      return;
    }
    if ( answercount == 20 || answercount == 10 || answercount == 5 )
      {
        $("#timertext").addClass('animated tada');
      }
    if ( answercount == 19 || answercount == 9 || answercount == 4 )
      {
        $("#timertext").removeClass('animated tada');
      }
    if ( answercount == 10 )
      {
        $("#timertext").css('color', 'red');
      }
    $("#timertext").text(answercount);
  }
}

function vtimer() {
  var votecount=26; // Vote time (s)
  $("#timertext").css('color', 'black');
  var votecounter=setInterval(votingtimer, 1000);
  function votingtimer() {
    votecount=votecount-1;
    if ( votecount == 25 ) {
      voteMUS.play();
    }
    if (votecount == 0)
      {
        $(".votebuttons").attr("disabled", true);
        $("#roundtext").text("Voting complete...");
        function loadTheResults(){
        $("#resultsdiv").load("/room/familyroom #resultsdiv");
      }
      setTimeout(loadTheResults, 500);
      }
    if ( votecount <= -1 )
    {
      clearInterval(votecounter);
      return;
    }
    if ( votecount == 5 )
      {
        $("#timertext").addClass('animated tada');
        $("#timertext").css('color', 'red');
      }
    if ( votecount == 4 )
      {
        $("#timertext").removeClass('animated tada');
      }

    $("#timertext").text(votecount);
  }
}

// Letter display

function showLetters(time) {
  var text = $('#acroletters').text();
  var length = text.length;
  var timeOut;
  var character = 0;
  $("#acroletters").css('fontSize', '340%');
  function typeWriter() {
    timeOut = setTimeout(function() {
      document.getElementById("acroletters").style.visibility="visible";
      character++;
      var type = text.substring(0, character);
      $('#acroletters').text(type);
      $("#acroletters").removeClass('animated fadeOutUp');
      $('#acroletters').addClass('animated fadeIn');
      typeWriter();
      if (character > 0 && character <= length) {
        letterTurnSFX.play();
      }
      if (character == length + 1) {
        clearTimeout(timeOut);
        wtimer(time);
        $("#answertextfield").removeAttr("disabled");
        $("#answersubmit").removeAttr("disabled");
        document.getElementById("answertextfield").style.visibility="visible";
        $('#answerfield').removeClass('animated fadeOutDown');
        $('#answerfield').addClass('animated rubberBand');
        answerFieldAppearSFX.play();
      }
    }, 1500);
  };
  typeWriter();
}

function submitAnswerFX() {
  function addPulse() {
    $('#answerfield').addClass('animated pulse');
  }
  function addAcceptedTextFlip() {
    $("#acceptedtext").load("/room/familyroom #acceptedtext");
    $('#acceptedtext').addClass('animated flip');
    $("#acceptedtext").show();
  }
  $("#acceptedtext").hide();
  $("#acceptedtext").css('color', 'green');
  $('#answerfield').removeClass('animated pulse');
  $('#answerfield').removeClass('animated rubberBand');
  $('#acceptedtext').removeClass('animated flip');
  $("#answersubmit").attr("disabled", true);
  function allowAnswerAgain() {
    $("#answersubmit").removeAttr("disabled");
  }
  setTimeout(allowAnswerAgain, 2500);
  setTimeout(addPulse, 30);
  setTimeout(addAcceptedTextFlip, 370);
  answerAcceptSFX.play();
}

function slideRoundText() {
  document.getElementById("roundtext").style.visibility="hidden";
  function resetSlideIn() {
    document.getElementById("roundtext").style.visibility="visible";
    $('#roundtext').addClass('animated slideInLeft');
  }
  $('#roundtext').removeClass('animated slideInLeft');
  setTimeout(resetSlideIn, 20);
}

function enterCatText() {
  document.getElementById("categorytext").style.visibility="hidden";
  function resetCatIn() {
    document.getElementById("categorytext").style.visibility="visible";
    $('#categorytext').addClass('animated fadeInDown');
  }
  $('#categorytext').removeClass('animated fadeInDown');
  setTimeout(resetCatIn, 500);
}

// to check number of submitted entries
function intervalSubmittedCheck() {
  $("#submittedtext").load("/room/familyroom #submittedtext", ".");
}

function checkSubmittedNumber() {
  document.getElementById("submittedtext").style.visibility="visible";
  var submittedtextcheck = setInterval(intervalSubmittedCheck, 6000);
  function endSubmittedCheck() {
    clearInterval(submittedtextcheck);
  }
  setTimeout(endSubmittedCheck, 60300);
}

// Acronym validation functions
function notAnAcronym() {
  function invalidAcceptedTextFlip() {
    $('#acceptedtext').addClass('animated flip');
    $("#acceptedtext").show();
  }
  $("#acceptedtext").hide();
  $("#acceptedtext").css('color', 'red');
  $('#acceptedtext').text("Not an acronym!");
  $('#acceptedtext').removeClass('animated flip');
  setTimeout(invalidAcceptedTextFlip, 230);
  badAnswerSFX.play();
}

function incorrectLength() {
  function invalidAcceptedTextFlip() {
    $('#acceptedtext').addClass('animated flip');
    $("#acceptedtext").show();
  }
  $("#acceptedtext").hide();
  $("#acceptedtext").css('color', 'red');
  $('#acceptedtext').text("Incorrect length!");
  $('#acceptedtext').removeClass('animated flip');
  setTimeout(invalidAcceptedTextFlip, 230);
  badAnswerSFX.play();
}

function notJustLetters() {
  function invalidAcceptedTextFlip() {
    $('#acceptedtext').addClass('animated flip');
    $("#acceptedtext").show();
  }
  $("#acceptedtext").hide();
  $("#acceptedtext").css('color', 'red');
  $('#acceptedtext').text("Not feeling creative?");
  $('#acceptedtext').removeClass('animated flip');
  setTimeout(invalidAcceptedTextFlip, 230);
  badAnswerSFX.play();
}

// acronym validation
function acroValidate(roundletters) {
  var letters = roundletters;
  var eachletter = letters.split('');
  var submission = document.getElementById("answertextfield").value;
  var words = submission.toUpperCase().match(/(?!")\S+/g);
  if (eachletter.length == 3) {
    if (words.length == 3 &&
       ((words[0].charAt(0) != eachletter[0]) ||
       (words[1].charAt(0) != eachletter[1]) ||
       (words[2].charAt(0) != eachletter[2])))
      {
        notAnAcronym();
        return false;
      }
    else if ((words.length < 3) || (words.length > 3))
      {
        incorrectLength();
        return false;
      }
    else if (words.length == 3 &&
       ((words[0] == eachletter[0]) &&
       (words[1] == eachletter[1]) &&
       (words[2] == eachletter[2])))
      {
        notJustLetters();
        return false;
      }
      else {
        submitAnswerFX();
        return( true );
      }
  }
  else if (eachletter.length == 4) {
    if (words.length == 4 &&
       ((words[0].charAt(0) != eachletter[0]) ||
       (words[1].charAt(0) != eachletter[1]) ||
       (words[2].charAt(0) != eachletter[2]) ||
       (words[3].charAt(0) != eachletter[3])))
      {
        notAnAcronym();
        return false;
      }
    else if ((words.length < 4) || (words.length > 4))
      {
        incorrectLength();
        return false;
      }
    else if (words.length == 4 &&
       ((words[0] == eachletter[0]) &&
       (words[1] == eachletter[1]) &&
       (words[2] == eachletter[2]) &&
       (words[3] == eachletter[3])))
      {
        notJustLetters();
        return false;
      }
      else {
        submitAnswerFX();
        return( true );
      }
    }
    else if (eachletter.length == 5) {
      if (words.length == 5 &&
         ((words[0].charAt(0) != eachletter[0]) ||
         (words[1].charAt(0) != eachletter[1]) ||
         (words[2].charAt(0) != eachletter[2]) ||
         (words[3].charAt(0) != eachletter[3]) ||
         (words[4].charAt(0) != eachletter[4])))
        {
          notAnAcronym();
          return false;
        }
      else if ((words.length < 5) || (words.length > 5))
        {
          incorrectLength();
          return false;
        }
      else if (words.length == 5 &&
         ((words[0] == eachletter[0]) &&
         (words[1] == eachletter[1]) &&
         (words[2] == eachletter[2]) &&
         (words[3] == eachletter[3]) &&
         (words[4] == eachletter[4])))
        {
          notJustLetters();
          return false;
        }
        else {
          submitAnswerFX();
          return( true );
        }
    }
    else if (eachletter.length == 6) {
      if (words.length == 6 &&
         ((words[0].charAt(0) != eachletter[0]) ||
         (words[1].charAt(0) != eachletter[1]) ||
         (words[2].charAt(0) != eachletter[2]) ||
         (words[3].charAt(0) != eachletter[3]) ||
         (words[4].charAt(0) != eachletter[4]) ||
         (words[5].charAt(0) != eachletter[5])))
        {
          notAnAcronym();
          return false;
        }
      else if ((words.length < 6) || (words.length > 6))
        {
          incorrectLength();
          return false;
        }
      else if (words.length == 6 &&
         ((words[0] == eachletter[0]) &&
         (words[1] == eachletter[1]) &&
         (words[2] == eachletter[2]) &&
         (words[3] == eachletter[3]) &&
         (words[4] == eachletter[4]) &&
         (words[5] == eachletter[5])))
        {
          notJustLetters();
          return false;
        }
        else {
          submitAnswerFX();
          return( true );
        }
    }
    else if (eachletter.length == 7) {
      if (words.length == 7 &&
         ((words[0].charAt(0) != eachletter[0]) ||
         (words[1].charAt(0) != eachletter[1]) ||
         (words[2].charAt(0) != eachletter[2]) ||
         (words[3].charAt(0) != eachletter[3]) ||
         (words[4].charAt(0) != eachletter[4]) ||
         (words[5].charAt(0) != eachletter[5]) ||
         (words[6].charAt(0) != eachletter[6])))
        {
          notAnAcronym();
          return false;
        }
      else if ((words.length < 7) || (words.length > 7))
        {
          incorrectLength();
          return false;
        }
      else if (words.length == 7 &&
         ((words[0] == eachletter[0]) &&
         (words[1] == eachletter[1]) &&
         (words[2] == eachletter[2]) &&
         (words[3] == eachletter[3]) &&
         (words[4] == eachletter[4]) &&
         (words[5] == eachletter[5]) &&
         (words[6] == eachletter[6])))
        {
          notJustLetters();
          return false;
        }
        else {
          submitAnswerFX();
          return( true );
        }
    }
}

function votingRound() {
  $("#votediv").dialog('open');
  $("#votediv").dialog('moveToTop');
  $("#votediv").show();
  // make sure answer submit is disabled after 2.5s answer delay
  $("#answersubmit").attr("disabled", true);
  $("#votediv").submit(function() {
    $(".votebuttons").attr("disabled", true);
    $("#roundtext").text("Vote accepted...");
    voteClickSFX.play();
  });
}

function resultsRound() {
  resultsMUS.play();
  $("#resultsdiv").dialog('open');
  $("#resultsdiv").addClass("centerall");
  $("#roundwinnerannounce").show();
  function showAllAnswers() {
    $(".answerresultinfo").show();
  }
  function showFastestAnswer() {
    $("#fastestanswer").show();
  }
  function showWinningVoters() {
    $("#winninganswervoters").show();
  }
  function showNonVoters() {
    $("#nonvoters").show();
  }
  function updatePoints(){
    $.ajax({
      url: "/room/updategamepoints",
      type: "POST"
    });
    $("#userlistbox").load("/room/familyroom #userlistbox");
  }
  $(".votebuttons").removeAttr("disabled");
  setTimeout(showAllAnswers, 500);
  setTimeout(showFastestAnswer, 1000);
  setTimeout(showWinningVoters, 2000);
  setTimeout(showNonVoters, 2500);
  setTimeout(updatePoints, 30);
}

function hideResultsDialog() {
  $("#roundwinnerannounce").hide();
  $(".answerresultinfo").hide();
  $("#fastestanswer").hide();
  $("#winninganswervoters").hide();
  $("#nonvoters").hide();
  $("#resultsdiv").dialog('close');
  $("#resultsdiv").hide();
}

function hideEndGameDialog() {
  $("#endofgamediv").dialog('close');
  $("#endofgamediv").hide();
}

function updateEndgameStats(){
  $.ajax({
    url: "/room/endofgamestatsinit",
    type: "POST"
  });
}

function gameOver() {
  function openDialog() {
    $("#endofgamediv").dialog('open');
    $("#endofgamediv").show();
    endOfGameMUS.play();
  }
  setTimeout(openDialog, 1250);
  function readyNewGame(){
    $.ajax({
      url: "/room/newgamegetready",
      type: "POST"
    });
  }
  setTimeout(readyNewGame, 23000);
}

function playerCountCheck(){
  $.ajax({
    url: "/room/playercountcheck",
    type: "POST"
  });
}

// Audio
function clickSfxButton() {
  if ($("#sfxbutton").text() == "Sounds: On"){
    Howler.mute();
    $("#sfxbutton").text("Sounds: Off")
  }
  else if ($("#sfxbutton").text() == "Sounds: Off"){
    Howler.unmute();
    $("#sfxbutton").text("Sounds: On")
  }
}

$("#sfxbutton").click(clickSfxButton);

/* function clickMusicButton() {
  if ($("#musicbutton").text() == "Music: On"){
    allMUS.forEach(mute);
    $("#musicbutton").text("Music: Off")
  }
  else if ($("#musicbutton").text() == "Music: Off"){
    allMUS.forEach(unmute);
    $("#musicbutton").text("Music: On")
  }
}

$("#musicbutton").click(clickMusicButton);
*/

