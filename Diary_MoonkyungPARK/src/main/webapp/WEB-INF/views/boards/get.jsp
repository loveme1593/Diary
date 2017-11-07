<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<title>Read a post</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- Custom fonts for this template -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/clean-blog.min.css"
	rel="stylesheet">
</head>
<script>
$(function(){
	$('#delete').on('click', deleteBoard);
	$('#insertReply').on('click', insertReply);
});
function updateChangeReply(reply_num,reply_content){
	$('#replyUpdate_content'+reply_num).replaceWith('<input type="text" style="width:80%" class="form-control" id="reply_text" value='+reply_content+'>');
	$('#updateReply'+reply_num).replaceWith('<input type="button" id="reply_reply" value="reply update" class="btn btn-info">');
	$('#reply_reply').on('click',function(){
		$.ajax({
			url:"updateReply",
			method:"post",
			data:{
				"reply_num":reply_num,
				"reply_content":$("#reply_text").val(),
				"board_num":${board.board_num}
			},
			success:function(board_num){
				alert('Your reply is updated successfully');
				location.href = "${pageContext.request.contextPath}/boards/get?board_num="+board_num;
			}
		});
		
	});
}
function deleteBoard(){
	if(confirm('Do you want to delete your post?')){
			$.ajax({
				method : "post",
				url : "delete",
				data : {
					"board_num" : ${board.board_num}
				},
				success : function(result) {
					if(result==1){
					alert('Your post is deleted successfully');
					location.href = "${pageContext.request.contextPath}/boards";
					}
				}
			});}
}
function updateBoard(board_num){
	location.href = "${pageContext.request.contextPath}/boards/update?board_num="+board_num+"&page=${page}&friend_id=${friend_id}";
}
function insertReply(){
	$.ajax({
		method:"post",
		url:"insertReply",
		data:{
			"board_num":${board.board_num},
			"reply_content":$("#reply_content").val()
		},
		success:function(board_num){
				alert('Your reply is posted');
				location.href = "${pageContext.request.contextPath}/boards/get?board_num="+board_num;
		}
	});
}
function deleteReply(reply_num){
	if(confirm('Do you want to delete your reply')){
		$.ajax({
			method:"post",
			url:"deleteReply",
			data:{
				"reply_num":reply_num,
				"board_num":${board.board_num}
			},
			success:function(board_num){
				alert('Your reply is deleted successfully');
				location.href = "${pageContext.request.contextPath}/boards/get?board_num="+board_num;
			}
		});
	}
}
function insertR_reply(reply_num){
	$("#"+reply_num).replaceWith('<input type="text"id="r_reply_content" class="form-control" style="width:80%"> <input type="button"id="r_reply_btn" value="write reply" class="btn btn-info">');
	$('#r_reply_btn').on('click',function(){
		$.ajax({
			method:"post",
			url:"insertReply",
			data:{
				"reply_num":reply_num,
				"reply_content":$("#r_reply_content").val(),
				"board_num":${board.board_num}
			},
			success:function(board_num){
				alert('Your reply is posted');
				location.href = "${pageContext.request.contextPath}/boards/get?board_num="+board_num;
		}
		});
	});
}
</script>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">My
				Diary</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fa fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/">Home</a></li>
					<c:if test="${empty loginid }">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/customer/login">Login</a>
						</li>
					</c:if>
					<c:if test="${!empty loginid }">
						<!-- <li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/customer/logout">Logout</a>
						</li> -->
						<li class="nav-item dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">${loginid} <span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class="nav-item"
									style="padding-right: .5rem; padding-left: .5rem;">
									Logged-in as <br> <strong class="css-truncate-target">${loginid }</strong>
								</li>
								<li class="dropdown-divider"></li>
								<li class="nav-item"><a class="nav-link"
									href="${pageContext.request.contextPath}/customer/logout">Logout</a>
								</li>
							</ul></li>
						<li class="nav-item dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">Friends<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a class="nav-link"
									href="${pageContext.request.contextPath}/friend/home">Find
										Friends</a></li>
								<li><a class="nav-link"
									href="${pageContext.request.contextPath}/friend/management">Friends
										Management<span class="w3-badge">${numofFriendRequest }</span>
								</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">Messages<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a class="nav-link"
									href="${pageContext.request.contextPath}/message/management?category=read">Read
										Messages<span class="w3-badge">${numofReadMessage }</span>
								</a></li>
								<li><a class="nav-link"
									href="${pageContext.request.contextPath}/message/management?category=sent">Sent
										Messages<span class="w3-badge">${numofSentMessage }</span>
								</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/boards">My Diary</a></li>
					</c:if>

				</ul>
			</div>
		</div>
	</nav>
	<!-- Page Header -->
	<header class="masthead"
		style="background-image: url('${pageContext.request.contextPath}/resources/img/home-bg.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="site-heading">
						<h1>Write Diary</h1>
						<span class="subheading"> Write and share your daily life
							with your friends! </span>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Main Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-md-10 mx-auto">
				<div class="post-preview">
					<h2>Read diary</h2>
					<table cellpadding="10">
						<tr>
							<td>Title</td>
							<td>${board.board_title }</td>
						</tr>
						<tr>
							<td>Writer</td>
							<td>${board.board_nickname }</td>
						</tr>
						<tr>
							<td>Date</td>
							<td>${board.board_date }</td>
						</tr>
						<tr>
							<td>Hits</td>
							<td>${board.board_hits }</td>
						</tr>
						<tr>
							<td>Content</td>
							<td>${board.board_content }</td>
						</tr>
						<tr>
							<td><c:if test="${loginid==board.board_id }">
									<input type="button" value="Update" id="update" name="update"
										onclick="updateBoard('${board.board_num}')"
										class="btn btn-default">
									<input type="button" value="Delete" id="delete" name="delete"
										class="btn btn-default">
								</c:if> <input type="button" value="to List"
								onclick="location.href='${pageContext.request.contextPath}/boards?page=${page}&friend_id=${friend_id }'"
								class="btn btn-default"></td>
					</table>
					<hr>
					<!-- 리플 -->
					<c:if test="${status=='friend'||status=='myself' }">
						<input type="text" id="reply_content" name="reply_content" class="form-control" style="width:80%">
						<input type="button" id="insertReply" name="insertReply"
							value="write Reply" class="btn btn-info">
					</c:if>
					<br>
					<c:forEach var="reply" items="${reply }">
						<table cellpadding="10">
							<tr>
								<c:if test="${!empty reply.rreply_id }">
									<td>@${reply.reply_nickname }</td>
									<td>${reply.rreply_nickname }</td>
								</c:if>
								<c:if test="${empty reply.rreply_id }">
									<td>${reply.reply_nickname }</td>
								</c:if>
								<td><div id="replyUpdate_content${reply.reply_num }">${reply.reply_content }</div></td>
								<td>${reply.reply_date }</td>
								<!--대댓글 버튼:자기 자신이 아닐 때만 나타나도록-->
								<c:if
									test="${loginid!=reply.reply_id&&loginid!=reply.rreply_id }">
									d
									<td><input type="button" id="insertR_reply"
										name="insertR_reply" value="write Reply"
										onclick="insertR_reply('${reply.reply_num}')"
										class="btn btn-info"></td>
								</c:if>
								<td>
									<div id="${reply.reply_num }"></div>
								</td>
								<c:if
									test="${loginid==reply.reply_id&&empty reply.rreply_id||loginid==reply.rreply_id }">
									<td><input type="button"
										id="updateReply${reply.reply_num }" name="updateReply"
										value="update Reply" class="btn btn-info"
										onClick="updateChangeReply('${reply.reply_num}','${reply.reply_content} ')"></td>
									<td><input type="button" id="deleteReply"
										name="deleteReply" value="delete Reply"
										onClick="deleteReply('${reply.reply_num}')"
										class="btn btn-info"></td>
								</c:if>
							</tr>
						</table>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<p class="copyright text-muted">Copyright &copy; Park,
						MoonKyung 2017</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/popper/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Custom scripts for this template -->
	<script
		src="${pageContext.request.contextPath}/resources/js/clean-blog.min.js"></script>

</body>
</html>