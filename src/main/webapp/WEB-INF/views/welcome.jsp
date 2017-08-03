<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Welcome</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">


</head>
<body
	style="background-image: url('${contextPath}/resources/images/editedpicturetwo.png');">

	<div class="container" style="text-align: center; font-style: normal;">

		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>

			<h2>
				<font color="white">Welcome</Font> <font color="white">${user.nameSurname}
					|</Font> <a onclick="document.forms['logoutForm'].submit()">Logout</a>

			</h2>

		</c:if>

	</div>
	<div style="margin-left: 100px;">

		<form action="${contextPath}/getCity/" method="get">
			<select name="sehir" style="width: 270px; height: 40px;">
				<option>---İl seçiniz...---</option>
				<option value="Adana">Adana</option>
				<option value="Adıyaman">Adıyaman</option>
				<option value="Afyonkarahisar">Afyonkarahisar</option>
				<option value="Ağrı">Ağrı</option>
				<option value="Aksaray">Aksaray</option>
				<option value="Amasya">Amasya</option>
				<option value="Ankara">Ankara</option>
				<option value="Antalya">Antalya</option>
				<option value="Ardahan">Ardahan</option>
				<option value="Artvin">Artvin</option>
				<option value="Tire">Aydın</option>
				<option value="Balikesir">Balıkesir</option>
				<option value="Bartin">Bartın</option>
				<option value="Batman">Batman</option>
				<option value="Bayburt">Bayburt</option>
				<option value="Bilecik">Bilecik</option>
				<option value="Bingol">Bingöl</option>
				<option value="Bitlis">Bitlis</option>
				<option value="Bolu">Bolu</option>
				<option value="Burdur">Burdur</option>
				<option value="Bursa">Bursa</option>
				<option value="Canakkale">Çanakkale</option>
				<option value="Çankırı">Çankırı</option>
				<option value="Çorum">Çorum</option>
				<option value="Denizli">Denizli</option>
				<option value="Diyarbakır">Diyarbakır</option>
				<option value="Duzce">Düzce</option>
				<option value="Edirne">Edirne</option>
				<option value="Elazığ">El-aziz</option>
				<option value="Erzincan">Erzincan</option>
				<option value="Erzurum">Erzurum</option>
				<option value="Eskisehir">Eskisehir</option>
				<option value="Gaziantep">Gaziantep</option>
				<option value="Giresun">Giresun</option>
				<option value="Gümüşhane">Gümüşhane</option>
				<option value="Hakkari">Hakkari</option>
				<option value="Hatay">Hatay</option>
				<option value="Igdır">Iğdır</option>
				<option value="Isparta">Isparta</option>
				<option value="İstanbul">İstanbul</option>
				<option value="İzmir">İzmir</option>
				<option value="Kahramanmaraş">Kahramanmaraş</option>
				<option value="Karabük">Karabük</option>
				<option value="Karaman">Karaman</option>
				<option value="Kars">Kars</option>
				<option value="Kastamonu">Kastamonu</option>
				<option value="Kayseri">Kayseri</option>
				<option value="Kirikkale">Kırıkkale</option>
				<option value="Kırklareli">Kırklareli</option>
				<option value="Kırşehir">Kırşehir</option>
				<option value="Kilis">Kilis</option>
				<option value="Kocaeli">Kocaeli</option>
				<option value="Konya">Konya</option>
				<option value="Kütahya">Kütahya</option>
				<option value="Malatya">Malatya</option>
				<option value="Manisa">Manisa</option>
				<option value="Mardin">Mardin</option>
				<option value="Mersin">Mersin</option>
				<option value="Mugla">Muğla</option>
				<option value="Muş">Muş</option>
				<option value="Nevşehir">Nevşehir</option>
				<option value="Niğde">Niğde</option>
				<option value="Ordu">Ordu</option>
				<option value="Osmaniye">Osmaniye</option>
				<option value="Rize">Rize</option>
				<option value="Adapazari">Sakarya</option>
				<option value="Samsun">Samsun</option>
				<option value="Siirt">Siirt</option>
				<option value="Sinop">Sinop</option>
				<option value="Sivas">Sivas</option>
				<option value="Şanlıurfa">Şanlıurfa</option>
				<option value="Sirnak">Şırnak</option>
				<option value="Tekirdağ">Tekirdağ</option>
				<option value="Tokat">Tokat</option>
				<option value="Trabzon">Trabzon</option>
				<option value="Tunceli">Tunceli</option>
				<option value="Uşak">Uşak</option>
				<option value="Van">Van</option>
				<option value="Yalova">Yalova</option>
				<option value="Yozgat">Yozgat</option>
				<option value="Zonguldak">Zonguldak</option>
			</select> <input type="submit" value="Görüntüle">

		</form>

	</div>
	
	<div align="center">

		<table border="4">
			<tr>
				<th>
					<p style="text-align: center;">
						<font color="red" style="font-size: 40px;"> ${sehirModified}</font>	<br>					
						<font color="blue" style="font-size: 30px;"> °${part1.temp_C} C </font>
						<font color="blue" style="font-size: 30px;">Gözlem zamanı:	 ${part1.observation_time} </font><br>
						<font color="blue" style="font-size: 30px;"> <img src="${part1.value}"> </font>
						<font color="blue" style="font-size: 30px;"> ${part1.weather_Description} </font><br>
						<font color="blue" style="font-size: 30px;"> Pressure:	${part1.pressure} mb </font>
						<font color="blue" style="font-size: 30px;"> Humidity:	% ${part1.humidity} </font><br>
						<font color="yellow" style="font-size: 30px;">Wind Speed: ${part1.windspeedKmph} Kmph   </font>
						<font color="yellow" style="font-size: 30px;"> °${part1.winddirDegree} </font>
						
						

					</p>

				</th>
			</tr>

		</table>

	</div>

	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script
		src="http://api.worldweatheronline.com/premium/v1/weather.ashx?key=29d33f7edae345daaed70640172407&q=Ankara&tp=10&format=json"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
