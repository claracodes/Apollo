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
