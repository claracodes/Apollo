// Ajax for mood (version 1)

// var mood = document.getElementById("search_mood");
// console.log(mood)

// mood.addEventListener("change", function(e) {
//   var form = document.getElementById("submitSearch");
//   form.click();
// });

// Ajax for all inputs (version 2)
var filters = document.querySelectorAll(".search-ajax");

filters.forEach(function(element) {

  addEventListener("change", function(e) {
    var form = document.getElementById("submitSearch");
    form.click();
  });
});



// DROPDOWN FILTER BAR //

$(function () {

  var defaultselectbox = $('#cusSelectbox1');
  var numOfOptions = $('#cusSelectbox1').children('option').length;

  // hide select tag
  defaultselectbox.addClass('s-hidden1');

  // wrapping default selectbox into custom select block
  defaultselectbox.wrap('<div class="cusSelBlock1"></div>');

  // creating custom select div
  defaultselectbox.after('<div class="selectLabel1"></div>');

  // getting default select box selected value
  $('.selectLabel1').text(defaultselectbox.children('option').eq(0).text());

  // appending options to custom un-ordered list tag
  var cusList = $('<ul/>', { 'class': 'options1 select required'} ).insertAfter($('.selectLabel1'));

  // generating custom list items
  for(var i=0; i< numOfOptions; i++) {
    $('<li/>', {
    text: defaultselectbox.children('option').eq(i).text(),
    rel: defaultselectbox.children('option').eq(i).val()
    }).appendTo(cusList);
  }

  // open-list and close-list items functions
  function openList() {
    for(var i=0; i< numOfOptions; i++) {
      $('.options1').children('li').eq(i).attr('tabindex', i).css(
        'transform', 'translateY('+(i*100+100)+'%)').css(
        'transition-delay', i*30+'ms');
    }
  }

  function closeList() {
    for(var i=0; i< numOfOptions; i++) {
      $('.options1').children('li').eq(i).css(
        'transform', 'translateY('+i*0+'px)').css('transition-delay', i*0+'ms');
    }
    // $('.options').children('li').eq(1).css('transform', 'translateY('+2+'px)');
    // $('.options').children('li').eq(2).css('transform', 'translateY('+4+'px)');
  }

  // click event functions
  $('.selectLabel1').click(function () {
    $(this).toggleClass('active');
    if( $(this).hasClass('active') ) {
      openList();
      focusItems();
    }
    else {
      closeList();
    }
  });

  $(".options1 li").on('keypress click', function(e) {
    e.preventDefault();
    $('.options1 li').siblings().removeClass();
    closeList();
    $('.selectLabel1').removeClass('active');
    $('.selectLabel1').text($(this).text());
    defaultselectbox.val($(this).text());
    // $('.selected-item p span').text($('.selectLabel').text());
  });

});

function focusItems() {

  $('.options1').on('focus', 'li', function() {
    $this = $(this);
    $this.addClass('active').siblings().removeClass();
  }).on('keydown', 'li', function(e) {
    $this = $(this);
    if (e.keyCode == 40) {
      $this.next().focus();
      return false;
    } else if (e.keyCode == 38) {
      $this.prev().focus();
      return false;
    }
  }).find('li').first().focus();

}




// DROPDOWN FILTER BAR //

$(function () {

  var defaultselectbox = $('#cusSelectbox2');
  var numOfOptions = $('#cusSelectbox2').children('option').length;

  // hide select tag
  defaultselectbox.addClass('s-hidden2');

  // wrapping default selectbox into custom select block
  defaultselectbox.wrap('<div class="cusSelBlock2"></div>');

  // creating custom select div
  defaultselectbox.after('<div class="selectLabel2"></div>');

  // getting default select box selected value
  $('.selectLabel2').text(defaultselectbox.children('option').eq(0).text());

  // appending options to custom un-ordered list tag
  var cusList = $('<ul/>', { 'class': 'options2 select required'} ).insertAfter($('.selectLabel2'));

  // generating custom list items
  for(var i=0; i< numOfOptions; i++) {
    $('<li/>', {
    text: defaultselectbox.children('option').eq(i).text(),
    rel: defaultselectbox.children('option').eq(i).val()
    }).appendTo(cusList);
  }

  // open-list and close-list items functions
  function openList() {
    for(var i=0; i< numOfOptions; i++) {
      $('.options2').children('li').eq(i).attr('tabindex', i).css(
        'transform', 'translateY('+(i*100+100)+'%)').css(
        'transition-delay', i*30+'ms');
    }
  }

  function closeList() {
    for(var i=0; i< numOfOptions; i++) {
      $('.options2').children('li').eq(i).css(
        'transform', 'translateY('+i*0+'px)').css('transition-delay', i*0+'ms');
    }
    // $('.options').children('li').eq(1).css('transform', 'translateY('+2+'px)');
    // $('.options').children('li').eq(2).css('transform', 'translateY('+4+'px)');
  }

  // click event functions
  $('.selectLabel2').click(function () {
    $(this).toggleClass('active');
    if( $(this).hasClass('active') ) {
      openList();
      focusItems();
    }
    else {
      closeList();
    }
  });

  $(".options2 li").on('keypress click', function(e) {
    e.preventDefault();
    $('.options2 li').siblings().removeClass();
    closeList();
    $('.selectLabel2').removeClass('active');
    $('.selectLabel2').text($(this).text());
    defaultselectbox.val($(this).text());

    var form = document.getElementById("submitSearch");
    form.click();
    // $('.selected-item p span').text($('.selectLabel').text());
  });

});

function focusItems() {

  $('.options2').on('focus', 'li', function() {
    $this = $(this);
    $this.addClass('active').siblings().removeClass();
  }).on('keydown', 'li', function(e) {
    $this = $(this);
    if (e.keyCode == 40) {
      $this.next().focus();
      return false;
    } else if (e.keyCode == 38) {
      $this.prev().focus();
      return false;
    }
  }).find('li').first().focus();

}





// DROPDOWN FILTER BAR //

$(function () {

  var defaultselectbox = $('#cusSelectbox3');
  var numOfOptions = $('#cusSelectbox3').children('option').length;

  // hide select tag
  defaultselectbox.addClass('s-hidden3');

  // wrapping default selectbox into custom select block
  defaultselectbox.wrap('<div class="cusSelBlock3"></div>');

  // creating custom select div
  defaultselectbox.after('<div class="selectLabel3"></div>');

  // getting default select box selected value
  $('.selectLabel3').text(defaultselectbox.children('option').eq(0).text());

  // appending options to custom un-ordered list tag
  var cusList = $('<ul/>', { 'class': 'options3 select required'} ).insertAfter($('.selectLabel3'));

  // generating custom list items
  for(var i=0; i< numOfOptions; i++) {
    $('<li/>', {
    text: defaultselectbox.children('option').eq(i).text(),
    rel: defaultselectbox.children('option').eq(i).val()
    }).appendTo(cusList);
  }

  // open-list and close-list items functions
  function openList() {
    for(var i=0; i< numOfOptions; i++) {
      $('.options3').children('li').eq(i).attr('tabindex', i).css(
        'transform', 'translateY('+(i*100+100)+'%)').css(
        'transition-delay', i*30+'ms');
    }
  }

  function closeList() {
    for(var i=0; i< numOfOptions; i++) {
      $('.options3').children('li').eq(i).css(
        'transform', 'translateY('+i*0+'px)').css('transition-delay', i*0+'ms');
    }
    // $('.options').children('li').eq(1).css('transform', 'translateY('+2+'px)');
    // $('.options').children('li').eq(2).css('transform', 'translateY('+4+'px)');
  }

  // click event functions
  $('.selectLabel3').click(function () {
    $(this).toggleClass('active');
    if( $(this).hasClass('active') ) {
      openList();
      focusItems();
    }
    else {
      closeList();
    }
  });

  $(".options3 li").on('keypress click', function(e) {
    e.preventDefault();
    $('.options3 li').siblings().removeClass();
    closeList();
    $('.selectLabel3').removeClass('active');
    $('.selectLabel3').text($(this).text());
    defaultselectbox.val($(this).text());

    var form = document.getElementById("submitSearch");
    form.click();
    // $('.selected-item p span').text($('.selectLabel').text());
  });

});

function focusItems() {

  $('.options3').on('focus', 'li', function() {
    $this = $(this);
    $this.addClass('active').siblings().removeClass();
  }).on('keydown', 'li', function(e) {
    $this = $(this);
    if (e.keyCode == 40) {
      $this.next().focus();
      return false;
    } else if (e.keyCode == 38) {
      $this.prev().focus();
      return false;
    }
  }).find('li').first().focus();

}
