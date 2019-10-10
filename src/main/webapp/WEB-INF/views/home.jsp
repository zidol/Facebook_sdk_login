<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!doctype html>
<html>

<head>
<title>WEB1 - Welcome</title>
<meta charset="utf-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="colors.js"></script> -->
</head>
<body>
	<input type="button" id="authBtn" value="checking..."
		onclick="
  	if(this.value === 'Login') {
      //now logout
      FB.login(function(res) {
        console.log('login =>', res);
        checkLoginStatus(res);
      });
    } else{
      //now login
      FB.logout(function(res) {
          console.log('logout =>', res);
          checkLoginStatus(res);
      });
    }
  ">
	<span id="name"></span>
	<input type="button" value="button" onclick="info()">
	<h1>
		<a href="index.html">WEB</a>
	</h1>
	<input id="night_day" type="button" value="night"
		onclick="
    nightDayHandler(this);
  ">
	<ol>
		<li><a href="1.html">HTML</a></li>
		<li><a href="2.html">CSS</a></li>
		<li><a href="3.html">JavaScript</a></li>
	</ol>
	<h2>WEB</h2>
	<p>The World Wide Web (abbreviated WWW or the Web) is an
		information space where documents and other web resources are
		identified by Uniform Resource Locators (URLs), interlinked by
		hypertext links, and can be accessed via the Internet.[1] English
		scientist Tim Berners-Lee invented the World Wide Web in 1989. He
		wrote the first web browser computer program in 1990 while employed at
		CERN in Switzerland.[2][3] The Web browser was released outside of
		CERN in 1991, first to other research institutions starting in January
		1991 and to the general public on the Internet in August 1991.</p>


	<script type="text/javascript">
		var checkLoginStatus = function(response) { // Called after the JS SDK has been initialized.
			// statusChangeCallback(response);        // Returns the login status.
			console.log(response);
			if (response.status === 'connected') {
			      document.querySelector('#authBtn').value = 'Logout';
			      FB.api('/me', function(resp){
			          document.querySelector('#name').innerHTML = 'Welcom ' + resp.name;
			      });
			      FB.api(
						    "/me/feed",
						    function (response) {
						      if (response && !response.error) {
						        /* handle the result */
						        console.log("Feed : ", response);
						      }
						    }
						);
			      FB.api(
			    		    "/me?fields=birthday,picture",
			    		    function (response) {
			    		      if (response && !response.error) {
			    		        /* handle the result */
			    		        console.log("Profile : ", response);
			    		      }
			    		    }
			    		);
			} else {
				document.querySelector('#authBtn').value = 'Login';
				document.querySelector('#name').innerHTML = '';
			}
		}
		
		var info = function(info) {
	        alert('Width: ' + info.clientWidth + ' Height: ' + info.clientHeight);
	    }
		window.fbAsyncInit = function() {
			FB.init({
				appId : '339369890070694',
				cookie : true, // Enable cookies to allow the server to access the session.
				xfbml : true, // Parse social plugins on this webpage.
				version : 'v4.0' // Use this Graph API version for this call.
			});
	
			FB.getLoginStatus(checkLoginStatus);
			
			
		};
		// Load the SDK asynchronously
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "https://connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
</script>
</body>

</html>
