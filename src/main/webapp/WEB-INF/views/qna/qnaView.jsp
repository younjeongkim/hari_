<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="ko" xmlns="http://www.w3.org/1999/html">
<head>
  <meta charset="UTF-8" >
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/boardView.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;800&display=swap" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
  <title>고객 문의</title>
</head>
<body>
<nav>
  <a href="/"> <div class="nav">HARI</div></a>
  <div class="navIcon">
    <img src="/img/loginWeb.png" class="loginIcon" alt="home" onclick="goBack()">
  </div>
</nav>
<hr>
<div class="boardContainer">
  <div class="boardListContainer">
    <div class="boardListBox">

      <div class="boardPageTitle">고객 문의</div><br>
      <!--  DB 불러오기   -->
      <div class="boardWriteTitle" > ${qnaDTO.subject} </div><br>
      <br>
      <div class="boardWriteContent" >${qnaDTO.content}</div><br>
      <br>
      <div>파일 불러오기 </div>
    </div>
    <br>
    <div style="float: right;">
      <button onclick="goList()">목록</button>
      <c:if test="${logId == qnaDTO.userId}">
        <button onclick="qnaEdit()">수정</button>
        <button onclick="qnaDel()">삭제</button>
      </c:if>
    </div>
  </div>
</div>
</body>
</html>
<script>
  function goList() {
    window.location.href = '/hari/qnaList';
  }

  function qnaEdit() {
    window.location.href = `/hari/qnaEdit?qNo=${qnaDTO.qNo}`;
  }

  function qnaDel() {
    if (confirm("삭제하시겠습니까?")) {
      // 사용자가 확인을 누른 경우
      window.location.href = `/hari/qnaDelete?qNo=${qnaDTO.qNo}`;
    }
  }
</script>