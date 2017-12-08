$(".be-inspired").click(function() {
    $('html, body').animate({
        scrollTop: $("#inspiration-card").offset().top
    }, 800);
});


// $(".list-moods .mood").click(function(e) {
//   e.preventDefault();
//   // fetch value of button (nerdy, ...)
//   var mood = $(this).data("mood") // returns the value data-mood of the li
//   // change value of #hidden-mood
//   $('#hidden-mood').val(mood)
//   // submit the value to the whole simple_form
//   $('#home-form').submit();
// });

// $(".normal-search").click(function(e) {
//   e.preventDefault();
//   // fetch value of button (nerdy, ...)
//   var search = $(this).data("search") // returns the value data-mood of the li
//   // submit the value to the whole simple_form
//   $('#home-form').submit();
// });

