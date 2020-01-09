<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<title>board test</title>
</head>
<body>
	<div class="container">
		<form class="form-signin" action="/board">
			<button id="btn2" class="btn btn-lg btn-primary btn-block"
				type="button">Login</button>
		</form>
	</div>
</body>
<script>
$("#btn2").click(function(){
	location.href="/board/?nowPage=1"
});
</script>
</html>