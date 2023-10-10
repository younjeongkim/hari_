<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/totalSignIn.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;800&display=swap" rel="stylesheet">
    <title>회원가입</title>
</head>
<body>
<nav>
    <a href="/"> <div class="nav">HARI</div></a>
    <div class="navIcon">
        <img src="/img/loginWeb.png" class="loginIcon" alt="home" onclick="goBack()">
    </div>
</nav>
<hr>
<div class="SPageContainer">
    <div class="SignInContainer">
        <div class="SignInBox">
            <div class="SignInTitleBar">
        <div class="SPageTitle" id="userSignTitle" style="display:block">일반 회원가입</div>
            <div class="SPageTitle" id="bizSignTitle" style="display:none;">비즈니스 회원가입</div>
            <div class="switchSec">
                <div class="switchText">일반</div>
                <label class="switch">
                    <input type="checkbox" id="toggle">
                    <span class="slider round"></span>
                </label>
                <div class="switchText">비즈니스</div>
            </div>
            </div>
            <br>
<!--        <form action="/hari/totalLogIn" method="post" id="userSign"  style="display:block;" >-->
        <form action="/hari/userSignInOk" method="post" id="userSign"  style="display:block;" >
        <div class="SBox">
            <div class="SRow">
                <img src="/img/idIcon.png" class="SIcon" alt="아이디">
                <input class="SInputRow" type="text" name="userId" placeholder="아이디"/>
            </div>
            <hr class="SignBoxLine">
            <div class="SRow">
                <img src="/img/lock.png" class="SIcon" alt="비밀번호">
                <input class="SInputRow" type="password" name="userPwd" placeholder="비밀번호"/>
            </div>
            <hr class="SignBoxLine">
            <div class="SRow">
                <img src="/img/mail.png" class="SIcon" alt="이메일">
                <input class="SInputRow" type="text" name="email" placeholder="이메일"/>
            </div>
        </div>
        <br><br>
        <div class="SBox">
            <div class="SRow">
                <img src="/img/idIcon.png" class="SIcon" alt="이름">
                <input class="SInputRow" type="text" name="userName" placeholder="이름"/><br>
            </div>
            <hr class="SignBoxLine">
            <div class="SRow">
                <img src="/img/idIcon.png" class="SIcon" alt="닉네임">
                <input class="SInputRow" type="text" name="nickName" placeholder="닉네임"/><br>
            </div>
            <hr class="SignBoxLine">
            <div class="SRow">
                <img src="/img/phone.png" class="SIcon" alt="연락처">
                <input class="SInputRow" type="text" name="phone" placeholder="연락처"/><br>
            </div>


        </div>
            <br>
            <input class="SignInButton" type="submit" value="확인">
        </form>

<!--            <form action="/hari/totalLogIn" method="post" id="bizSign"  style="display:none;">-->
            <form action="/hari/shopSignInOk" method="post" id="bizSign"  style="display:none;">
                <div class="SBox">
                    <div class="SRow">
                        <img src="/img/idIcon.png" class="SIcon" alt="아이디">
                        <input class="SInputRow" type="text" name="bId" placeholder="아이디"/>
                    </div>
                    <hr class="SignBoxLine">
                    <div class="SRow">
                        <img src="/img/lock.png" class="SIcon" alt="비밀번호">
                        <input class="SInputRow" type="password" name="bPwd" placeholder="비밀번호"/>
                    </div>
                    <hr class="SignBoxLine">
                    <div class="SRow">
                        <img src="/img/mail.png" class="SIcon" alt="이메일">
                        <input class="SInputRow" type="text" name="bEmail" placeholder="이메일"/>
                    </div>
                </div>
                <br><br>
                <div class="SBox">
                    <div class="SRow">
                        <img src="/img/idIcon.png" class="SIcon" alt="대표자 이름">
                        <input class="SInputRow" type="text" name="bOwner" placeholder="대표자 이름"/><br>
                    </div>
                    <hr class="SignBoxLine">
                    <div class="SRow">
                        <img src="/img/phone.png" class="SIcon" alt="연락처">
                        <input class="SInputRow" type="text" name="bPhone" placeholder="연락처"/><br>
                    </div>
                    <hr class="SignBoxLine">
                    <div class="SRow">
                        <img src="/img/shop.png" class="SIcon" alt="가게 이름">
                        <input class="SInputRow" type="text" name="bName" placeholder="가게 이름"/><br>
                    </div>
                    <hr class="SignBoxLine">
                    <div class="SRow">
                        <img src="/img/shop.png" class="SIcon" alt="사업자등록번호">
                        <input class="SInputRow" type="text" name="bNo" placeholder="사업자등록번호"/><br>
                    </div>
                    <hr class="SignBoxLine">
                    <div class="SRow">
                        <img src="/img/shop.png" class="SIcon" alt="가게 주소">
                        <input class="SInputRow" type="text" name="bAddr" placeholder="가게 주소"/><br>
                    </div>
                    <hr class="SignBoxLine">
                    <div class="SRow">
                        <img src="/img/shop.png" class="SIcon" alt="업종 분류">
                        <input class="SInputRow" type="text" name="bCategory" placeholder="업종 분류"/><br>
                    </div>

                </div>
                <br>
                <input class="SignInButton" type="submit" value="확인">
            </form>

        </div>
    </div>
</div>
<br>

</body>
<script>
    const toggle=document.querySelector('#toggle');
    toggle.addEventListener('change', (event) => {
        if (toggle.checked) {
            //체크박스 체크 되면 나타나고
            const bizSignTitle = document.querySelector('#bizSignTitle');
            const bizSign = document.querySelector('#bizSign');
            const userSign = document.querySelector('#userSign');
            const userSignTitle = document.querySelector('#userSignTitle');


            if (bizSign) {
                bizSignTitle.style.display="block";
                bizSign.style.display = "block";
                userSign.style.display="none";
                userSignTitle.style.display="none";
            }
        } else {
            //체크박스 체크 해제 되면 사라진다
            const bizSignTitle = document.querySelector('#bizSignTitle');
            const bizSign = document.querySelector('#bizSign');
            const userSign = document.querySelector('#userSign');
            const userSignTitle = document.querySelector('#userSignTitle');
            bizSignTitle.style.display="none";
            bizSign.style.display = "none";
            userSign.style.display="block";
            userSignTitle.style.display="block";
        }
    })

    function goBack() {
        history.back();
    }

</script>
</html>