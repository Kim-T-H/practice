<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>id ã��</title>
<link rel="stylesheet" href="css/main.css">

</head>
<body>
<form name="f" onsubmit="transfer(this)">
	<table>
		<tr>
			<th>���̵�</th>
			<td>${i}${star}</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="Ȯ��"></td>
		</tr>

	</table>
	</form>
</body>
<script type="text/javascript">
	function transfer(f){
		opener.document.f.id.value="${i}";
		self.close();
	}
</script>
</html>

