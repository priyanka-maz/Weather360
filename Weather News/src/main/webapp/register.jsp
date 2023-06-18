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
    <title>Sign Up</title>
    <link rel="icon" href="Pics/icon.png">
</head>

<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <div class="font">
    <div class="container-fluid">
    <div id="header"></div>
   	<div class="header-adjustment"></div>
   		<br>
        <div class = "box-form">
        	<div class="left-reg">
        		<div class="overlay">
        		<h1>Join Weather360 Today!</h1>
				<p>Stay informed with the latest weather updates!<br>Sign up now for our exclusive news portal.</p>
        		</div>
        	</div>
        	<div class="right"><br>
            <h2 style="font-size: 45px; text-align: center;">Register</h2>
            <br>
            <p>Already have an account? <a href="Login">Login</a> here!</p>
            <div class="server-side-check" <%= request.getAttribute("existing_email") %> >Email ID already exists!</div>
            
            <form action="Register" name="form1" class="needs-validation" onsubmit="return pwd_validation()" novalidate method="post">
                <div class="row g-2 input-row">
                    <div class="col-sm" style="padding-right: 20px;">
                        <div class="form-floating mb-3" >
                            <input name="first-name" type = "text" class = "form-control"  id = "first-name" placeholder="Mike" required>
                            <label for = "first-name" style="opacity:70%;">First name</label> 
                            <div class="invalid-feedback">
                                Enter first name
                            </div>
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                        </div>
                    </div>

                    <div class="col-sm">
                        <div class="form-floating mb-3" >
                            <input name="last-name" type = "text" class = "form-control"  id = "last-name" placeholder="Hunt" required>
                            <label for = "last-name" style="opacity:70%;">Last name</label>
                            <div class="invalid-feedback">
                                Enter last name
                            </div>
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row g-2 input-row">
                    <div class="col-sm"  style="padding-right: 20px;">
                        <div class="form-floating mb-3" >
                             <input name="email" type = "email" class = "form-control"  id = "email" placeholder="mikehunt@panda.com" required>
                             <label for = "email" style="opacity:70%;">Email ID</label> 

                             <div class="invalid-feedback">
                                Enter valid email ID
                            </div>
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row g-2 input-row">
                    <div class="col-sm"  style="padding-right: 20px;">
                        <div class="form-floating mb-3" >
                             <input name="location" type = "text" class = "form-control"  id = "location" placeholder="Kolkata" required>
                             <label for = "location" style="opacity:70%;">Primary Location</label> 

                             <div class="invalid-feedback">
                                Enter your primary location
                            </div>
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                        </div>
                    </div>
                </div>

                        <div class="row g-2 input-row" style="padding-top: 20px;">
                            <div class="col-sm" style="padding-right: 20px;">
                                <div class="form-floating mb-3">
                                    <input name="password" type = "password" class = "form-control"  id = "password1" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,12}$" placeholder="1234" required>
                                    <label for = "password" style="opacity:70%;">Password</label> 
                                    <div class="invalid-feedback">
                                    Enter valid password: Atleast one uppercase alphabet, one lowercase alphabet, one number and one special character<br>Minimum 8 characters & maximum 12 characters
	                                </div>
	                                <div class="valid-feedback">
	                                Looks good!
	                                </div>
                                </div>
                            </div>

                            <div class="col-sm">
                                <div class="form-floating mb-3" >
                                    <input type = "password" class = "form-control"  id = "password2" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,12}$" placeholder="1234" required>
                                    <label for = "confirm-password" style="opacity:70%;">Confirm Password</label> 
                                    <span class="invalid-feedback" id="pwd-match">
                                        
                                    </span>
                                </div>
                            </div>

                        </div>
                        
                        <div class="col-sm" style="padding: 20px 1px;">
                            <div class="form-floating mb-3 d-flex justify-content-center" >
                                <button type="submit" class="btn reg-btn form-submit">Sign up</button>
                            </div>
                        </div>
            </form>
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
<script>
    function pwd_validation(){
        var pw1 = document.getElementById("password1").value;
        var pw2 = document.getElementById("password2").value;

        if(pw1 != pw2){

            document.getElementById("pwd-match").innerHTML="Password didn't match";
            document.getElementById("password1").value="";
            document.getElementById("password2").value="";
            return false;
        }
        else{
            return true;
        }
    }
</script>
<div id="footer"></div>
</body>
</html>