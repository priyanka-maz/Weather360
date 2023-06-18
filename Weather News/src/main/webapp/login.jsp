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
    <title>Login</title>
    <link rel="icon" href="Pics/icon.png">

</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>  
    <div class="font">
		<div class="container-fluid">
			<div id="header"></div>
			   <div class="header-adjustment"></div>
			
               <div class="row d-flex align-items-center">
               <div class="col">
               <br>
                <div class="box-form">
					<div class="left">
						<div class="overlay">
						<h1>Welcome to Weather360</h1>
						<p>Read our constant updates on weather all around the world !<br>Keep up with all weather related news on our portal !</p>
						</div>
					</div>

					<div class="right">
					<br>
					<h2 style="opacity:90%; text-align:center;">Login</h2>
					<br>
					<p>Don't have an account? <a href="Register">Create Your Account</a>, it takes less than a minute !</p>
					<div class="server-side-check" style="text-align: left;" <%= request.getAttribute("wrong_password")%> >Incorrect Password!</div>
                        <div class="server-side-check" style="text-align: left;" <%= request.getAttribute("wrong_email")%> >Email ID not found!</div>
                        <br>
                        <form action="Login" name="form1" class="needs-validation" novalidate method="post">
                            <div class="form-floating mb-3" >
                                <input name="email" type = "email" class = "form-control"  id = "email" placeholder="mikehunt@panda.com" required>
                                <label for = "email" style="opacity:70%;">Email ID</label> 

                                <div class="invalid-feedback" style="text-align: left;">
                                Enter valid email ID
                            </div>
                            
                            </div>
                            <br>
                            <div class="form-floating mb-3">
                                <input name="password" type = "password" class = "form-control"  id = "password1" placeholder="1234" required>
                                <label for = "password" style="opacity:70%;">Password</label>
                                <div class="invalid-feedback" style="text-align: left;">
                                    Enter password
                                </div> 
                            </div>
                            <br>
                            <div class="row">
                                <div class="col d-flex justify-content-center">
                                    <button type="submit" class="btn form-submit" style="margin-bottom:30px;">Login</button>
                                </div>
                                
                                <div class="col d-flex justify-content-center">
                                    <a href="Register">
                                        <div type="sub" class="btn reg-btn form-submit">Sign up</div>
                                    </a>
                                </div>
                            </div>
                        </form>
					</div>
					</div>
                </div>
                </div>
            </div>
            </div>

        <script>
            // Example starter JavaScript for disabling form submissions if there are invalid fields
        (() => {
        'use strict'
        
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        const forms = document.querySelectorAll('.needs-validation')
        
        
        // Loop over them and prevent submission
        Array.from(forms).forEach(form => {
          form.addEventListener('submit', event => {
        
            if (!form.checkValidity()) {
              event.preventDefault()
              event.stopPropagation()
            }
            
        
            form.classList.add('was-validated')
        
          }, false)
        })
        
        })()
        </script>
    <div id="footer"></div>
	</body>
	</html>