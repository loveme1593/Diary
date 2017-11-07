<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Messages</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- Bootstrap core CSS -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
						<h1>Message</h1>
						<c:if test="${category=='read' }">
							<span class="subheading"> Check your messages </span>
						</c:if>
						<c:if test="${category=='sent' }">
							<span class="subheading"> Check messages you sent </span>
						</c:if>
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
					<c:if test="${category=='read' }">
						<h2>${loginid }'sMessage</h2>
					</c:if>
					<c:if test="${category=='sent' }">
						<h2>Messages ${loginid } sent</h2>
					</c:if>

					<hr>
					<table class="table" cellpadding="10">
						<tr>
							<td>Title</td>
							<c:if test="${category=='read' }">
								<td>From</td>
							</c:if>
							<c:if test="${category=='sent' }">
								<td>To</td>
							</c:if>
							<td>Date</td>
							<c:if test="${category=='sent' }">
								<td>Read or not</td>
							</c:if>
						</tr>
						<c:forEach var="item" items="${message }">
							<c:if
								test="${category=='read'&&item.friend_status!='delete'||category=='sent'&&item.cus_status!='delete' }">
								<tr>
									<td><a
										href="${pageContext.request.contextPath}/message/get?message_num=${item.message_num}&category=${category}&page=${page}">${item.message_title }
											<c:if
												test="${item.friend_status=='receive'&&category=='read'||item.cus_status=='sent'&&category=='sent'}">
												<span class="w3-badge w3-red">New</span>
											</c:if>
									</a></td>
									<c:if test="${category=='read' }">
										<td>${item.cus_id }</td>
									</c:if>
									<c:if test="${category=='sent' }">
										<td>${item.friend_id }</td>
									</c:if>
									<td>${item.message_date }</td>
									<c:if test="${category=='sent' }">
										<c:if
											test="${item.friend_status=='read'||item.friend_status=='delete' }">
											<td>Read</td>
										</c:if>
										<c:if test="${item.friend_status=='receive' }">
											<td>Not yet</td>
										</c:if>
									</c:if>
								</tr>
							</c:if>
						</c:forEach>
					</table>
					<hr>
					<br> <input type="button" value="home"
						onclick="location.href='${pageContext.request.contextPath}/'"
						class="btn btn-default">
					<hr>
					<div style="text-align: center;">
						<br> <a
							href="${pageContext.request.contextPath}/message/management?page=${page-1}&category=${category}">&laquo;</a>
						<c:forEach var="page" begin="${page }" end="${endPage }">
							<a
								href="${pageContext.request.contextPath}/message/management?page=${page}&category=${category}">${page}</a>
						</c:forEach>
						<a
							href="${pageContext.request.contextPath}/message/management?page=${page+1}&category=${category}">&raquo;</a>
					</div>
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