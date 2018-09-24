document.addEventListener("DOMContentLoaded", function(){



  var canvas = document.getElementById('myCanvas'); // in your HTML this element appears as <canvas id="myCanvas"></canvas>
  canvas.width = 500;
  canvas.height = 500;


var ctx = canvas.getContext('2d');

ctx.fillStyle = 'gold'; // sets the color to fill in the rectangle with
ctx.fillRect(0, 0, 500, 500);

ctx.beginPath();
ctx.arc(200, 200, 20, 0, 2*Math.PI, true);
ctx.strokeStyle = "blue";
ctx.lineWidth = 50;
ctx.stroke();
ctx.fillStyle = "green";
ctx.fill();



});
