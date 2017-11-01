<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Find your Password</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
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
	$(function() {
		$('#findPassword').on('click', findPassword);
	});
	function findPassword() {
		$
				.ajax({
					url : "findPassword",
					method : "post",
					data : {
						"cus_id" : $("#cus_id").val(),
						"cus_question" : $("#cus_question").val(),
						"cus_answer" : $("#cus_answer").val()
					},
					success : function(password) {
						if (password != 'false') {

							alert("Your password is " + password
									+ " please log in again");
							location.href = "${pageContext.request.contextPath}/customer/login";
						} else if (password == 'false') {
							alert("Please check your ID, Question and Answer");
						}
					}
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
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/customer/logout">Logout</a>
						</li>
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
						<h1>Find your password</h1>
						<span class="subheading"> Find your password </span>
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
					<table cellpadding="10">
						<tr>
							<td>ID</td>
							<td><input type="text" id="cus_id" name="cus_id" required></td>
						</tr>
						<tr>
							<td>Secret question</td>
							<td><select id="cus_question" name="cus_question">
									<option value="1">Where is your favorite place?</option>
									<option value="2">What is your favorite animal?</option>
									<option value="3">What kind of food do you dislike?</option>
							</select></td>
						</tr>
						<tr>
							<td>Secret answer</td>
							<td><input type="text" id="cus_answer" name="cus_answer"
								required></td>
						</tr>
					</table>
					<br> <input type="button" id="findPassword"
						value="find password" class="btn btn-default">
				</div>
			</div>
		</div>
	</div>
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