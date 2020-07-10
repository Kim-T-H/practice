<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- /WebContent/model2/board/writeForm.jsp --%>    
<!DOCTYPE html>
<html><head><meta charset="EUC-KR">
<title>게시판 글쓰기</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
   function inputcheck() {
	   f = document.f;
	  
	 
	   if(f.subject.value=="") {
		   alert("제목을 입력하세요");
		   f.subject.focus();
		   return;
	   }
	  /* if(f.content.value=="") {
		   alert("내용을 입력하세요");
		   f.content.focus();
		   return;
	  }
	  */ 
	   f.submit(); //form 객체에 submit 발생. 
   }
</script>
</head>
<body>
<form action="write.do?btype=${param.btype}" method="post" 
       enctype="multipart/form-data" name="f">
  <table>
   <caption>게시판 글쓰기</caption>
  		<c:choose>
				<c:when test="${param.btype==0 or param.btype==2}">
	<tr><td>제목</td><td><input type="text" name="subject"></td></tr>
				</c:when>
				<c:when test="${param.btype==1 }">
	<tr><td>제목</td><td><input type="text" name="subject" value="운동 시간:  			,장소:"></td></tr>
				</c:when>
			</c:choose>

   <tr><td>내용</td><td><textarea rows="15" name="content"  id="content1"></textarea></td></tr>
   <script>CKEDITOR.replace("content1", { filebrowserImageUploadUrl : "imgupload.do"})</script>
   <tr><td>첨부파일</td><td><input type="file" name="file1"></td></tr>
   <tr><td colspan="2">
     <a href="javascript:inputcheck()">[게시물등록]</a></td></tr>
  </table>
   <input type="hidden" name="id" id="id" value="${sessionScope.login}">
  </form></body></html>