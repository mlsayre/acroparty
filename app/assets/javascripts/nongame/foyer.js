$("#roomsrefresh").click(function() {
  $("#roomslist").spin('small');
  setTimeout(function() {
    $("#roomslist").spin(false);
  }, 1000 );
  setTimeout(function() {
    $("#roomslist").load("/pages/foyer #roomslist", ".");
  }, 800 );

});
