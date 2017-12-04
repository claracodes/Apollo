// Ajax for mood (version 1)

// const mood = document.getElementById("search_mood");
// console.log(mood)

// mood.addEventListener("change", function(e) {
//   const form = document.getElementById("submitSearch");
//   form.click();
// });

// Ajax for all inputs (version 2)
const filters = document.querySelectorAll(".search-ajax");
console.log(".search-ajax")

filters.forEach(function(element) {
  addEventListener("change", function(e) {
    const form = document.getElementById("submitSearch");
    form.click();
  });
});



