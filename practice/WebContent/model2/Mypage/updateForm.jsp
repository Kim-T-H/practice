<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
   function  inputcheck(f) {
<c:if test="${sessionScope.login != 'admin'}">	   
     if(f.pass.value == "") {
	   alert("��й�ȣ�� �Է��ϼ���");
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
				<th>���̵�</th>
				<td><input type="text" name="id" readonly value="${mem.id}"></td>
			</tr>
			<tr>
				<th>�̸�</th>
				<td><input type="text" name="name" value="${mem.name}"></td>
			</tr>
			<tr>
				<td>��й�ȣ</td>
				<td><input type="password" name="pass"></td>
			</tr>
			
			<tr>
				<td>����</td>
				<td><input type="radio" name="gender" value="1"
					<c:if test="${mem.gender == 1}">checked</c:if>>��
					 <input type="radio" name="gender" value="2"
					<c:if test="${mem.gender == 2}">checked</c:if>>��</td>
			</tr>
			<tr>
				<th>�������</th>
				<td><input type="text" name="jumin" value="${mem.jumin}"></td>
			</tr>
			
			
			
			<tr>
				<th>����</th>
				<td>
				<input type="radio" name="area" value="1"
					<c:if test="${mem.area == 1}">checked</c:if>>����
				<input type="radio" name="area" value="2"
					<c:if test="${mem.area == 2}">checked</c:if>>��õ
				<input type="radio" name="area" value="3"
					<c:if test="${mem.area == 3}">checked</c:if>>����
				<input type="radio" name="area" value="4"
					<c:if test="${mem.area == 4}">checked</c:if>>��õ
				</td>
			</tr>
			
			<tr>
				<th>�ڵ��� ��ȣ</th>
				<td><input type="text" name="phone" value="${mem.phone}"></td>
			</tr>
			<tr>
			<td colspan="2"><input type="submit" value="���� �Ϸ�"></td>
			</tr>
		</table>
		</form>
</body>
</html>