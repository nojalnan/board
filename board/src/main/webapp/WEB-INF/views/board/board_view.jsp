<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<title>board test</title>
</head>
<body>
	<div class="container">
		<c:out value="${total}" />
		<table id="table" data-height="460"
			class="table table-bordered">
			<tbody>
					<tr align="center">
						<td>게시물 번호</td>
						<td>${board.biNum}</td>
					</tr>
					<tr align="center">
						<td>게시물 제목</td>
						<td>${board.biTitle}</td>
					</tr>
					<tr align="center">
						<td>게시물 내용</td>
						<td>${board.biContent}</td>
					</tr>
					<tr align="center">
						<td>게시물 비밀번호</td>
						<td>${board.biPwd}</td>
					</tr>
					<tr align="center">
						<td>게시물 생성자</td>
						<td>${board.creUsr}</td>
					</tr>
					<tr align="center">
						<td>게시물 생성일자</td>
						<td>${board.creDat}</td>
					</tr>
				<tr>
					<td colspan="5" align="right"><button class="btn btn-primary">돌아가기</button>
					<button class="btn btn-primary">수정하기</button>
					<button class="btn btn-primary">삭제하기</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
<script>
$("button").click(function(){
	var sign = this.innerHTML;
	var url = "/board";
	if(sign=="돌아가기"){
		url += "/?nowPage=${nowPage}";
	}else if(sign=="수정하기"){
		
	}else if(sign=="삭제하기"){
		url += "/del?nowpage=${nowPage}&binum=${board.biNum}";
	}
	location.href=url;
})
</script>
</html>