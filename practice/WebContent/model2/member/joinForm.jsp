<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 가입</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function win_upload() {
		var op = "width=500,height=150,left=50, top=150";
		open("pictureForm.me", "", op);
	}
	function inputcheck(f) {
		   if(f.id.value == '') {
			   alert("아이디를 입력하세요.");
			   f.id.focus();
			   return false;
		   }
		   if(f.id.value.length < 4) {
			   alert("아이디는 4자리 이상 입력하세요.");
			   f.id.focus();
			   return false;
		   }
		   if(f.pass.value < 4) {
			   alert("비밀번호는 4자리 이상 입력하세요.");
			   f.pass.focus();
			   return false;
		   }
		   if(f.jumin.value == 6) {
			   alert("주민번호 앞자리는 6자리 입력하세요.");
			   f.jumin.focus();
			   return false;
		   }
		   if(f.phone.value == 11) {
			   alert("핸드폰 번호는 11자리 입력하세요.");
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
				<th>아이디</th>
				<td><input type="text" name="id" ></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass" ></td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" name="jumin"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" value="1">남
					<input type="radio" name="gender" value="2">여</td>
			</tr>
			<tr>
				<th>지역</th>
				<td><input type="radio" name="area" value="1">서울
					<input type="radio" name="area" value="2">인천
					<input type="radio" name="area" value="3">경기 남부
					<input type="radio" name="area" value="4">경기 북부
					</td>
				
			<tr>
				<th>핸드폰 번호</th>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="회원가입" class="btn btn-info"></td>
			</tr>
		</table>
	</form>
	
</body>
</html>