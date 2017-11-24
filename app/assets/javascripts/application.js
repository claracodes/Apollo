//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-datepicker

//= require underscore
//= require gmaps/google
//= require_tree .

$(".be-inspired").click(function() {
    $('html, body').animate({
        scrollTop: $("#inspiration-card").offset().top
    }, 800);
});
