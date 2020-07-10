<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- /WebContent/model1/board/list.jsp
   1. 한페이지당 10건의 게시물을 출력하기.
      pageNum 파라미터값을 저장 => 없는 경우는 1로 설정하기.
   2. 최근 등록된 게시물이 가장 위에 배치함.
   3. db에서 해당 페이지에 출력될 내용을 조회하여 화면에 출력.
           게시물을 출력부분
           페이지 구분 출력 부분        
--%>
<!DOCTYPE html>
<html><head><meta charset="EUC-KR">
<title>게시물 목록 보기</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function listdo(page){
		f=document.sf;
		f.pageNum.value=page;
		f.submit();
	}
</script>
</head>

<body>

<table style="width: 80%; margin:auto;">

<caption>
	<c:choose>
				<c:when test="${param.btype==0 }">
					공지 사항
				</c:when>
				<c:when test="${param.btype==1 }">
					운동 일정/참여 
				</c:when>
	</c:choose>

</caption>
 <c:if test="${boardcount==0}">
 <tr><td colspan="5">등록된 게시글이 없습니다.</td></tr>
 </c:if>
 <c:if test ="${boardcount>0}">
<tr><td colspan="5" style="text-align:right">글개수:${boardcount}</td></tr>
 <tr><th width="8%">번호</th><th width="50%">제목</th>
     <th width="14%">작성자</th><th width="17%">등록일</th>
     <th width="11%">조회수</th></tr>
     
<c:forEach var="b" items="${list}">
 <tr><td>${boardnum}</td><c:set var="boardnum" value="${boardnum-1}"/> 
 <td style="text-align: left">
  <c:if test="${!empty b.file1}">
	<a href="file/${b.file1}" style="text-decoration: none;">@</a>
  </c:if>
  <c:if test="${empty b.file1}"> &nbsp;&nbsp;&nbsp;</c:if>

	
   
    <a href="../board/info.do?no=${b.no}&btype=${b.btype}">${b.subject}</a>
 </td><td>${b.id}</td>
 
 <td><fmt:formatDate var="rdate" value="${b.date}" pattern="yyyy-MM-dd" />
 	<c:if test="${today==rdate}">
 		<fmt:formatDate value="${b.date}" pattern="HH:mm:ss" />
 	</c:if>
 	<c:if test="${today != rdate}">
 		<fmt:formatDate value="${b.date}" pattern="yyyy-MM-dd HH:mm" />
 	</c:if>
 
 </td>
       <td>${b.see}</td></tr>    
</c:forEach>
  
</c:if>
<%--등록된 게시물 존재 부분 종료 --%>
 
</table></body></html>