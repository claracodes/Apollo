$('.datepicker').datepicker({
  format: "dd/mm/yyyy",
  todayBtn: true,
  clearBtn: true,
}).on('changeDate', function(ev){
  var form = document.getElementById("submitSearch");
  form.click();
});



// $('.datepicker').click(function() {
//   console.log("coucou");
// });
