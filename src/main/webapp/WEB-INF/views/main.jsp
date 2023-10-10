<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="ko" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;800&display=swap" rel="stylesheet">
    <title>HARI</title>

</head>
<body>
<nav>
    <a href="/hari/mainNav">
        <input type="button" class="hamburger">
    </a>
    <div class="cart">
        <div class="cartPlus"></div>
    <input type="button" class="cart-button">
    </div>
</nav>
    <br>
    <br>
    <div class="locationContainer">
    <div class="locationBox">
        <div class="locationText">내 장소</div>
        <div class="myLocation">
            <input type="button" class="myLocationButton" id="myLocation">
            <!--   위치 API     -->
            <span class="myLocationText" id="myLocationText">서초구 방배동</span>
        </div>
        <br>

        <div class="mainOutLine">
            <div class="menuCategory">
                <ul class="listUnderLine">
                <li><a href="#">전체</a></li>
                <li><a href="#">카페</a></li>
                <li><a href="#">한식</a></li>
                <li><a href="#">양식</a></li>
                <li><a href="#">중식</a></li>
                </ul>
            </div>
    <!-- 반복문 DB 불러오기 -->
            <br>
            <div class="storeBox">
                <div class="storeImg"><img src="/img/ame.jpg" alt="매장 이미지"></div>
                <div class="storeBoxText">
                <ul>
                    <li class="storeName"><a href="#">스타벅스 이수역</a></li>
                    <li class="storeCategory">카페</li>
                </ul>
                </div>
            </div>
            <br>
            <div class="storeBox">
                <div class="storeImg"><img src="/img/ame.jpg" alt="매장 이미지"></div>
                <div class="storeBoxText">
                    <ul>
                        <li class="storeName"><a href="#">스타벅스 이수역</a></li>
                        <li class="storeCategory">카페</li>
                    </ul>
                </div>
            </div>
            <br>
            <div class="storeBox">
                <div class="storeImg"><img src="/img/ame.jpg" alt="매장 이미지"></div>
                <div class="storeBoxText">
                    <ul>
                        <li class="storeName"><a href="#">스타벅스 이수역</a></li>
                        <li class="storeCategory">카페</li>
                    </ul>
                </div>
            </div>
            <br>
            <div class="storeBox">
                <div class="storeImg"><img src="/img/ame.jpg" alt="매장 이미지"></div>
                <div class="storeBoxText">
                    <ul>
                        <li class="storeName"><a href="#">스타벅스 이수역</a></li>
                        <li class="storeCategory">카페</li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
    </div>

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    var options = {
        enableHighAccuracy: true,
        timeout: 5000,
        maximumAge: 0
    };
    function success(pos) {
        var crd = pos.coords;
        console.log('위도 : ' + crd.latitude);
        console.log('경도: ' + crd.longitude);
        lat = crd.latitude;
        lon = crd.longitude;

        // $.ajax() 함수를 success callback 함수 내에서 실행
        $.ajax({
            url: 'https://dapi.kakao.com/v2/local/geo/coord2address.json?x=' + lon + '&y=' + lat,
            type: 'GET',
            headers: {
                'Authorization': 'KakaoAK 7e4567fb1683a25d1d9f3fc0240900a5'
            },
            success: function(data) {
                console.log(data);
                document.getElementById('myLocationText').innerHTML = data.documents[0].address.region_2depth_name + ' ' + data.documents[0].address.region_3depth_name;
            }
        });
    }

    function error(err) {
        console.warn('ERROR(' + err.code + '): ' + err.message);
    }

    $("#myLocation").click(function() {
        navigator.geolocation.getCurrentPosition(success, error, options);
    });
</script>

</html>