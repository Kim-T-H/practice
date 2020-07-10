<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 
<%-- /WebContent/layout/memberlayout.jsp --%>    
<%@ taglib prefix="decorator" 
           uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}" />    
<!DOCTYPE html>
<html lang="en">
<title><decorator:title /></title>
<script type="text/javascript" 
   src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
</style>
<decorator:head />
<body>
<button type="button" class="btn btn-info">Info</button>
<!-- Sidebar/menu -->

<nav class="w3-sidebar w3-btn btn-info w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
 
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container">
  	<img src="/practice/img/racket.jpg" style="width:100%">
  </div>
  <div class="w3-container">
     <div class="w3-padding-120" style="width:150px;" >
     
     
     <!-- 로그인 창 -->
 	<c:if test="${empty sessionScope.login }">
      
       <input type="button" value="로그인"  onclick="location.href='${path}/model2/member/loginForm.me'" class="btn btn-success" style="color:black; font-size:20pt; ">
       <input type="button" value="회원 가입"  onclick="location.href='${path}/model2/member/joinForm.me'" class="btn btn-success" style="color:black; font-size:20pt; ">
       </a>
    </c:if>
    <c:if test="${!empty sessionScope.login }">
      ${sessionScope.login}님이 로그인 하셨습니다.&nbsp;&nbsp;<br>
       <input type="button" value="로그 아웃" onclick="location.href='${path}/model2/member/logout.me'" class="btn btn-success" style="color:black; font-size:20pt">
    </c:if>
    
    
    
    
    
    </div>
  </div>
  <div class="w3-bar-block">
  <c:if test="${empty sessionScope.login}">
    <a href="${path}/model2/member/loginForm.me" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white" style="font-size:35px">Home</a> 
  </c:if>
  <c:if test="${!empty sessionScope.login}">
    <a href="${path}/model2/member/main.me" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white" style="font-size:35px">Home</a> 
  </c:if>
    <a href="${path}/model2/Mypage/info.me?id=${sessionScope.login}" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white" style="font-size:35px">My page</a> 
    <a href="${path}/model2/board/list.do?btype=0" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white" style="font-size:35px">공지사항</a> 
    <a href="${path}/model2/board/list.do?btype=1" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white" style="font-size:35px">운동 일정/참여</a> 
    <a href="${path}/model2/board/list.do?btype=2" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white" style="font-size:35px">운동 팁 공유 </a> 
 
  </div>
</nav>

<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-hide-large w3-blue w3-xlarge w3-padding">
  <a href="javascript:void(0)" class="w3-button w3-green w3-margin-right" onclick="w3_open()">menu</a>
  <span>SMASH</span>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px">

  <!-- Header -->
  <div class="w3-container" style="margin-top:80px" id="showcase">
    <h1 class="w3-jumbo"><b>SMASH</b></h1>
    
    <hr style="width:100%;border:5px solid green" class="w3-round">
    <decorator:body />
  </div>
  
  

  <!-- Modal for full size images on click-->
  <div id="modal01" class="w3-modal w3-black" style="padding-top:0" onclick="this.style.display='none'">
    <span class="w3-button w3-black w3-xxlarge w3-display-topright">×</span>
    <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
      <img id="img01" class="w3-image">
      <p id="caption"></p>
    </div>
  </div>

  
  
 

  

<!-- End page content -->
</div>

<!-- W3.CSS Container -->

<script>
// Script to open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}

// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}
</script>

</body>
</html>
