_today: function () {
  var myDate = document.querySelector(myDate);
  var today = new Date();
  myDate.value = today.toISOString().substr(0, 10);
},