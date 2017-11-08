<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<title>Find Friends</title>
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
	function sendMessage(cus_id) {
		var temp = window.open(
				"${pageContext.request.contextPath}/message/send?cus_id="
						+ cus_id, "sendMessage",
				"top=500, left=600, width=500,height=500");
	}
</script>
<body>
	<c:if test="${!empty requestResult }">
		<script>
			alert('${requestResult}');
		</script>
	</c:if>
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
						<h1>Find Friends</h1>
						<span class="subheading"> Find and Add Friends</span>
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
					<h2>Find Friends</h2>
					<div>
						<form action="findFriends" method="post">
							<select id="searchType" name="searchType">
								<option value=""></option>
								<option value="cus_id">ID</option>
								<option value="cus_nickname">Nickname</option>
								<option value="cus_hobbies">Hobbies</option>
							</select> <input type="text" id="searchContent" name="searchContent"
								style="width: 40%"> <input type="submit" value="Search"
								class="btn btn-default">
						</form>
					</div>
					<table width="700" cellpadding="10">
						<tr>
							<td>ID</td>
							<td>Gender</td>
							<td>Nickname</td>
							<td>Hobbies</td>
							<td>Friend Request</td>
							<td>Message</td>
						</tr>
						<c:forEach var="items" items="${friends }">
							<tr>
								<c:if test="${items.cus_id!=loginid }">
									<td><a
										href="${pageContext.request.contextPath}/boards?friend_id=${items.cus_id}">${items.cus_id }</a></td>
									<td>${items.cus_gender }</td>
									<td>${items.cus_nickname }</td>
									<td>${items.cus_hobbies }</td>
									<td>
										<form action="friendRequest" , method="post">
											<input type="hidden" id="searchType" name="searchType"
												value="${searchType }"> <input type="hidden"
												id="searchContent" name="searchContent"
												value="${searchContent }"> <input type="hidden"
												id="friend_id" name="friend_id" value="${items.cus_id }">
											<input type="submit" value="Request" class="btn btn-default">
										</form>
									</td>
									<td><form>
											<input type="button" value="Message" class="btn btn-default"
												onclick="sendMessage('${items.cus_id }');">
										</form></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
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