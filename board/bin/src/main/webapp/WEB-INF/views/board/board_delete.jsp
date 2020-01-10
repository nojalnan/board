<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script>
if(${delete}==1){
	alert("정상적으로 삭제 되었습니다.");
	location.href="/board/?nowPage=${nowpage}}";
}else{
	alert("해당게시물을 삭제 하지 못했습니다.");
}
</script>
</html>