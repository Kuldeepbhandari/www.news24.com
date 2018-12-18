<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>News Image Form | Admin</title>
<link rel="stylesheet" type="text/css" href="../mystyle.css">
</head>
<body>
	<%@include file="../header.jsp" %>
	<%@include file="adminMenu.jsp" %>
	<h3>News Posted successfully. Please add News Image</h3>
	
	<form action="uploadNewsImage.jsp" method="post" enctype="multipart/form-data">
		<label>Select Image:</label><br>
		<input type="file" name="file" required="required">
		<input type="submit" value="Upload">
	</form>
</body>
</html>