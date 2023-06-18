<!doctype html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <script src="https://code.jquery.com/jquery-3.3.1.js"
			integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
			crossorigin="anonymous">
	</script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="other/css/style1.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
	<script>
		$(function () {
			$("#header").load("header.jsp");
			$("#footer").load("footer.html");
		});
	</script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Profile</title>
    <link rel="icon" href="Pics/icon.png">
		<script>

		var new_address;
		var old_address;
		var res;

		function address_edit()
		{
			var regex = "^\\s+$";
			var edit_button = document.getElementById("edit-button");
			var submit_button = document.getElementById("submit-button");
			var address_box = document.getElementById("new-address-box");
			
			address_box.value = address.innerHTML;
			old_address = address_box.value;
			address.innerHTML = '';
			address_box.style.display = "block";
			address.style.display = "none";
			edit_button.style.display = "none";
			submit_button.style.display = "block";
		}

		function change_address()
		{
			var edit_button = document.getElementById("edit-button");
			var submit_button = document.getElementById("submit-button");
			var address_box = document.getElementById("new-address-box");
			

			new_address = address_box.value;
			address_box.style.display = "none";
			address.style.display = "block";
			edit_button.style.display = "block";
			submit_button.style.display = "none";
			
			var status = document.getElementById("status");


			if(new_address == old_address || new_address =="")
			{
				address.innerHTML = old_address;
			}
			else
			{
				

				address.innerHTML = new_address;
				var http = new XMLHttpRequest();
            	http.open("POST", "Profile", true);
            	http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            	var params = "new_location=" + new_address;
            	http.send(params);
            	

				http.onreadystatechange = function() {
					if (http.readyState == XMLHttpRequest.DONE) {
						console.log(http.response);
						
						res = Number(http.response.toString());
						status.style.textShadow = "1px 1px 2px white";
						if (res == 1) 
						{
							status.style.color = "green";
							status.innerHTML = "Primary Location changed successfully!";
							console.log(res);
							setTimeout(function() {
								    window.location.reload();
								  }, 2500);
						}
						else
						{
							status.style.color = "red";
							status.innerHTML = "Sorry, could't change your location.";
							console.log(res);
						}
					}
				}
			}
		}
	</script>   
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>  
    <div class="font">
		<div class="container-fluid">
			<div id="header"></div>
			   <div class="header-adjustment"></div>
		<div class="row d-flex align-items-center">
        <div class="col">
		<div class="box-formed">
			<div class="left-profile">
				<div class="row">
				 <div class="col temp col-lg-4"><span id="temperature"></span></div>
				 <div class="col col-lg-7">
					<div class="row">
					  <div class="city" id="city">
					    <i class="fa-sharp fa-solid fa-location-dot"></i>
					    <%= request.getAttribute("location") %>
					  </div>
					</div>				 	
					<div class="row"><div class="date" id="date"></div></div>
				 </div>
                 <div class="col col-lg-1"><div class="temp">
                     <img src="" alt="" height="60" id="weather-icon">
                 </div></div>
	             </div>
			</div>
			<div class="right-profile">
					<h2>Welcome <%= request.getAttribute("first_name") %> !</h2><br>
					<h6>Weather Details</h6>
					<div class="row">
				        <div style="opacity:60%" class="col">Feels Like</div>
				        <div class="col" id="feels"></div>
				    </div> 
				    <div class="row">
				        <div style="opacity:60%" class="col">Minimum Temperature</div>
				        <div class="col" id="min"></div>
				    </div>
				    <div class="row">
				        <div style="opacity:60%" class="col">Maximum Temperature</div>
				        <div class="col" id="max"></div>
				    </div><div class="row">
				        <div style="opacity:60%" class="col">Pressure</div>
				        <div class="col" id="pres"></div>
				    </div><div class="row">
				        <div style="opacity:60%" class="col">Humidity</div>
				        <div class="col" id="hum"></div>
				    </div><div class="row">
				        <div style="opacity:60%" class="col">Wind Speed</div>
				        <div class="col" id="winds"></div>
				    </div><div class="row">
				        <div style="opacity:60%" class="col">Visibility</div>
				        <div class="col" id="visi"></div>
				    </div><div class="row">
				        <div style="opacity:60%" class="col">Cloudiness</div>
				        <div class="col" id="cloud"></div>
				    </div>
				    <hr style="height: 2px; background-color: white; border: none; margin: 10px 0; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);">
				    <h6>Your Details</h6>
				    <div class="row">
				        <div style="opacity:60%" class="col">Name</div>
				        <div class="col"><%= request.getAttribute("first_name") %> <%= request.getAttribute("last_name") %></div>
				    </div> 
				    <div class="row">
				        <div style="opacity:60%" class="col">Email</div>
				        <div class="col"><%= request.getAttribute("email") %></div>
				    </div>
				    <div class="row">
				        <div style="opacity:60%" class="col">Primary Location</div>
				        <div class="col">
				        	<div class="row">
					        	<div class="col">
						        	<div id="address"><%= request.getAttribute("location") %></div>
						        	<textarea name="address" class="form-control" id="new-address-box" style="display:none;" required></textarea>
									<p id="status" style="font-size: 15px;"></p>
								</div>
								<div class="col">
									<i class="fa-solid fa-pen-to-square fa-xl" id="edit-button" onclick="address_edit()"></i>
									<button type="sub" class="btn btn-success" id="submit-button" style="display:none" onclick="change_address()">Submit</button>
								</div>
							</div>
						</div>
				    </div>
				    <hr style="height: 2px; background-color: white; border: none; margin: 10px 0; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);">
				    <div class="profile-buttons">
				    	<a href="Posts">
							<button type="sub" class="btn reg-btn form-submit" style="margin:2px">Your Posts</button>
						</a>
					    <a href="Logout">
							<button type="sub" class="btn log-btn form-submit" style="margin:2px" >Logout</button>
						</a>
					</div>   
			</div>
			</div>
			</div>
		</div>
	</div>
<div id="footer"></div>	
</div>	
<script>
	 $(document).ready(function() {
	                // Use the country and city values to fetch the weather data
	                var cityElement = document.getElementById('city');
					var location = cityElement.textContent.trim();
					
	                const weatherUrl = `https://api.openweathermap.org/data/2.5/weather?q=${location}&appid=`;
	
	                // Fetch weather data from the API
	                fetch(weatherUrl)
	                    .then(response => response.json())
	                    .then(data => {
	                        // Extract relevant information from the JSON response
	                        const weatherIcon = data.weather[0].icon;
	                        const weatherDescription = data.weather[0].description;
	                        const temperature = Math.round(data.main.temp - 273.15);
	                        const feelsLike = Math.round(data.main.feels_like - 273.15);
	                        const tempMin = Math.round(data.main.temp_min - 273.15);
	                        const tempMax = Math.round(data.main.temp_max - 273.15);
	                        const pressure = data.main.pressure;
	                        const humidity = data.main.humidity;
	                        const windSpeed = data.wind.speed;
	                        const visibility = data.visibility;
	                        const clouds = data.clouds.all;
	                        const location = data.name;
	
	                        const currentDate = new Date();
	                        const options = { weekday: 'long', day: 'numeric', month: 'long', year: 'numeric' };
	                        const formattedDate = currentDate.toLocaleDateString('en-US', options);
				
	                        // Update the HTML elements with weather information
							document.getElementById('weather-icon').src = 'http://openweathermap.org/img/w/' + weatherIcon + '.png';
							document.getElementById('temperature').textContent = temperature + '°C';
							document.getElementById('date').textContent = formattedDate;
							
							document.getElementById('feels').textContent = feelsLike + '°C';
							document.getElementById('min').textContent = tempMin + '°C';
							document.getElementById('max').textContent = tempMax + '°C';
							document.getElementById('pres').textContent = pressure + ' hPa';
							document.getElementById('hum').textContent = humidity + '%';
							document.getElementById('winds').textContent = windSpeed + ' m/s';
							document.getElementById('visi').textContent = visibility + ' meters';
							document.getElementById('cloud').textContent = clouds + '%';
							updateBackground(weatherDescription);

	                    })
	                    .catch(error => {
	                        console.log('Error fetching weather data:', error);
	                    });
	                

	                function updateBackground(weatherDescription) {
	                    const box = document.querySelector('.box-formed');

	                    let imageUrl = '';
	                    // Choose the appropriate image URL based on weather description
	                    
	                    if (weatherDescription.includes('clear')) {
	                        imageUrl = 'Pics/clear.jpg';
	                    } else if (weatherDescription.includes('few cloud')) {
	                        imageUrl = 'Pics/few.jpg';
	                    } else if (weatherDescription.includes('overcast cloud')) {
	                        imageUrl = 'Pics/overcast.jpg';
	                    } else if (weatherDescription.includes('broken') || weatherDescription.includes('scattered')) {
	                        imageUrl = 'Pics/broken.jpg';
	                    } else if (weatherDescription.includes('haze')) {
	                        imageUrl = 'Pics/haze.jpg';
	                    } else if (weatherDescription.includes('snow')) {
	                        imageUrl = 'Pics/snow.jpg';
	                    } else if (weatherDescription.includes('frost')) {
	                        imageUrl = 'Pics/frost.jpg';
	                    }else if (weatherDescription.includes('thunder')) {
		                    imageUrl = 'Pics/thunder.jpg';
	                    }else if (weatherDescription.includes('lightning')) {
		                    imageUrl = 'Pics/lightning.jpg';
	                    }else if (weatherDescription.includes('sun') || weatherDescription.includes('hot')) {
		                    imageUrl = 'Pics/hot.png';
	                    } else if (weatherDescription.includes('rain')) {
	                        imageUrl = 'Pics/rain2.jpg';
	                    } else {
	                        imageUrl = 'Pics/default.jpg';
	                    }

	                    // Set the background image
	                    box.style.backgroundImage = 'url(' + imageUrl + ')';
	                }
	            });
	 </script>
</body>
</html>