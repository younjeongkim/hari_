<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="ko">
<head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/shopMenuWrite.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;800&display=swap" rel="stylesheet">
    <title>우리 가게 관리</title>
</head>

<body>
<nav>
    <a href="/"> <div class="nav">HARI</div></a>
    <div class="navIcon">
        <img src="/img/loginWeb.png" class="loginIcon" alt="home">
    </div>
</nav>
<hr>
<div class="MenuWritePageContainer">
    <div class="MenuWriteContainer">
        <div class="MenuWriteBox">
            <div class="MenuWritePageTitle">우리 가게 관리 ㅣ 메뉴 등록</div><br>
            <div class="formText">
            <div class=>가게 이름</div>
            <div class="shopLocation">스타벅스 이수역점</div>
            <br>
                <div class="mBox">
                <form action="/hari/shopMenuWrite" method="post">
                 <div>메뉴명<br>
                    <input class="mInputRow" type="text"/><br>
                 </div> <br>
                 <div>메뉴 사진<br>
                    <input class="mInputRow" type="file"/><br>
                 </div> <br>
                 <div>메뉴 가격 <br>
                    <input class="mInputRow" type="text"><br>
                 </div> <br>
                 <div>메뉴 설명<br>
                    <textarea class="mInputRow"></textarea><br>
                 </div> <br>
                 <div>메뉴 분류<br>
                <select class="dropRow">
                    <option value="카페">카페</option>
                    <option value="한식">한식</option>
                    <option value="양식">양식</option>
                    <option value="중식">중식</option>
                    <option value="일식">일식</option>
                </select><br>
                 </div>
                    <br>
            <input class="mwButton" type="submit" value="확인">
            </form>
            </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>