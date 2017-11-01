<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<title>Send Message</title>
</head>
<script>
	$(function(){
		$('#send').on('click', message);
	});
	function message(){
		$.ajax({
			url:"send",
			method:"post",
			data:{
				"cus_id":${loginid},
				"friend_id":${cus_id},
				"message_title":$("#message_title").val(),
				"message":$("#message").val()
			},
			success:function(friend_id){
				alert("You sended a message to "+friend_id);
				closeWindow();	
			}
		});
	}
	function closeWindow(){
		this.close();
	}
</script>
<body>
	<table class="table table-hover">
		<tr>
			<td>To</td>
			<td>${cus_id }</td>
		</tr>
		<tr>
			<td>From</td>
			<td>${loginid }</td>
		</tr>
		<tr>
			<td>Title</td>
			<td><input type="text" id="message_title" required></td>
		</tr>
		<tr>
			<td>Content</td>
			<td><textArea id="message" name="message" required></textArea></td>
		</tr>
	</table>
	<input type="button" id="send" value="Send message"
		class="btn btn-default">
</body>
</html>