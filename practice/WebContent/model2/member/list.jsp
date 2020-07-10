<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- /WebContent/model2/member/list.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원목록보기</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
 function allchkbox(allchk){
	 $("input[name=mailchk]").prop("checked",allchk.checked)
 }
</script>
</head>
<body>
<form action="mailform.me" method="post">
	<table style="width: 90%; margin:auto;">
		<caption>회원 목록</caption>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>지역</th>
			<th>주민번호 앞자리</th>
			<th>핸드폰 번호</th>
			<th>회원 관리 </th>
		</tr>
		<c:forEach var="m" items="${list}">
			<tr>
				<td><a href="info.me?id=${m.id}">${m.id}</a></td>
				<td>${m.name}</td>
				<td>${m.gender==1?"남":"여"}</td>
				<td>${m.area}</td>
				<td>${m.jumin}</td>
				<td>${m.phone}</td>
				
				<td><a href="/practice/model2/Mypage/updateForm.me?id=${m.id}">[수정]</a>
			<%-- <c:if test="${m.id != 'admin'}">
				  <a href="/practice/model2/Mypage/delete.me?id=${m.id}">[강제탈퇴]</a>
			</c:if>--%>
				</td>
			</tr>
		</c:forEach>
		
	</table>
	</form>
</body>
</html>