<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function win_upload() {
		var op = "width=500,height=150,left=50, top=150";
		open("pictureForm.me", "", op);
	}
	function inputcheck(f) {
		   if(f.id.value == '') {
			   alert("���̵� �Է��ϼ���.");
			   f.id.focus();
			   return false;
		   }
		   if(f.id.value.length < 4) {
			   alert("���̵�� 4�ڸ� �̻� �Է��ϼ���.");
			   f.id.focus();
			   return false;
		   }
		   if(f.pass.value < 4) {
			   alert("��й�ȣ�� 4�ڸ� �̻� �Է��ϼ���.");
			   f.pass.focus();
			   return false;
		   }
		   if(f.jumin.value == 6) {
			   alert("�ֹι�ȣ ���ڸ��� 6�ڸ� �Է��ϼ���.");
			   f.jumin.focus();
			   return false;
		   }
		   if(f.phone.value == 11) {
			   alert("�ڵ��� ��ȣ�� 11�ڸ� �Է��ϼ���.");
			   f.phone.focus();
			   return false;
		   }
		   return true;
	   }
</script>
</head>
<body>
	<form action="join.me" name="f" method="post" onsubmit="return inputcheck(this)">
		<table style="width: 80%; margin:auto;">
			<tr>
				<th>���̵�</th>
				<td><input type="text" name="id" ></td>
			</tr>
			<tr>
				<th>��й�ȣ</th>
				<td><input type="password" name="pass" ></td>
			</tr>
			
			<tr>
				<th>�̸�</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>�������</th>
				<td><input type="text" name="jumin"></td>
			</tr>
			<tr>
				<th>����</th>
				<td><input type="radio" name="gender" value="1">��
					<input type="radio" name="gender" value="2">��</td>
			</tr>
			<tr>
				<th>����</th>
				<td><input type="radio" name="area" value="1">����
					<input type="radio" name="area" value="2">��õ
					<input type="radio" name="area" value="3">��� ����
					<input type="radio" name="area" value="4">��� �Ϻ�
					</td>
				
			<tr>
				<th>�ڵ��� ��ȣ</th>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="ȸ������" class="btn btn-info"></td>
			</tr>
		</table>
	</form>
	
</body>
</html>