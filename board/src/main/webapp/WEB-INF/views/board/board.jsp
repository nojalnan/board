<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<title>board test</title>
</head>

<script type="text/javascript">
$(function(){

    $("#startDate").datepicker({
			  showOn: "both",
			  dateFormat: "yy-mm-dd",
		      buttonImage: "/resources/images/calendar.gif",
		      buttonImageOnly: true,
		      buttonText: "Select date"
		  });
	
    $("#endDate").datepicker({
		  showOn: "both",
		  dateFormat: "yy-mm-dd",
	      buttonImage: "/resources/images/calendar.gif",
	      buttonImageOnly: true,
	      buttonText: "Select date"
	  });
});
</script>

<body>
	<div class="container">
   	<form class="form" id="searchVO" name="searchVO">
		<table id="table" data-height="460"
			class="table table-bordered table-hover">
			<tbody>
				<tr>
					<th><label for="title">도서명</label></th>
					<td>
						<input type="text" id="biTitle" name="biTitle" value="${searchVO.biTitle}" class="w200" maxlength="20"/>
					</td>
					<th><label for="publisher">출판사</label></th>
					<td>
						<input type="text" id="publisher" name="biPublisher" value="${searchVO.biPublisher}" class="w200" maxlength="20"/>
					</td>
				</tr>
				<tr>
					<th><label for="writer">저자</label></th>
					<td>
						<input type="text" id="creUsr" name="creUsr" value="${searchVO.creUsr}" class="w200" maxlength="20"/>
					</td>
					<th><label for="creDat">조회기간</label></th>
					<td>
						<input type="text" id="startDate" name="startDate" value="${searchVO.startDate}" class="w200" maxlength="10"/>
 						 ~ <input type="text" id="endDate" name="endDate" value="${searchVO.endDate}" class="w200" maxlength="10"/>
					</td>
				</tr>
				<tr>
					<th><label for="keyword">키워드</label></th>
					<td>
						<input type="text" id="keyword" name="keyword" value="${searchVO.keyword}" class="w200" maxlength="20"/>
					</td>
					<th><label for="isbn">ISBN</label></th>
					<td>
						<input type="text" id="isbn" name="isbn" value="${searchVO.isbn}" class="w200" maxlength="20"/>
					</td>
				</tr>
				<tr>
					<td colspan="6" align="right"><button type="submit"
						class="btn btn-primary" id="searchBtn">검색</button></td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>

	<div class="container">
		<c:out value="${total}" />
		<table id="table" data-height="460"
			class="table table-bordered table-hover">
			<thead>
				<tr>
					<th class="text-center">순번</th>
					<th class="text-center">도서명</th>
					<th class="text-center">출판사</th>
					<th class="text-center">저자</th>
					<th class="text-center">키워드</th>
					<th class="text-center">ISBN</th>
					<th class="text-center">입고일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${boardList}" varStatus="status">
					<tr align="center">
						<td>${board.biNum}</td>
						<%-- <td><a data-binum="${board.biNum}"}>${board.biTitle}</a></td> --%>
						<td>${board.biTitle}</a></td>
						<td>${board.biPublisher}</td>
						<td>${board.creUsr}</td>
						<td>${board.keyword}</td>
						<td>${board.isbn}</td>
						<td>${board.creDat}</td>
					</tr>
				</c:forEach>
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
$("td>a").click(function(){
	location.href="/board/"+this.dataset.binum +"," + ${page.nowPage};
})
$("li[class!='active'][class!='disabled']>a").click(function(){
	var url = "/board/?nowPage=";
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