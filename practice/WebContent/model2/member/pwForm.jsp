<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<h4>비밀번호찾기</h4>
<form action="pw.me" method="post">
  <table style="width: 100%; margin:auto;">
     <tr><th>이름</th><td><input type="text" name="name"></td></tr>
     <tr><th>아이디</th><td><input type="text" name="id"></td></tr>
     <tr><th>핸드폰번호</th><td><input type="text" name="phone"></td></tr>
     <tr><td colspan="2"><input type="submit" value="비밀번호 찾기" class="btn btn-info"></td></tr>
  </table>	
</form>
</body>
</html>