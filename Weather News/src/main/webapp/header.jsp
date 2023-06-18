<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Header</title>
    
    <link rel="icon" href="Pics/icon.png">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="//db.onlinewebfonts.com/c/a1d0120b37754be8e80e39ab6ab95130?family=BBC+Reith+Sans" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="other/css/style1.css">

    <script>
        $(document).ready(function() {
            $(".dropdown-toggle").dropdown();
        });
    </script>
   
</head>
<body>
    
    <div class="font">
       
        <nav class="navbar navbar-expand-lg header">
            <!--Store name and Logo-->

            <a class="navbar-brand" style="text-decoration:none" href="Index">
                <div class="row">
                    <div class="col">
                        <img class="brand-img" src="Pics/icon.png" height="90">
                    </div>
                    <div class="col">
                        <div class="brand-name">Weather360</div>
                    </div>
                </div>
            </a>

            <!--Collapsed NavBars toggle-->
            <div class="menu-button-padding">
                <button class="navbar-toggler round" type="button" data-bs-toggle="collapse" data-bs-target="#NavBar" aria-expanded="false" aria-controls="#NavBar" aria-label="Toggle navigation" ><span class="navbar-toggler-icon"></span></button>

            </div>
           
            <!--Actual NavBar-->
            <div class="collapse navbar-collapse nav-part nav-item right-icons" id="NavBar">

                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a href="Index" class="nav-link nav-link1 active">Home<i class="fa-solid fa-house fa-xl right-cons"></i></a>
                    </li>
                    
                    <li class="nav-item">
                        <a href="currentWeather.html" class="nav-link nav-link1 active">Location Weather<i class="fa-solid fa-location-dot fa-xl right-cons"></i></a>
                    </li>

                    <li class="nav-item">
                        <a href="aboutUs.html" class="nav-link nav-link1 active">About Us<i class="fa-solid fa-circle-info fa-xl right-cons"></i></a>
                    </li>
                    
                    <li class="nav-item">
	                    <a href="Posts" class="right-links nav-link nav-link1 active">My Posts<i class="fa-solid fa-newspaper fa-xl right-cons"></i></a>
					
			        </li>
			        
		           <li class="nav-item">
           			<a href="Profile" class="right-links nav-link nav-link1 active">Profile<i class="fa-solid fa-user fa-xl right-cons"></i></a>  
           		   </li>
                </ul>
            </div>
        </nav>

    </div>
</body>
</html>