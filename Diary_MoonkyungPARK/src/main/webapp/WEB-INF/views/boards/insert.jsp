<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<title>글쓰기</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
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
	/*$(function() {
	 $('#insert').on('click', insertBoard);
	 });
	 function insertBoard() {
	 $
	 .ajax({
	 method : "post",
	 url : "insert",
	 data : {
	 "board_title" : $("#board_title").val(),
	 "board_content" : $("#board_content").val(),
	 "board_see" : $(
	 "input[type=radio][name=board_see]:checked")
	 .val()
	 },
	 success : function(result) {
	 if (result == 1) {
	 alert('You posted successfully');
	 location.href = "${pageContext.request.contextPath}/boards";
	 }
	 }
	 });
	 }
	 */
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
					<h2>Write diary</h2>
					<hr>
					<form action="insert" method="post" enctype="multipart/form-data">
						<table class="table" cellpadding="10">
							<tr>
								<td>Title</td>
								<td><input type="text" id="board_title" name="board_title"
									class="form-control"></td>
							</tr>
							<tr>
								<td>Privacy bounds</td>
								<td><input type="radio" name="board_see" value="all"
									checked>all<br> <input type="radio"
									name="board_see" value="friend">to only friends<br>
									<input type="radio" name="board_see" value="secret">private<br></td>
							</tr>
							<tr>
								<td>Picture</td>
								<td><input type="file" name="upload"></td>
							</tr>
							<tr>
								<td>Content</td>
								<td><textArea id="board_content" name="board_content"
										class="form-control" rows="20"></textArea></td>
							</tr>
							<tr>
								<td><input type="submit" class="btn btn-default" value="Write"></td>
								<td><input type="button" value="back"
									onclick="location.href='${pageContext.request.contextPath}/'"
									class="btn btn-default"></td>
							</tr>
						</table>
					</form>
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