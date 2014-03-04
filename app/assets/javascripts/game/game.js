// Writing and voting timer
function wtimer() {
  var answercount=61; // Answer write time (s)
  var writecounter=setInterval(writingtimer, 1000);
  $("#timertext").css('color', 'black');
  function writingtimer() {
    answercount=answercount-1;
    if ( answercount == 0 )
    {
      $("#answertextfield").attr("disabled", true);
      $("#answersubmit").attr("disabled", true);
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

function showLetters() {
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
      if (character == length + 1) {
        clearTimeout(timeOut);
        wtimer();
        $("#answertextfield").removeAttr("disabled");
        $("#answersubmit").removeAttr("disabled");
        $('#answerfield').removeClass('animated fadeOutDown');
        $('#answerfield').addClass('animated rubberBand');
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
    $('#acceptedtext').addClass('animated flip');
    $("#acceptedtext").show();
    $("#acceptedtext").load("/room/familyroom #acceptedtext", ".");
  }
  $('#answerfield').removeClass('animated pulse');
  $('#answerfield').removeClass('animated rubberBand');
  setTimeout(addPulse, 30);
  $('#acceptedtext').removeClass('animated flip');
  setTimeout(addAcceptedTextFlip, 230);
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

// to check number of submitted entries
function intervalSubmittedCheck() {
  $("#submittedtext").load("/room/familyroom #submittedtext", ".");
}

function checkSubmittedNumber() {
  document.getElementById("submittedtext").style.visibility="visible";
  var submittedtextcheck = setInterval(intervalSubmittedCheck, 6000);
  function endSubmittedCheck() {
    setTimeout(endSubmittedCheck, 60300);
  }
  endSubmittedCheck();
}
