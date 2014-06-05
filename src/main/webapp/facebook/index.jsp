<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags/facebook"%>
<html>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Sign in with Facebook example</title>
<link rel="stylesheet" href="../css/960.css" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script>
	$(document).ready(function() {
		$('#post').html("Cargando Historias");
		$('#post').load("/Social/facebook/timeline");
		$('#friendsList').load("/Social/facebook/friends");
		
		$('#postMessage').click(function(){
			if($('#message').val()==""){
				alert("escribi algo");
				return false;
		}
		});
	});
</script>
</head>
<body>
	<tag:notloggedin>
		<a href="signin">Sign in with Facebook</a>
	</tag:notloggedin>
	<tag:loggedin>
		<div class="container_12">
			<div id="status" class="grid_12">
				<form action="./post" method="post">
					<textarea cols="80" rows="2" id="message" name="message"
						title="Escribe un mensaje"></textarea>
					<input type="submit" id="postMessage" name="post" value="statuses" />
				</form>
			</div>
			<div class="clear"></div>
			<div id="post" class="grid_6"></div>
			<div id="friends" class="grid_6">
				<h1>Amigos</h1>
				<div id="friendsList"></div>
			</div>
		</div>
	</tag:loggedin>
</body>
</html>