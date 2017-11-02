<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>Join Us</title>
</head>
<script>
	function check() {
		var temp = window.open(
				"${pageContext.request.contextPath}/customer/check",
				"check ID", "top=200, left=400, width=400,height=250");
	}
	function checkForm() {
		var cus_id = document.getElementById("cus_id");
		var cus_pw = document.getElementById("cus_pw");
		var cus_pwC = document.getElementById("cus_pwC");
		if (cus_id.value == '') {
			alert('Enter and check your ID');
			return false;
		}
		if (cus_pw.value != cus_pwC.value) {
			alert('Check your password and confirm password');
			cus_pwC.select();
			return false;
		}
		return true;
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
							data-toggle="dropdown" href="#">${loginid} <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li class="nav-item" style="padding-right:.5rem; padding-left:.5rem;">
							Logged-in as <br>
							<strong class="css-truncate-target">${loginid }</strong>
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
						<h1>Join Us</h1>
						<span class="subheading"> Anybody can be a member of us </span>
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
					<form action="join" method="post" onsubmit="return checkForm();">
						<table width="700" cellpadding="10">
							<tr>
								<td>ID</td>
								<td><input type="text" class="form-control"
									placeholder="ID" id="cus_id" name="cus_id" readonly required>
									<input type="button" value="check ID" onclick="check();"
									class="btn btn-link"></td>
							</tr>
							<tr>
								<td>Password</td>
								<td><input type="password" class="form-control"
									placeholder="Password" id="cus_pw" name="cus_pw" required></td>
							</tr>
							<tr>
								<td>Confirm Password</td>
								<td><input type="password" class="form-control"
									placeholder="Confirm password" id="cus_pwC" name="cus_pwC"
									required></td>
							</tr>
							<tr>
								<td>Nickname</td>
								<td><input type="text" class="form-control"
									placeholder="Nickname" id="cus_nickname" name="cus_nickname"
									required></td>
							</tr>
							<tr>
								<td>Gender</td>
								<td><input type="radio" name="cus_gender" value="F" checked>Female
									&nbsp <input type="radio" name="cus_gender" value="M">Male
								</td>
							</tr>
							<tr>
								<td>Secret Question</td>
								<td><select id="cus_question" name="cus_question">
										<option value="1">Where is your favorite place?</option>
										<option value="2">What is your favorite animal?</option>
										<option value="3">What kind of food do you dislike?</option>
								</select></td>
							</tr>
							<tr>
								<td>Secret Answer</td>
								<td><input type="text" class="form-control"
									placeholder="Secret Answer" id="cus_answer" name="cus_answer"
									required></td>
							</tr>
							<tr>
								<td>Hobbies</td>
								<td><input type="checkbox" name="cus_hobbies" value="game"
									checked>Game &nbsp <input type="checkbox"
									name="cus_hobbies" value="reading">Reading &nbsp <input
									type="checkbox" name="cus_hobbies" value="coding">Computer
									Coding &nbsp <input type="checkbox" name="cus_hobbies"
									value="TV">Watching TV</td>
							</tr>
						</table>
						<br> <input type="submit" value="Join Us"
							class="btn btn-default">
					</form>
				</div>
			</div>
			<br>
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