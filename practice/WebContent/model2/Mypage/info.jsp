<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<table style="width: 100%; margin:auto;">
		<caption>회원 정보 보기</caption>
		<tr>
			<th>아이디</th>
			<td>${mem.id}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${mem.name}</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${mem.gender == 1?"남":"여"}</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${mem.jumin}</td>
		</tr>
		<tr>
			<th>지역</th>
			<td>${mem.area == 1?"서울": mem.area == 2 ? "인천" : mem.area== 3 ? "경기남부" : "경기북부"}</td>
		</tr>
		<tr>
			<th>핸드폰 번호</th>
			<td>${mem.phone}</td>
		</tr>
		
		<tr>
			<td colspan="2">
			<input type="button" value="수정" class="btn btn-info" onclick="location.href='updateForm.me?id=${mem.id}'">
			<input type="button" value="비밀번호 변경" class="btn btn-info" onclick="location.href='passwordForm.me?id=${mem.id}' ">
<%-- 	<c:if test="${param.id != 'admin' && sessionScope.login != 'admin'}">
					<input type="button" value="탈퇴" onclick="location.href='deleteForm.me?id=${mem.id}'">
			</c:if>
			--%>
			</td>
		</tr>
	</table>
</body>
</html>
</body>
</html>