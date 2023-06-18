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
	<script>
		$(function () {
			$("#header").load("header.jsp");
			$("#footer").load("footer.html");
		});
		
	</script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Successful Register</title>
    <link rel="icon" href="Pics/icon.png">
    <script src="https://kit.fontawesome.com/13deb536c6.js" crossorigin="anonymous"></script>
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>  
    <div class="font">
		<div class="container-fluid">
			<div id="header"></div>
			   <div class="header-adjustment"></div>

               <br>
                <div class="signed-in-bg">
                	<div class="success-message">
				    <div class="success-icon">
				    <i class="fas fa-check-circle"></i>
				    </div>
				    <h2 class="reg-head">Registration Successful!</h2>
				    <p>Thank you for signing up !<br>You are now a member of our weather news portal.</p>
				    <a href="Login">
                        <button type="submit" class="btn log-btn form-submit">Go to Login page</button>
                    </a>
				</div>
                </div>
        </div>
     </div>
    <div id="footer"></div>
</body>
</html>      