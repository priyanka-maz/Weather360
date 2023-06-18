<!doctype html>
<html lang="en">
<head>
	<meta http-equiv="Expires" CONTENT="0">  
	<meta http-equiv="Cache-Control" CONTENT="no-cache">  
	<meta http-equiv="Pragma" CONTENT="no-cache">  
  <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.3.1.js"
			integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
			crossorigin="anonymous">
	</script>	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="other/css/style1.css">

	<script>
		$(document).on("scroll", function() {
			var pageTop = $(document).scrollTop();
			var pageBottom = pageTop + $(window).height();
			var tags = $(".tag");
		  
			for (var i = 0; i < tags.length; i++) {
			  var tag = tags[i];
			  if ($(tag).position().top < pageBottom) {
				$(tag).addClass("visible");
			  } else {
				$(tag).removeClass("visible");
			  }
			}
		  });
	</script>


	<script src="https://kit.fontawesome.com/13deb536c6.js" crossorigin="anonymous"></script>

	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home-Weather360</title>
    <link rel="icon" href="Pics/icon.png">
   
    <script>
		$(function () {
			$("#header").load("header.jsp");
			$("#footer").load("footer.html");
		});
	</script>
	

</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <div class="font">
		<div class="container-fluid">
			<div id="header"></div>
			   <div class="header-adjustment"></div>	
			   <div> 
			   	<div id="background"></div>
				  <div id="content1">
				  <div class="row justify-content-center">
      				<div class="col-8 text-center">
				    <a href=currentWeather.html><button id="find-location">Find Location</button></a>
      				</div>
      			  </div>
				    <div id="boxes1">
				      <div class="box1" id="box1">
						<div class="city" id="city">San Francisco</div>
	                    <div class="temp">
	                        <img src="" alt="" height="60" id="weather-icon">
	                        <span id="temperature"></span>
	                    </div>
				      </div>
				      <div class="box1" id="box2">
						<div class="city" id="city">Berlin</div>
	                    <div class="temp">
	                        <img src="" alt="" height="60" id="weather-icon">
	                        <span id="temperature"></span>
	                    </div>
				      </div>
				      <div class="box1" id="box3">
				      	<div class="city" id="city">Shanghai</div>
	                    <div class="temp">
	                        <img src="" alt="" height="60" id="weather-icon">
	                        <span id="temperature"></span>
	                    </div>
				    </div>
				  </div>
			<main class="main-content">
				<div class="fullwidth-block" >
					<div class="container">
						<h2 class="section-title">Latest Weather Articles</h2>
				   		<%= request.getAttribute("row") %>
					</div>
				</div>
				<div class="fullwidth-block">
					<div class="container">
						<hr>
						<div class="row" style="margin-top:80px;">
							<div class="col-md-4">
								<h2 class="section-title">Application features</h2>
								<ul class="arrow-feature">
									<li>
										<h3>No Sign Up Required</h3>
										<p>To access our weather information, users don't need to sign up and can simply visit our website!</p>
									</li>
									<li>
										<h3>Join our free community towards accessible weather content!</h3>
										<p>Weather enthusiasts can contribute informed articles towards latest weather events free of cost.</p>
									</li>
								</ul>
							</div>
							<div class="col-md-4">
								<h2 class="section-title">Weather Analysis Technologies</h2>
								<ul class="arrow-list">
									<li><a href="">Visual Interface for open source weather information</a></li>
									<li><a href="https://home.openweathermap.org/">OpenWeatherMap provides incredibly detailed weather parameters</a></li>
									<li><a href="https://www.worldweatheronline.com/">World Weather API and Weather Forecast is used to get global daily, hourly, minute weather forecasts.</a></li>
									<li><a href="https://www.pexels.com/api/">Pixel provides the seamless integration of curated weather images to our website.</a></li>
								</ul>
							</div>
							<div class="col-md-4">
								<h2 class="section-title">Exclusive Weather Photos Collection</h2>
								<div class="photo-grid">
									<a href="Pics/Gallery/sunset_sky.jpg""><img src="Pics/Gallery/sunset_sky.jpg" alt="Sunset image"></a>
									<a href="Pics/Gallery/starry.jpg""><img src="Pics/Gallery/starry.jpg"" alt="Starry Night"></a>
									<a href="Pics/Gallery/aurora.jpg"><img src="Pics/Gallery/aurora.jpg" alt="Aurora Borealis"></a>
									<a href="Pics/Gallery/tides.jpg"><img src="Pics/Gallery/tides.jpg" alt="Surfing in the tides"></a>
									<a href="Pics/Gallery/thunder.jpg"><img src="Pics/Gallery/thunder.jpg" alt="Massive Thunderstorm"></a>
									<a href="Pics/Gallery/hills.jpg"><img src="Pics/Gallery/hills.jpg" alt="Kanchenjunga"></a>
									<a href="Pics/Gallery/ocean-storm.jpg"><img src="Pics/Gallery/ocean-storm.jpg" alt="Ocean Storm"></a>
									<a href="Pics/Gallery/clear-sky.jpg"><img src="Pics/Gallery/clear-sky.jpg" alt="Clear Sky"></a>
									<a href="Pics/Gallery/snow.jpg"><img src="Pics/Gallery/snow.jpg" alt="Snowy Winter"></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		</div>
	</div>
	<div id="footer"></div>
<script>
	
	var boxesData = [
	  { city: "San Francisco", id: "box1" },
	  { city: "Berlin", id: "box2" },
	  { city: "Shanghai", id: "box3" }
	];

	var apiKey = '';

	// Fetch weather data and update each box
	boxesData.forEach(function(boxData) {
	  var boxElement = document.getElementById(boxData.id);
	  var cityNameElement = boxElement.querySelector(".city");
	  var weatherIconElement = boxElement.querySelector(".temp img");
	  var temperatureElement = boxElement.querySelector(".temp span");
	  
	  console.log(boxData.city);

	  var weatherUrl = 'https://api.openweathermap.org/data/2.5/weather?q=' + boxData.city + '&appid=';

	  // Fetch weather data from the API
	  fetch(weatherUrl)
	    .then(function(response) {
	      return response.json();
	    })
	    .then(function(data) {
	      // Extract relevant information from the JSON response
	      var weatherIcon = data.weather[0].icon;
	      var temperature = Math.round(data.main.temp - 273.15) + "°C";
	      var location = data.name;

	      // Update the HTML elements with weather information
	      cityNameElement.textContent = location;
	      weatherIconElement.src = 'http://openweathermap.org/img/w/' + weatherIcon + '.png';
	      temperatureElement.textContent = temperature;

	      // Make a request to the Pexels API for location image
	      fetch('https://api.pexels.com/v1/search?query=' + location + '&per_page=1', {
	        headers: {
	          Authorization: apiKey
	        }
	      })
	        .then(function(response) {
	          return response.json();
	        })
	        .then(function(data) {
	          // Extract the image URL from the API response
	          var imageUrl = data.photos[0].src.medium;

	          // Update the background image of the box
	          boxElement.style.backgroundImage = 'url(' + imageUrl + ')';
	        })
	        .catch(function(error) {
	          console.log('Error fetching image from Pexels:', error);
	        });
	    })
	    .catch(function(error) {
	      console.log('Error fetching weather data:', error);
	    });
	});
</script>

</body>
</html>