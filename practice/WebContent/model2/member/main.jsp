<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="EUC-KR">
<title>로그인 되었을 때</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
$(function(){
	   $.ajax("/practice/model2/board/listside.do?btype=0",{
		   success : function(data){
			   console.log(data);
			   $("#listside1").html(data);
		   }
	   })
	setTimeout(function() {
		   $.ajax("/practice/model2/board/listside.do?btype=1",{
			   success : function(data){
				   console.log(data);
				   $("#listside2").html(data);
			   }
		   })
	}, 5);
})
</script>
</head>
<body>
	<table style="width: 80%; margin:auto;">
		<tr>
			<td>${sessionScope.login}님 로그인 되었습니다.</td>
		</tr>
		<tr>
			<td><input type="button" value="로그아웃" class="btn btn-info"
				onclick="location.href='logout.me'">
			<c:if test="${sessionScope.login == 'admin'}">
					<input type="button" value="회원 목록 보기" onclick="location.href='list.me'" class="btn btn-info">
			</c:if>
			</td>
		</tr>
	</table>
	<br>
	<br>
	<br>

	<div
		style="width: 45%; height: 700px; float: left; border: 1px solid white">
		<div id="listside1"></div>
	</div>
	<div
		style="width: 45%; height: 700px; float: right; border: 1px solid white">
		<div id="listside2"></div>
	</div>
</body>
</html>