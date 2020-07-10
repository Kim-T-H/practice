<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 수정</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
   function  inputcheck(f) {
<c:if test="${sessionScope.login != 'admin'}">	   
     if(f.pass.value == "") {
	   alert("비밀번호를 입력하세요");
	   f.pass.focus();
	   return false;
     }
</c:if>	   
 }


</script>
</head>
<body>
	<form action="update.me" name="f" method="post"
		onsubmit="return inputcheck(this)">
		<table style="width: 100%; margin:auto;">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" readonly value="${mem.id}"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" value="${mem.name}"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			
			<tr>
				<td>성별</td>
				<td><input type="radio" name="gender" value="1"
					<c:if test="${mem.gender == 1}">checked</c:if>>남
					 <input type="radio" name="gender" value="2"
					<c:if test="${mem.gender == 2}">checked</c:if>>여</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" name="jumin" value="${mem.jumin}"></td>
			</tr>
			
			
			
			<tr>
				<th>지역</th>
				<td>
				<input type="radio" name="area" value="1"
					<c:if test="${mem.area == 1}">checked</c:if>>서울
				<input type="radio" name="area" value="2"
					<c:if test="${mem.area == 2}">checked</c:if>>인천
				<input type="radio" name="area" value="3"
					<c:if test="${mem.area == 3}">checked</c:if>>서울
				<input type="radio" name="area" value="4"
					<c:if test="${mem.area == 4}">checked</c:if>>인천
				</td>
			</tr>
			
			<tr>
				<th>핸드폰 번호</th>
				<td><input type="text" name="phone" value="${mem.phone}"></td>
			</tr>
			<tr>
			<td colspan="2"><input type="submit" value="수정 완료"></td>
			</tr>
		</table>
		</form>
</body>
</html>