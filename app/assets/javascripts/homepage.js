$(".be-inspired").click(function() {
    $('html, body').animate({
        scrollTop: $("#inspiration-card").offset().top
    }, 800);
});
