<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Error Page | Admin</title>
<link rel="stylesheet" type="text/css" href="../mystyle.css">
</head>
<body>
	<%@include file="../header.jsp" %>
	<%@include file="adminMenu.jsp" %>
	
	<h3 style="color:  red">Failed to add news. Please try again</h3>
	
	<h3>Add News</h3>
	<form action="newsProcess.jsp" method="post">
		<label>News Title</label><br>
		<input type="text" name="title" required><br><br>
		
		<label>Select News Category</label><br>
		<select name="category" required="required">
			<option>--Select Category--</option>
			<option value="entertainment">Entertainment</option>
			<option value="sports">Sports</option>
			<option value="politics">Politics</option>
			<option value="crime">Crime</option>
			<option value="business">Business</option>			
		</select><br><br>
		
		<label>News Detail:</label><br>
		<textarea rows="3" cols="20" name="detail" required="required"></textarea>
		<br><br>
		
		
		
		<input type="submit" value="Post News">
	</form>
</body>
</html>