<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- /WebContent/model2/member/list.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ����Ϻ���</title>
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
		<caption>ȸ�� ���</caption>
		<tr>
			<th>���̵�</th>
			<th>�̸�</th>
			<th>����</th>
			<th>����</th>
			<th>�ֹι�ȣ ���ڸ�</th>
			<th>�ڵ��� ��ȣ</th>
			<th>ȸ�� ���� </th>
		</tr>
		<c:forEach var="m" items="${list}">
			<tr>
				<td><a href="info.me?id=${m.id}">${m.id}</a></td>
				<td>${m.name}</td>
				<td>${m.gender==1?"��":"��"}</td>
				<td>${m.area}</td>
				<td>${m.jumin}</td>
				<td>${m.phone}</td>
				
				<td><a href="/practice/model2/Mypage/updateForm.me?id=${m.id}">[����]</a>
			<%-- <c:if test="${m.id != 'admin'}">
				  <a href="/practice/model2/Mypage/delete.me?id=${m.id}">[����Ż��]</a>
			</c:if>--%>
				</td>
			</tr>
		</c:forEach>
		
	</table>
	</form>
</body>
</html>