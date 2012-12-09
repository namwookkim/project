<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<title>Chatting Module</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<style type="text/css">
			input#msg {
				width: 100%;
			}
			input#enter_btn {
				width: 100%;
			}
		</style>
	</head>
	<body>
	
			<textarea name="chat_box" cols="80" rows="24"></textarea>
		<div class="row">
			<div class="span11">
				
			</div>
			<div class="span1">
				<input type="button" id="enter_btn" value="Enter" />
			</div>
		</div>		
	</body>
</html>