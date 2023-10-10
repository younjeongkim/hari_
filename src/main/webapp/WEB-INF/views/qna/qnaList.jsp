<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="ko" xmlns="http://www.w3.org/1999/html">
<head>
  <meta charset="UTF-8" >
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/qnaList.css">
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
        <div class="titleNButton">
        <div class="boardPageTitle">고객 문의</div><br>
          <div>총 레코드 수 : ${pagingDTO.totalRecord}</div>
        <div style="margin-left: auto;">
          <a href="/hari/qnaWrite">
            <button>글쓰기</button>
          </a>
        </div>
        </div>
        <ul class="boardTop">
          <li class="boardTopText">TITLE</li>
          <li class="boardTopText">ID</li>
          <li class="boardTopText">DATE</li>
        </ul>
<!--       반복문 사용해서 게시판 리스트 추가   -->
<%--        <ul>--%>
<%--          <li>가맹점 문의 드립니다 가맹점 문의 드립니다 가맹점 문의 드립니다 </li>--%>
<%--          <li>kyj</li>--%>
<%--          <li>23-09-29 12:15</li>--%>
<%--        </ul>--%>
<%--        <!--       반복문 사용해서 메뉴 리스트 추가   -->--%>
<%--        <ul>--%>
<%--          <li>가맹점 문의 드립니다</li>--%>
<%--          <li>kyj</li>--%>
<%--          <li>23-09-29 12:15</li>--%>
<%--        </ul>--%>
        <c:forEach var="dto" items="${list }">
          <ul>
            <li>
              <a href='/hari/qnaView?qNo=${dto.qNo}&nowPage=${pagingDTO.nowPage}<c:if test="${pagingDTO.searchWord != null}">&searchKey=${pagingDTO.searchKey}&searchWord=${pagingDTO.searchWord}</c:if>'>
                  ${dto.subject}
              </a>
            </li>
            <li>${dto.userId}</li>
            <li>${dto.createdAt}</li>
          </ul>
        </c:forEach>


    </div>

  </div>
  <!--  페이징      -->
  <div class="paging">
<%--    <ul>--%>
<%--      <li class="pagingNum"><a>prev</a></li>--%>
<%--      <li class="pagingNum"><a>1</a></li>--%>
<%--      <li class="pagingNum"><a>2</a></li>--%>
<%--      <li class="pagingNum"><a>3</a></li>--%>
<%--      <li class="pagingNum"><a>4</a></li>--%>
<%--      <li class="pagingNum"><a>5</a></li>--%>
<%--      <li class="pagingNum">next</li>--%>
<%--    </ul>--%>
    <ul>
      <c:if test="${pagingDTO.nowPage == 1}">
        <li class="pagingNum"><a>prev</a></li>
      </c:if>
      <c:if test="${pagingDTO.nowPage > 1}">
        <li class="pagingNum">
          <a href='/hari/qnaList?nowPage=${pagingDTO.nowPage - 1 }<c:if test="${pagingDTO.searchWord != null}">&searchKey=${pagingDTO.searchKey}&searchWord=${pagingDTO.searchWord}</c:if>'>
            prev
          </a>
        </li>
      </c:if>

      <c:forEach var="p" begin="${pagingDTO.startPageNum }" end="${pagingDTO.startPageNum + pagingDTO.onePageNumCount - 1}" step="1">
        <c:if test="${p <= pagingDTO.totalPage }">
          <c:if test="${p == pagingDTO.nowPage }">
            <li class="pagingNum">
              <a href='/hari/qnaList?nowPage=${p }<c:if test="${pagingDTO.searchWord != null}">&searchKey=${pagingDTO.searchKey}&searchWord=${pagingDTO.searchWord}</c:if>'>
                ${p }
              </a>
            </li>
          </c:if>
          <c:if test="${p != pagingDTO.nowPage }">
            <li class="pagingNum">
              <a href='/hari/qnaList?nowPage=${p }<c:if test="${pagingDTO.searchWord != null}">&searchKey=${pagingDTO.searchKey}&searchWord=${pagingDTO.searchWord}</c:if>'>
                ${p }
              </a>
            </li>
          </c:if>
        </c:if>
      </c:forEach>

      <c:if test="${pagingDTO.totalPage <= pagingDTO.nowPage }">
        <li class="pagingNum"><a>next</a></li>
      </c:if>
      <c:if test="${pagingDTO.totalPage > pagingDTO.nowPage }">
        <li class="pagingNum">
          <a href='/hari/qnaList?nowPage=${pagingDTO.nowPage + 1 }<c:if test="${pagingDTO.searchWord != null}">&searchKey=${pagingDTO.searchKey}&searchWord=${pagingDTO.searchWord}</c:if>'>
            next
          </a>
        </li>
      </c:if>
    </ul>
  </div>
  <!--  페이징      -->

<%--  <div class="searchBar"><br>--%>
<%--    <select class="dropRow">--%>
<%--      <option value="아이디">아이디</option>--%>
<%--      <option value="제목">제목</option>--%>
<%--      <option value="본문">본문</option>--%>
<%--    </select><br>--%>
<%--    <input type="text" class="searchBox">--%>
<%--  </div>--%>

  <div class="searchBar"><br>
    <form action="/hari/qnaList">
      <select class="dropRow" name="searchKey" id="searchKeySelect">
        <option value="userId">아이디</option>
        <option value="subject">제목</option>
        <option value="content">본문</option>
      </select><br>
      <input type="text" class="searchBox" name="searchWord" id="searchWord">
    </form>
  </div>

</div>
</body>
</html>

<script>
  function goBack() {
    history.back();
  }

  // 페이지 로드 시, URL 파라미터를 확인하여 선택된 옵션을 설정
  window.onload = function() {
    const urlParams = new URLSearchParams(window.location.search);
    const selectedOption = urlParams.get("searchKey");

    if (selectedOption) {
      const searchKeySelect = document.getElementById("searchKeySelect");
      searchKeySelect.value = selectedOption;
    }
  }
</script>