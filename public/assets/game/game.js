function playerEnterInit(){function t(){$("#userlistbox").load("/room/familyroom #userlistbox")}$.ajax({url:"/room/playerenterinit",type:"POST"}),$("#votediv").dialog({autoOpen:!1,closeOnEscape:!1,draggable:!1,resizable:!1,position:{my:"center top",at:"center top-10",of:"#categorytext"},title:"Pick your favorite...",width:"auto"}),$("#resultsdiv").dialog({autoOpen:!1,closeOnEscape:!1,draggable:!1,resizable:!1,position:{my:"center top",at:"center top-10",of:"#categorytext"},title:"Pick your favorite...",width:"auto"}),$("#endofgamediv").dialog({autoOpen:!1,closeOnEscape:!1,draggable:!1,resizable:!1,position:{my:"center top",at:"center top-10",of:"#categorytext"},title:"Pick your favorite...",width:"auto"}),setTimeout(t,500)}function hideTextStart(){$("#acceptedtext").hide(),$("#votediv").hide(),$("#resultsdiv").hide(),$("#endofgamediv").hide()}function roundPrep(){$.ajax({url:"/room/roundprep",type:"POST"})}function wtimer(){function t(){function t(){$("#votediv").load("/room/familyroom #votediv")}return e-=1,60==e&&gameplayMUS.play(),0==e&&($("#answertextfield").attr("disabled",!0),$("#answersubmit").attr("disabled",!0),setTimeout(t,500)),-1>=e?(clearInterval(n),void 0):((20==e||10==e||5==e)&&$("#timertext").addClass("animated tada"),(19==e||9==e||4==e)&&$("#timertext").removeClass("animated tada"),10==e&&$("#timertext").css("color","red"),$("#timertext").text(e),void 0)}var e=61,n=setInterval(t,1e3);$("#timertext").css("color","black"),$("#timertext").show()}function vtimer(){function t(){function t(){$("#resultsdiv").load("/room/familyroom #resultsdiv")}return e-=1,25==e&&voteMUS.play(),0==e&&($(".votebuttons").attr("disabled",!0),$("#roundtext").text("Voting complete..."),setTimeout(t,500)),-1>=e?(clearInterval(n),void 0):(5==e&&($("#timertext").addClass("animated tada"),$("#timertext").css("color","red")),4==e&&$("#timertext").removeClass("animated tada"),$("#timertext").text(e),void 0)}var e=26;$("#timertext").css("color","black");var n=setInterval(t,1e3)}function showLetters(){function t(){e=setTimeout(function(){document.getElementById("acroletters").style.visibility="visible",a++;var i=n.substring(0,a);$("#acroletters").text(i),$("#acroletters").removeClass("animated fadeOutUp"),$("#acroletters").addClass("animated fadeIn"),t(),a>0&&o>=a&&letterTurnSFX.play(),a==o+1&&(clearTimeout(e),wtimer(),$("#answertextfield").removeAttr("disabled"),$("#answersubmit").removeAttr("disabled"),document.getElementById("answertextfield").style.visibility="visible",$("#answerfield").removeClass("animated fadeOutDown"),$("#answerfield").addClass("animated rubberBand"),answerFieldAppearSFX.play())},1500)}var e,n=$("#acroletters").text(),o=n.length,a=0;$("#acroletters").css("fontSize","340%"),t()}function submitAnswerFX(){function t(){$("#answerfield").addClass("animated pulse")}function e(){$("#acceptedtext").load("/room/familyroom #acceptedtext"),$("#acceptedtext").addClass("animated flip"),$("#acceptedtext").show()}$("#acceptedtext").hide(),$("#acceptedtext").css("color","green"),$("#answerfield").removeClass("animated pulse"),$("#answerfield").removeClass("animated rubberBand"),$("#acceptedtext").removeClass("animated flip"),setTimeout(t,30),setTimeout(e,370),answerAcceptSFX.play()}function slideRoundText(){function t(){document.getElementById("roundtext").style.visibility="visible",$("#roundtext").addClass("animated slideInLeft")}document.getElementById("roundtext").style.visibility="hidden",$("#roundtext").removeClass("animated slideInLeft"),setTimeout(t,20)}function enterCatText(){function t(){document.getElementById("categorytext").style.visibility="visible",$("#categorytext").addClass("animated fadeInDown")}document.getElementById("categorytext").style.visibility="hidden",$("#categorytext").removeClass("animated fadeInDown"),setTimeout(t,500)}function intervalSubmittedCheck(){$("#submittedtext").load("/room/familyroom #submittedtext",".")}function checkSubmittedNumber(){function t(){clearInterval(e)}document.getElementById("submittedtext").style.visibility="visible";var e=setInterval(intervalSubmittedCheck,6e3);setTimeout(t,60300)}function notAnAcronym(){function t(){$("#acceptedtext").addClass("animated flip"),$("#acceptedtext").show()}$("#acceptedtext").hide(),$("#acceptedtext").css("color","red"),$("#acceptedtext").text("Not an acronym!"),$("#acceptedtext").removeClass("animated flip"),setTimeout(t,230),badAnswerSFX.play()}function incorrectLength(){function t(){$("#acceptedtext").addClass("animated flip"),$("#acceptedtext").show()}$("#acceptedtext").hide(),$("#acceptedtext").css("color","red"),$("#acceptedtext").text("Incorrect length!"),$("#acceptedtext").removeClass("animated flip"),setTimeout(t,230),badAnswerSFX.play()}function notJustLetters(){function t(){$("#acceptedtext").addClass("animated flip"),$("#acceptedtext").show()}$("#acceptedtext").hide(),$("#acceptedtext").css("color","red"),$("#acceptedtext").text("Not feeling creative?"),$("#acceptedtext").removeClass("animated flip"),setTimeout(t,230),badAnswerSFX.play()}function acroValidate(t){var e=t,n=e.split(""),o=document.getElementById("answertextfield").value,a=o.toUpperCase().match(/\S+/g);return 3==n.length?3!=a.length||a[0].charAt(0)==n[0]&&a[1].charAt(0)==n[1]&&a[2].charAt(0)==n[2]?a.length<3||a.length>3?(incorrectLength(),!1):3==a.length&&a[0]==n[0]&&a[1]==n[1]&&a[2]==n[2]?(notJustLetters(),!1):(submitAnswerFX(),!0):(notAnAcronym(),!1):4==n.length?4!=a.length||a[0].charAt(0)==n[0]&&a[1].charAt(0)==n[1]&&a[2].charAt(0)==n[2]&&a[3].charAt(0)==n[3]?a.length<4||a.length>4?(incorrectLength(),!1):4==a.length&&a[0]==n[0]&&a[1]==n[1]&&a[2]==n[2]&&a[3]==n[3]?(notJustLetters(),!1):(submitAnswerFX(),!0):(notAnAcronym(),!1):5==n.length?5!=a.length||a[0].charAt(0)==n[0]&&a[1].charAt(0)==n[1]&&a[2].charAt(0)==n[2]&&a[3].charAt(0)==n[3]&&a[4].charAt(0)==n[4]?a.length<5||a.length>5?(incorrectLength(),!1):5==a.length&&a[0]==n[0]&&a[1]==n[1]&&a[2]==n[2]&&a[3]==n[3]&&a[4]==n[4]?(notJustLetters(),!1):(submitAnswerFX(),!0):(notAnAcronym(),!1):6==n.length?6!=a.length||a[0].charAt(0)==n[0]&&a[1].charAt(0)==n[1]&&a[2].charAt(0)==n[2]&&a[3].charAt(0)==n[3]&&a[4].charAt(0)==n[4]&&a[5].charAt(0)==n[5]?a.length<6||a.length>6?(incorrectLength(),!1):6==a.length&&a[0]==n[0]&&a[1]==n[1]&&a[2]==n[2]&&a[3]==n[3]&&a[4]==n[4]&&a[5]==n[5]?(notJustLetters(),!1):(submitAnswerFX(),!0):(notAnAcronym(),!1):7==n.length?7!=a.length||a[0].charAt(0)==n[0]&&a[1].charAt(0)==n[1]&&a[2].charAt(0)==n[2]&&a[3].charAt(0)==n[3]&&a[4].charAt(0)==n[4]&&a[5].charAt(0)==n[5]&&a[6].charAt(0)==n[6]?a.length<7||a.length>7?(incorrectLength(),!1):7==a.length&&a[0]==n[0]&&a[1]==n[1]&&a[2]==n[2]&&a[3]==n[3]&&a[4]==n[4]&&a[5]==n[5]&&a[6]==n[6]?(notJustLetters(),!1):(submitAnswerFX(),!0):(notAnAcronym(),!1):void 0}function votingRound(){$("#votediv").dialog("open"),$("#votediv").dialog("moveToTop"),$("#votediv").show(),$("#votediv").submit(function(){$(".votebuttons").attr("disabled",!0),$("#roundtext").text("Vote accepted..."),voteClickSFX.play()})}function resultsRound(){function t(){$(".answerresultinfo").show()}function e(){$("#fastestanswer").show()}function n(){$("#winninganswervoters").show()}function o(){$("#nonvoters").show()}function a(){$.ajax({url:"/room/updategamepoints",type:"POST"}),$("#userlistbox").load("/room/familyroom #userlistbox")}resultsMUS.play(),$("#resultsdiv").dialog("open"),$("#resultsdiv").addClass("centerall"),$("#roundwinnerannounce").show(),$(".votebuttons").removeAttr("disabled"),setTimeout(t,500),setTimeout(e,1e3),setTimeout(n,2e3),setTimeout(o,2500),setTimeout(a,1500)}function hideResultsDialog(){$("#roundwinnerannounce").hide(),$(".answerresultinfo").hide(),$("#fastestanswer").hide(),$("#winninganswervoters").hide(),$("#nonvoters").hide(),$("#resultsdiv").dialog("close"),$("#resultsdiv").hide()}function hideEndGameDialog(){$("#endofgamediv").dialog("close"),$("#endofgamediv").hide()}function updateEndgameStats(){$.ajax({url:"/room/endofgamestatsinit",type:"POST"})}function gameOver(){function t(){$("#endofgamediv").dialog("open"),$("#endofgamediv").show(),endOfGameMUS.play()}function e(){$.ajax({url:"/room/newgamegetready",type:"POST"})}setTimeout(t,1250),setTimeout(e,12500)}function playerCountCheck(){$.ajax({url:"/room/playercountcheck",type:"POST"})}function clickSfxButton(){"Sounds: On"==$("#sfxbutton").text()?(Howler.mute(),$("#sfxbutton").text("Sounds: Off")):"Sounds: Off"==$("#sfxbutton").text()&&(Howler.unmute(),$("#sfxbutton").text("Sounds: On"))}$("#sfxbutton").click(clickSfxButton);