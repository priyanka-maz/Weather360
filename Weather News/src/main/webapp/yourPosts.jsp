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
    <title>Posts</title>
    <link rel="icon" href="Pics/icon.png">
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>  
    <div class="font">
		<div class="container-fluid">
			<div id="header"></div>
			   <div class="header-adjustment"></div>
				<div class="my-posts">
				   <div class="row" style="margin-top:17px; margin-bottom:21px;">
				   	   <div class="col-lg-4">
					   </div>
				   	   <div class="col-lg-4">
						   <h1><%= request.getAttribute("first_name")%>'s Posts</h1>
					   </div>
					   <div class="col-lg-4">
						   <button id="new-article-btn" onclick="location.href='Upload'">
						   		<i class="fa-regular fa-plus"></i> New Post / Article
						   </button>
					   </div>
			   	   </div>
				   		<%= request.getAttribute("row") %>
				</div>
				<div id="footer"></div>	
		</div>
	</div>
	<script>
	function sendPostRequest(aid, colElement){
		var http = new XMLHttpRequest();
        http.open("POST", "Posts", true);
        http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        var params = "aid=" + aid + "&job=delete";
        http.send(params);
        
        http.onreadystatechange = function() {
            if (http.readyState === XMLHttpRequest.DONE) 
            {
                var message = document.getElementById("deleted" + aid);
                
                message.hidden = false;
               	res = Number(http.status);

				if (res == 200) 
				{
	                colElement.innerHTML = "<div class=\"d-flex justify-content-center align-items-center\" style=\"height: 100%;\"><i class=\"fa-solid fa-trash fa-2xl\"></i></div>";
	                console.log(res);
	                setTimeout(function() {
	                    window.location.reload();
	                }, 2400);

				}
				else
				{
					message.style.color = "red";
					message.innerHTML = "Sorry, article cannot be deleted";
					console.log(res);
				}
				
	            setTimeout(function() {
	                message.hidden = true;
	            }, 2000);            
                
            }
        }
	}
	</script>
</body>
</html>