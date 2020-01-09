<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<title>board test</title>
</head>
<body>
	<div class="container">
		<c:out value="${total}" />
		<table id="table" data-height="460"
			class="table table-bordered table-hover">
			<thead>
				<tr>
					<th class="text-center">번호</th>
					<th class="text-center">제목</th>
					<th class="text-center">비밀번호</th>
					<th class="text-center">작성자</th>
					<th class="text-center">작성일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${boardList}" varStatus="status">
					<tr align="center">
						<td>${board.biNum}</td>
						<td><a onclick="">${board.biTitle}</a></td>
						<td>${board.biPwd}</td>
						<td>${board.creUsr}</td>
						<td>${board.creDat}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" align="right"><button class="btn btn-primary">글쓰기</button></td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="jb-center" style="text-align: center">
		<ul class="pagination">
            <c:choose>
	            <c:when test="${page.nowPage eq 1}">
					<li class='disabled'><a>«</a></li>
					<li class='disabled'><a>‹</a></li>
	            </c:when>
	            <c:otherwise>
					<li><a>«</a></li>
					<li><a>‹</a></li>
	            </c:otherwise>
            </c:choose>
			
			<!--페이지번호 -->
			<c:forEach var='i' begin="${page.nowBlock}" end="${page.endBlock}" step="1">
                <c:choose>
                    <c:when test="${page.nowPage eq i}">
						<li class='active'><a>${i}</a></li>
                    </c:when>
                    <c:otherwise>
						<li><a>${i}</a></li>
                    </c:otherwise>
                </c:choose>
			</c:forEach>
						
            <c:choose>
	            <c:when test="${page.nowPage eq page.totalPage}">
					<li class='disabled'><a>›</a></li>
					<li class='disabled'><a>»</a></li>
	            </c:when>
	            <c:otherwise>
					<li><a>›</a></li>
					<li><a>»</a></li>
	            </c:otherwise>
            </c:choose>
		</ul>
	</div>
</body>
<script>
$("li[class!='active'][class!='disabled']>a").click(function(){
	var url = "/board/list?nowPage=";
	var pageNum = new Number(this.innerHTML);
	if(isNaN(pageNum)){
		var sign = this.innerHTML;
		if(sign=="‹"){
			url += (${page.nowPage}-1)
		}else if(sign=="«"){
			url += 1;
		}else if(sign=="»"){
			url += ${page.totalPage};
		}else if(sign=="›"){
			url += (${page.nowPage}+1)
		}
	}else{
		url += pageNum;
	}
	
	location.href=url;
})
</script>
</html>