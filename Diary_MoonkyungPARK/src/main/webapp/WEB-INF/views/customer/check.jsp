<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<title>ID Check</title>
</head>
<script>
	$(function() {
		$('#checkidbutton').on('click', checkid);
	});
	function checkid() {
		$
				.ajax({
					url : "check",
					method : "post",
					data : {
						"checkid" : $("#checkid").val()
					},
					success : function(result) {
						if (result == "success") {
							$('#confirmID').empty();
							$('#confirmIDButton').empty();
							$('#confirmID').append("That ID is usable<br>");
							$('#confirmIDButton')
									.append(
											"<input type='button' value='Use this ID' onclick='isSelected();'>");
						} else if (result == 'fail') {
							$('#confirmID').empty();
							$('#confirmIDButton').empty();
							$('#confirmID').append("That ID is already in use");
						}
					}
				});
	}
	function isSelected() {
		//opener.document->나를 연것(joinForm.jsp)
		//id가 id인 것의 value를 id로 설정하고
		var cus_id = $('#checkid').val();
		opener.document.getElementById("cus_id").value = cus_id;
		this.close(); //창을 닫는다
	}
</script>
<body>
	<h3>Check your ID</h3>
	<input type="text" id="checkid" name="checkid"
		placeholder="Enter your ID" width="500">
	<input type="button" value="Check ID" id="checkidbutton">
	<br>
	<div id="confirmID"></div>
	<div id="confirmIDButton"></div>
</body>
</html>