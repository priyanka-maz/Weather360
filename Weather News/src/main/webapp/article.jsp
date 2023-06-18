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
			
			//Insertion of line in body
			var contentElement = $(".content");
		    var contentText = contentElement.text();
		    var contentHtml = contentText.replace(/\n/g, "<br>");
		    contentElement.html(contentHtml);
		    
		    //Title Casing
		    var headingElement = $(".heading");
		    var headingText = headingElement.text();
		    var titleCaseText = convertToTitleCase(headingText);
		    headingElement.text(titleCaseText);
		});
		
		function convertToTitleCase(text) {
		    return text.replace(/\w\S*/g, function(word) {
		        return word.charAt(0).toUpperCase() + word.substr(1).toLowerCase();
		    });
		}
	</script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Article</title>
    <link rel="icon" href="Pics/icon.png">
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>  
    <div class="font">
		<div class="container-fluid">
			<div id="header"></div>
			   <div class="header-adjustment"></div>
			   <div class="row justify-content-center">
			   		<div class="col-sm-3 side-banner">
			   			<img src="Pics/Posts/inclusive.png" alt="Listen Now" class="poster-image" onclick="imageClicked()">
			   			<audio id="music" src=""></audio>
			   		</div>
				   <div class="col-sm-6">
					  <%= request.getAttribute("article") %>
				   </div>
				   <div class="col-sm-3">
				   </div>
			</div>
			<div id="footer"></div>	
		</div>
	</div>
	<script>
	function imageClicked() {
        
     	// Get all elements with class "article"
        var articles = document.getElementsByClassName("article");
        var textContent = "";

        // Loop through each article
        for (var i = 0; i < articles.length; i++) {
            var article = articles[i];

            // Get all child elements within the article
            var elements = article.getElementsByTagName("*");

            // Loop through each element and extract text content
            for (var j = 0; j < elements.length; j++) {
                var element = elements[j];
                textContent += element.textContent.trim() + " ";
            }
        }

        try {
            fetch("https://eastus.tts.speech.microsoft.com/cognitiveservices/v1", {
              method: "POST",
              headers: {
                "Ocp-Apim-Subscription-Key": "",
                "Content-Type": "application/ssml+xml",
                "X-Microsoft-OutputFormat": "audio-16khz-128kbitrate-mono-mp3",
              },
              body: `<speak version='1.0' xml:lang='en-US'>
                     <voice xml:lang='en-US' xml:gender='Female' name='en-US-JennyNeural'>
                         ${textContent}
                     </voice>
                 </speak>`,
            })
              .then((response) => response.arrayBuffer())
              .then((arrayBuffer) => {
                var blob = new Blob([arrayBuffer], { type: 'audio/mp3' });
                var url = URL.createObjectURL(blob);
                var audio = new Audio();
                audio.src = url;
                audio.play();
              })
              .catch((error) => {
                console.error("Error:", error);
                alert("Oops! An error occurred.");
              });
          } catch (error) {
            console.error("Error:", error);
            alert("Oops! An error occurred.");
          }
	}
	</script>
</body>
</html>