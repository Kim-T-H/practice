<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<table style="width: 100%; margin:auto;">
		<caption>ȸ�� ���� ����</caption>
		<tr>
			<th>���̵�</th>
			<td>${mem.id}</td>
		</tr>
		<tr>
			<th>�̸�</th>
			<td>${mem.name}</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${mem.gender == 1?"��":"��"}</td>
		</tr>
		<tr>
			<th>�������</th>
			<td>${mem.jumin}</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${mem.area == 1?"����": mem.area == 2 ? "��õ" : mem.area== 3 ? "��Ⳳ��" : "���Ϻ�"}</td>
		</tr>
		<tr>
			<th>�ڵ��� ��ȣ</th>
			<td>${mem.phone}</td>
		</tr>
		
		<tr>
			<td colspan="2">
			<input type="button" value="����" class="btn btn-info" onclick="location.href='updateForm.me?id=${mem.id}'">
			<input type="button" value="��й�ȣ ����" class="btn btn-info" onclick="location.href='passwordForm.me?id=${mem.id}' ">
<%-- 	<c:if test="${param.id != 'admin' && sessionScope.login != 'admin'}">
					<input type="button" value="Ż��" onclick="location.href='deleteForm.me?id=${mem.id}'">
			</c:if>
			--%>
			</td>
		</tr>
	</table>
</body>
</html>
</body>
</html>