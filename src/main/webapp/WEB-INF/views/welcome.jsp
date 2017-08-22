<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<!--The <meta> element is used to specify which character set is used, page description, keywords, author, and other metadata. -->
<meta name="author" content="Muhammed Duran">
<!-- Define the author of a page -->
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<!-- Adding "chrome=1" to content will allow the site to render in ChromeFrame -->
<!-- without affecting anyone else. -->
<meta charset="UTF-8">
<!--Define the character set used: -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--       <meta> viewport element gives the browser instructions on how to control the page's dimensions and scaling. -->
<!-- The width=device-width part sets the width of the page to follow the screen-width of the device (which will vary depending on the device). -->
<!-- The initial-scale=1.0 part sets the initial zoom level when the page is first loaded by the browser. -->

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.9/angular.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/jsalert.min.js"></script>
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<title>Welcome</title>



<style type="text/css">
input[type=text] {
	background-image: url('${contextPath}/resources/images/arama.png');
	background-repeat: no-repeat;
	width: 50px;
	font-size: 13px;
	padding: 12px 20px 12px 40px;
	border: 1px solid #ddd;
	margin-bottom: 12px;
	color: black;
}

input[type=text]:focus {
	width: 150px;
}

a{
color:white;
}

div.main {
	margin: auto;
	margin-top: 5px;
	position: static;
	width: 1450px;
	height: 1380px;
	border: 2px solid #20B2AA;
	padding: 20px;
	clear: both;
	/*No floating elements allowed on either the left or the right side */
}

div.zaman {
	color: white;
	text-align: center;
	width: 400px;
	height: auto;
	font-size: 50px;
	background: linear-gradient(to right, rgba(132, 132, 225, 1),
		rgba(71, 71, 209, 1));
}

div.current {
	float: left;
	margin-top: 40px;
	padding: 10px;
	position: static;
	width: 400px;
	height: auto;
	border: 2px solid #20B2AA;
	border-style: inset;
	clear: left; /*No floating elements allowed on the left side*/
	background-color: rgba(153, 194, 255, 0.5);
}

div.hourly {
	position: static;
	float: left;
	margin-top: -70px;
	margin-left: 15px;
	width: 950px;
	height: auto;
	border: 2px solid #20B2AA;
	border-style: inset;
	padding: 10px;
	background-color: rgba(153, 194, 255, 0.5);
}

div.hourlyTime {
	text-align: center;
	background-color: rgba(0, 82, 204, 0.3);
	padding: 3px;
}

div.hourlyTempC {
	margin-top: 5px;
	background-color: rgba(0, 82, 204, 0.3);
	padding: 3px;
}

div.hourlyIcon {
	margin-top: 5px;
	background-color: rgba(0, 82, 204, 0.3);
	padding: 3px;
}

div.hourlyHumidity {
	margin-top: 5px;
	background-color: rgba(0, 82, 204, 0.3);
	padding: 3px;
}

div.hourlyChanceofRain {
	margin-top: 5px;
	background-color: rgba(0, 82, 204, 0.3);
	padding: 3px;
}

div.daily {
	float: right;
	position: static;
	margin-right: 37px;
	margin-top: 30px;
	width: 950px;
	height: auto;
	color: white;
	border: 2px solid #20B2AA;
	border-style: inset;
	padding: 10px;
	background-color: rgba(153, 194, 255, 0.5);
	margin-bottom: 30px;
}

div.dailyDate {
	margin-top: 5px;
	margin-left: 15px;
	background-color: rgba(0, 82, 204, 0.3);
	height: 400px;
	width:205px;
	padding: 3px;
}

div.dailyTempC {
	margin-top: 5px;
	align: center;
	margin-left: 25px;
	background-color: rgba(0, 82, 204, 0.3);
	height: 400px;
	width:110px;
	padding: 3px;
}

div.dailyIconandDescription {
	margin-top: 5px;
	margin-left: 25px;
	background-color: rgba(0, 82, 204, 0.3);
	height: 400px;
	width:350px;
	padding: 3px;
}

div.dailyHumidity {
	margin-top: 5px;
	margin-left: 25px;
	background-color: rgba(0, 82, 204, 0.3);
	height: 400px;
	padding: 3px;
}

div.dailyChanceofRain {
	margin-top: 5px;
	margin-left: 25px;
	background-color: rgba(0, 82, 204, 0.3);
	height: 400px;
	padding: 3px;
}
</style>
</head>
<body onload="JSalert()"
	style="background-image:url('${contextPath}/resources/images/background2.jpg'); background-repeat: no-repeat background-attachment: fixed">

<audio src="${contextPath}/resources/audios/ses.mp3" autoplay></audio>
	<div class="header";
		style="width: 100%; height:80px; color:white;  background-color:rgba(46, 184, 184, 0.4); border: 1px solid white; padding-top:10px;  font-family: Georgia;">
    
		<c:if test="${pageContext.request.userPrincipal.name != null}">
		
		
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
			
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
		
		
		<div  style="width=150px; height:70px; float:right;">
		
			<h1 style="color:black;  text-align:right;">
			<img src="${contextPath}/resources/images/exit.png" width=30px; height=30px;>
				<a onclick="document.forms['logoutForm'].submit()">Çıkış</a>
			</h1>
		</div>
		<div style="width:600px; height:70px; float:left; margin-left:40px;">
		<marquee direction="right">
		<h1>Hoşgeldiniz</h1>
		</marquee>
		</div>
		

		
		</c:if>

	</div>

	<div style="text-align:center; color: white">

		<form action="${contextPath}/Türkiye/" method="get">
			<select name="sehir"
				style="width: 150px; height: 30px; background-color: black;">

				<option>Şehir Seçiniz</option>

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



			</select> <input type="submit" value="Göster" style="background-color: blue">

		</form>
		<form action="${contextPath}/Türkiye/" method="get">
			<input type="text" name="sehir" placeholder="Şehir Ara">

		</form>

	</div>
<div style="width:1450px; margin-top:5px; margin-left:80px; color:white; font-size:26px; padding:4px; background-color:blue;">
	<td style="text-align:center;">

		<marquee style="text-align: left" onmouseover="this.stop();"
			onmouseout="this.start();" direction="left" scrolldelay="70"
			scrollamount="3" width="700" height="40">
			<p>●${part4List.get(0).getmCity()}  ${part4List.get(0).getTemp_C()}°C  	
			   ●${part4List.get(1).getmCity()}  ${part4List.get(1).getTemp_C()}°C  
			   ●${part4List.get(2).getmCity()}  ${part4List.get(2).getTemp_C()}°C  
			   ●${part4List.get(3).getmCity()}  ${part4List.get(3).getTemp_C()}°C  
			   ●${part4List.get(4).getmCity()}  ${part4List.get(4).getTemp_C()}°C  
			   ●${part4List.get(5).getmCity()}  ${part4List.get(5).getTemp_C()}°C  
			   ●${part4List.get(6).getmCity()}  ${part4List.get(6).getTemp_C()}°C  
			   ●${part4List.get(7).getmCity()}  ${part4List.get(7).getTemp_C()}°C  
			   ●${part4List.get(8).getmCity()}  ${part4List.get(8).getTemp_C()}°C  
			   ●${part4List.get(9).getmCity()}  ${part4List.get(9).getTemp_C()}°C  
			   ●${part4List.get(10).getmCity()}  ${part4List.get(10).getTemp_C()}°C  
			   ●${part4List.get(11).getmCity()}  ${part4List.get(11).getTemp_C()}°C
			   ●${part4List.get(12).getmCity()}  ${part4List.get(12).getTemp_C()}°C
			   ●${part4List.get(13).getmCity()}  ${part4List.get(13).getTemp_C()}°C
			   ●${part4List.get(14).getmCity()}  ${part4List.get(14).getTemp_C()}°C
			   ●${part4List.get(15).getmCity()}  ${part4List.get(15).getTemp_C()}°C
			   ●Balıkesir  ${part4List.get(16).getTemp_C()}°C
			   ●${part4List.get(17).getmCity()}  ${part4List.get(17).getTemp_C()}°C
			   ●${part4List.get(18).getmCity()}  ${part4List.get(18).getTemp_C()}°C
			   ●Aydın  ${part4List.get(19).getTemp_C()}°C
			   ●${part4List.get(20).getmCity()}  ${part4List.get(20).getTemp_C()}°C
			   ●Sakarya  ${part4List.get(21).getTemp_C()}°C
			   ●${part4List.get(22).getmCity()}  ${part4List.get(22).getTemp_C()}°C
			   ●Muğla  ${part4List.get(23).getTemp_C()}°C
			   ●${part4List.get(24).getmCity()}  ${part4List.get(24).getTemp_C()}°C
			   ●${part4List.get(25).getmCity()}  ${part4List.get(25).getTemp_C()}°C
			   ●${part4List.get(26).getmCity()}  ${part4List.get(26).getTemp_C()}°C
			   ●${part4List.get(27).getmCity()}  ${part4List.get(27).getTemp_C()}°C
			   ●${part4List.get(28).getmCity()}  ${part4List.get(28).getTemp_C()}°C
			   ●${part4List.get(29).getmCity()}  ${part4List.get(29).getTemp_C()}°C </p>
			   
		</marquee>


	</td>

	<td style="text-align:left;">

		<marquee style="text-align: left; padding-left:20px;" onmouseover="this.stop();"
			onmouseout="this.start();" direction="down" scrolldelay="1"
			scrollamount="2"  width="300" height="40">
			<p><img src="${contextPath}/resources/images/azerbaycan.png"; width=30px; height=30px;>Bakü   ${part5List.get(0).temp_C}°C</p>
			<p><img src="${contextPath}/resources/images/kazakistan.jpg"; width=30px; height=30px;>Astana   ${part5List.get(1).temp_C}°C</p>
			<p><img src="${contextPath}/resources/images/türkmenistan.png"; width=30px; height=30px;>Aşkabat   ${part5List.get(2).temp_C}°C</p>
			<p><img src="${contextPath}/resources/images/özbekistan.png"; width=30px; height=30px;>Taşkent   ${part5List.get(3).temp_C}°C</p>
			<p><img src="${contextPath}/resources/images/kırgızistan.png"; width=30px; height=30px;>Bişkek   ${part5List.get(4).temp_C}°C</p>
			<p><img src="${contextPath}/resources/images/kktc.png"; width=30px; height=30px;>Lefkoşa   ${part5List.get(5).temp_C}°C</p>

		</marquee>

	</td>
</div>

	<script type="text/javascript">
		var sayi0 = ${part2List.get(0).cor};
		var sayi1 = ${part2List.get(1).cor};
		var sayi2 = ${part2List.get(2).cor};
		var sayi3 = ${part2List.get(3).cor};
		var sayi4 = ${part2List.get(4).cor};
		var sayi5 = ${part2List.get(5).cor};
		var sayi6 = ${part2List.get(6).cor};
		var sayi7 = ${part2List.get(7).cor};
		function JSalert() { 

		if (sayi0 >= 70 || sayi1 >= 70 || sayi2 >= 70 || sayi3 >= 70 
					|| sayi4 >= 70 || sayi5 >= 70 || sayi6 >= 70 || sayi7 >= 70) { 
				JSAlert.alert("Bugün yağış ihtimali yüksek").dismissIn(30000); 
			}  
 		}
 	</script> 

	<div class="main">



		<div class="zaman">

			<p id="demo"></p>

			<script>
				var myVar = setInterval(myTimer, 1000);

				function myTimer() {
					var d = new Date();
					document.getElementById("demo").innerHTML = d
							.toLocaleTimeString();
				}
			</script>
		</div>


		<div class="current">

			<p style="text-align: center; color: white; font-size: 40px;">${sehirModified}
				<img
					src="https://lh3.googleusercontent.com/-4zazP-xhmss/VhE4djUJp9I/AAAAAAAAkiU/jBStEbAHLzw/s1600/turkey-flag-animation.gif"
					width=50px; height=50px;>
			</p>
			<br>
			<p style="text-align: center; font-size: 40px; color: red;">
				<img src="${contextPath}/resources/images/temp.svg" width=50px; height=50px;>
				${part1.temp_C} °C</p>
			<p style="font-size: 40px; color: white;">
				<img src="${part1.modifiedIcon}"> ${part1.lang_tr}
			</p>
			<p style="font-size: 30px; color: white;">Gözlem zamanı:
				${part1.observation_time}</p>
			<p style="font-size: 30px; color: white;">Basınç:
				${part1.pressure} mb</p>
			<p style="font-size: 30px; color: white;">Nem: %${part1.humidity}
			</p>
			<font color="white" style="font-size: 25px;">Rüzgar Hızı:
				${part1.windspeedKmph} Kmph </font> <font color="white"
				style="font-size: 20px;"> ${part1.winddirDegree} ° </font>
			<img src="http://cdn.worldweatheronline.net/images/wind/${part1.winddir16Point}.png" width=30px; height=30px;>


		</div>
		<div class="hourly">
			<table>
				<tr>
					<td>
						<div class="hourlyTime">
							<p style="color: white; font-size: 30px; word-spacing: 8px;">
								Saat <span style="margin-left: 15px;">${part2List.get(0).time}</span>
								<span style="margin-left: 15px;">${part2List.get(1).time}</span>
								<span style="margin-left: 15px;">${part2List.get(2).time}</span>
								<span style="margin-left: 15px;">${part2List.get(3).time}</span>
								<span style="margin-left: 15px;">${part2List.get(4).time}</span>
								<span style="margin-left: 15px;">${part2List.get(5).time}</span>
								<span style="margin-left: 15px;">${part2List.get(6).time}</span>
								<span style="margin-left: 15px;">${part2List.get(7).time}</span>
							</p>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<div class="hourlyTempC">

							<p style="color: white;">
								<span style="text-align: left; font-size: 25px;">Sıcaklık</span>
								<span style="margin-left: 13px; font-size: 30px;">${part2List.get(1).tempC}°C</span>
								<span style="margin-left: 36px; font-size: 30px;">${part2List.get(1).tempC}°C</span>
								<span style="margin-left: 36px; font-size: 30px;">${part2List.get(2).tempC}°C</span>
								<span style="margin-left: 36px; font-size: 30px;">${part2List.get(3).tempC}°C</span>
								<span style="margin-left: 36px; font-size: 30px;">${part2List.get(4).tempC}°C</span>
								<span style="margin-left: 36px; font-size: 30px;">${part2List.get(5).tempC}°C</span>
								<span style="margin-left: 36px; font-size: 30px;">${part2List.get(6).tempC}°C</span>
								<span style="margin-left: 34px; font-size: 30px;">${part2List.get(7).tempC}°C</span>


							</p>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="hourlyIcon">

							<p style="color: white;">
								<span style="text-align: left; font-size: 25px;">Durum</span> <span
									style="margin-left: 32px;"><img
									src="${part2List.get(0).modifiedIcon}" width=40px; height=40px></span>
								<span style="margin-left: 64px;"><img
									src="${part2List.get(1).modifiedIcon}" width=40px; height=40px></span>
								<span style="margin-left: 64px;"><img
									src="${part2List.get(2).modifiedIcon}" width=40px; height=40px></span>
								<span style="margin-left: 64px;"><img
									src="${part2List.get(3).modifiedIcon}" width=40px; height=40px></span>
								<span style="margin-left: 64px;"><img
									src="${part2List.get(4).modifiedIcon}" width=40px; height=40px></span>
								<span style="margin-left: 64px;"><img
									src="${part2List.get(5).modifiedIcon}" width=40px; height=40px></span>
								<span style="margin-left: 64px;"><img
									src="${part2List.get(6).modifiedIcon}" width=40px; height=40px></span>
								<span style="margin-left: 64px;"><img
									src="${part2List.get(7).modifiedIcon}" width=40px; height=40px></span>

							</p>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<div class="hourlyHumidity">

							<p style="color: white;">
								<span style="text-align: left; font-size: 25px;">Nem</span> 
								<span style="margin-left: 40px; font-size: 30px;">%${part2List.get(0).humidity}</span>
								<span style="margin-left: 47px; font-size: 30px;">%${part2List.get(1).humidity}</span>
								<span style="margin-left: 47px; font-size: 30px;">%${part2List.get(2).humidity}</span>
								<span style="margin-left: 47px; font-size: 30px;">%${part2List.get(3).humidity}</span>
								<span style="margin-left: 45px; font-size: 30px;">%${part2List.get(4).humidity}</span>
								<span style="margin-left: 45px; font-size: 30px;">%${part2List.get(5).humidity}</span>
								<span style="margin-left: 43px; font-size: 30px;">%${part2List.get(6).humidity}</span>
								<span style="margin-left: 33px; font-size: 30px;">%${part2List.get(7).humidity}</span>
							</p>
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<div class="hourlyChanceofRain">
							<table
								style="border-collapse: separate; border-spacing: 7px; *border-collapse: expression('separate', cellSpacing = '10px');">
								<tr style="color: white; width: 750px;">

									<td style="font-size: 20px; text-align: left; width: 85px;">Yağmur<br>Olasılığı
									</td>
									<td style="font-size: 30px; text-align: left; width: 96px;">%${part2List.get(0).chanceofrain}</td>
									<td style="font-size: 30px; text-align: center; width: 100px;">%${part2List.get(1).chanceofrain}</td>
									<td style="font-size: 30px; text-align: center; width: 100px;">%${part2List.get(2).chanceofrain}</td>
									<td style="font-size: 30px; text-align: center; width: 100px;">%${part2List.get(3).chanceofrain}</td>
									<td style="font-size: 30px; text-align: center; width: 100px;">%${part2List.get(4).chanceofrain}</td>
									<td style="font-size: 30px; text-align: center; width: 105px;">%${part2List.get(5).chanceofrain}</td>
									<td style="font-size: 30px; text-align: center; width: 108px;">%${part2List.get(6).chanceofrain}</td>
									<td style="font-size: 30px; text-align: center; width: 100px;">%${part2List.get(7).chanceofrain}</td>





								</tr>
							</table>
						</div>
					</td>
				</tr>

			</table>
		</div>

		<div class="daily">
			<table>
				<td>
					<div class="dailyDate">

						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.5;">Tarih</p>
						<p
							style="text-align: center; color: white; font-size: 20px; line-height: 1.9;">${part3List.get(1).finalDate}
							${part3List.get(1).day}</p>
						<p
							style="text-align: center; color: white; font-size: 20px; line-height: 1.9;">${part3List.get(2).finalDate}
							${part3List.get(2).day}</p>
						<p
							style="text-align: center; color: white; font-size: 20px; line-height: 1.9;">${part3List.get(3).finalDate}
							${part3List.get(3).day}</p>
						<p
							style="text-align: center; color: white; font-size: 20px; line-height: 1.9;">${part3List.get(4).finalDate}
							${part3List.get(4).day}</p>
						<p
							style="text-align: center; color: white; font-size: 20px; line-height: 1.9;">${part3List.get(5).finalDate}
							${part3List.get(5).day}</p>
						<p
							style="text-align: center; color: white; font-size: 20px; line-height: 1.9;">${part3List.get(6).finalDate}
							${part3List.get(6).day}</p>
						<p
							style="text-align: center; color: white; font-size: 20px; line-height: 1.9;">${part3List.get(7).finalDate}
							${part3List.get(7).day}</p>

					</div>
				</td>


				<td>
					<div class="dailyTempC">
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.5;">Sıcaklık</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.6;">${part3List.get(1).maxtempC}°
							/ ${part3List.get(1).mintempC}°</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.6;">${part3List.get(2).maxtempC}°
							/ ${part3List.get(2).mintempC}°</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.6;">${part3List.get(3).maxtempC}°
							/ ${part3List.get(3).mintempC}°</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.5;">${part3List.get(4).maxtempC}°
							/ ${part3List.get(4).mintempC}°</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.5;">${part3List.get(5).maxtempC}°
							/ ${part3List.get(5).mintempC}°</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.5;">${part3List.get(6).maxtempC}°
							/ ${part3List.get(6).mintempC}°</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.5;">${part3List.get(7).maxtempC}°
							/ ${part3List.get(7).mintempC}°</p>

					</div>
				</td>

				<td>
					<div class="dailyIconandDescription">

						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.5;">Durum</p>
						<p
							style="text-align: center; color: white; font-size: 20px; line-height: 1.9;">
							<img src="${part3List.get(1).modifiedIcon}" width=30px;
								height=30px>${part3List.get(1).lang_tr}</p>
						<p
							style="text-align: center; color: white; font-size: 20px; line-height: 1.9;">
							<img src="${part3List.get(2).modifiedIcon}" width=30px;
								height=30px>${part3List.get(2).lang_tr}</p>
						<p
							style="text-align: center; color: white; font-size: 20px; line-height: 1.9;">
							<img src="${part3List.get(3).modifiedIcon}" width=30px;
								height=30px>${part3List.get(3).lang_tr}</p>
						<p
							style="text-align: center; color: white; font-size: 20px; line-height: 1.9;">
							<img src="${part3List.get(4).modifiedIcon}" width=30px;
								height=30px>${part3List.get(4).lang_tr}</p>
						<p
							style="text-align: center; color: white; font-size: 20px; line-height: 1.9;">
							<img src="${part3List.get(5).modifiedIcon}" width=30px;
								height=30px>${part3List.get(5).lang_tr}</p>
						<p
							style="text-align: center; color: white; font-size: 20px; line-height: 1.9;">
							<img src="${part3List.get(6).modifiedIcon}" width=30px;
								height=30px>${part3List.get(6).lang_tr}</p>
						<p
							style="text-align: center; color: white; font-size: 20px; line-height: 1.9;">
							<img src="${part3List.get(7).modifiedIcon}" width=30px;
								height=30px>${part3List.get(7).lang_tr}</p>



					</div>
				</td>

				<td>
					<div class="dailyHumidity">

						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.2;">Nem</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.6;">%${part3List.get(1).humidity}</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.6;">%${part3List.get(2).humidity}</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.6;">%${part3List.get(3).humidity}</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.6;">%${part3List.get(4).humidity}</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.6;">%${part3List.get(5).humidity}</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.6;">%${part3List.get(6).humidity}</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.6;">%${part3List.get(7).humidity}</p>
					</div>
				</td>


				<td>
					<div class="dailyChanceofRain">

						<p title="Yağmur Olasılığı"
							style="text-align: center; color: white; font-size: 25px; line-height: 1.2;">YO</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.6;">${part3List.get(1).chanceofrain}</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.6;">${part3List.get(2).chanceofrain}</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.6;">${part3List.get(3).chanceofrain}</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.6;">${part3List.get(4).chanceofrain}</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.6;">${part3List.get(5).chanceofrain}</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.6;">${part3List.get(6).chanceofrain}</p>
						<p
							style="text-align: center; color: white; font-size: 25px; line-height: 1.6;">${part3List.get(7).chanceofrain}</p>
					</div>
				</td>


			</table>
		</div>

		<div id="divSecim520Harita"
			style="margin-left: 180px; margin-top: 30px;">
			<img src="${contextPath}/resources/images/harita2.gif" alt=""
				ismap="ismap" usemap="#turkiyeMap"
				style="width: 1040px; height: 500px;">
		</div>
	</div>
	
	<div  class="footer";
		style="width: 100%; text-align:center; background-color:rgba(46, 184, 184, 0.4); border: 1px solid white; padding:8px; color:white; font-family: Georgia; font-size: 25px;">
		
		<p><img src="${contextPath}/resources/images/mgm-logo.svg" width=30px; height=30px;><a href="https://www.mgm.gov.tr/">Meteoroloji Genel Müdürlüğü</a></p>
		<p><img src="${contextPath}/resources/images/logo_footer.png" width=30px; height=30px;><a href="https://www.worldweatheronline.com/">World Weather Online</a></p>
		<p></p>
	</div>

	<map id="turkiyeMap" name="turkiyeMap">
		<area href="?sehir=Adana" title="ADANA" shape="poly" alt=""
			coords="516,400,494,388,506,380,484,342,506,314,530,314,530,300,566,272,566,316,556,316,542,352,554,354,552,370">
		<area href="?sehir=Adıyaman" title="ADIYAMAN" shape="poly" alt=""
			coords="670,332,630,320,636,302,668,290,678,278,704,286,722,278,710,306">
		<area href="?sehir=Afyonkarahisar" title="AFYONKARAHİSAR" shape="poly"
			alt=""
			coords="226,310,214,308,208,296,228,282,214,262,250,212,278,218,294,210,316,224,312,250,296,270,286,262,248,286">
		<area href="?sehir=Ağrı" title="AĞRI" shape="poly" alt=""
			coords="924,184,928,192,912,208,890,176,892,168,880,150,928,134,942,146,978,150,1000,140,996,166,978,172,964,178,958,188,944,176">
		<area href="?sehir=Aksaray" title="AKSARAY" shape="poly" alt=""
			coords="444,298,412,302,398,282,406,262,416,268,426,254,436,228,464,272">
		<area href="?sehir=Amasya" title="AMASYA" shape="poly" alt=""
			coords="536,126,514,142,520,126,506,114,496,112,500,88,540,102,558,94,568,106,566,118">
		<area href="?sehir=Ankara" title="ANKARA" shape="poly" alt=""
			coords="400,188,416,212,404,228,388,214,362,232,338,230,330,218,338,210,330,176,314,160,278,152,292,138,320,142,364,112,398,136,408,132,424,142,420,160,406,164">
		<area href="?sehir=Antalya" title="ANTALYA" shape="poly" alt=""
			coords="362,434,348,422,334,400,262,372,242,420,236,414,204,422,180,406,204,382,212,356,236,344,268,350,272,340,294,340,316,342,356,380">
		<area href="?sehir=Ardahan" title="ARDAHAN" shape="poly" alt=""
			coords="902,80,902,92,888,92,872,80,882,54,880,42,890,32,924,58">
		<area href="?sehir=Artvin" title="ARTVİN" shape="poly" alt=""
			coords="846,96,832,100,826,106,824,96,814,88,826,70,816,56,828,40,846,46,880,40,880,56,872,78,854,78">
		<area href="?sehir=Tire" title="AYDIN" shape="poly" alt=""
			coords="102,326,88,318,76,330,70,332,70,314,58,306,74,302,82,288,142,284,152,286,162,312,148,328,134,320">
		<area href="?sehir=Balikesir" title="BALIKESİR" shape="poly" alt=""
			coords="156,212,134,218,122,198,94,192,72,194,58,204,48,198,72,178,52,178,70,162,94,164,100,142,104,128,108,106,142,126,134,132,136,152,176,186">
		<area href="?sehir=Bartin" title="BARTIN" shape="poly" alt=""
			coords="382,56,354,70,344,52,378,32">
		<area href="?sehir=Batman" title="BATMAN" shape="poly" alt=""
			coords="844,286,868,302,848,314,834,314,824,304,830,276,826,262,840,244,846,244,858,266">
		<area href="?sehir=Bayburt" title="BAYBURT" shape="poly" alt=""
			coords="794,136,780,148,756,148,744,160,736,152,748,138,752,114,782,114">
		<area href="?sehir=Bilecik" title="BİLECİK" shape="poly" alt=""
			coords="262,150,248,170,238,170,232,178,218,174,220,150,220,132,230,122,256,132">
		<area href="?sehir=Bingol" title="BİNGÖL" shape="poly" alt=""
			coords="822,238,806,248,790,244,782,254,770,244,784,234,778,222,776,204,758,216,760,200,788,180,798,188,820,184,826,202,836,206,826,214">
		<area href="?sehir=Bitlis" title="BİTLİS" shape="poly" alt=""
			coords="910,246,916,282,910,286,886,266,874,270,862,266,850,242,870,236,870,228,886,216,912,208,926,212">
		<area href="?sehir=Bolu" title="BOLU" shape="poly" alt=""
			coords="364,112,326,138,296,138,282,152,268,150,258,134,282,114,304,114,328,90,348,90">
		<area href="?sehir=Burdur" title="BURDUR" shape="poly" alt=""
			coords="208,368,198,364,192,370,188,362,202,334,200,322,220,308,230,310,232,318,242,308,274,342,268,348,242,344,216,354">
		<area href="?sehir=Bursa" title="BURSA" shape="poly" alt=""
			coords="214,168,204,162,182,182,138,152,138,134,148,126,184,128,232,120,222,132">
		<area href="?sehir=Canakkale" title="ÇANAKKALE" shape="poly" alt=""
			coords="104,132,96,162,76,164,56,178,24,178,28,162,10,134,74,98,74,118">
		<area href="?sehir=Çankırı" title="ÇANKIRI" shape="poly" alt=""
			coords="440,146,428,142,412,132,402,136,364,108,392,92,408,94,426,90,426,100,440,102">
		<area href="?sehir=Çorum" title="ÇORUM" shape="poly" alt=""
			coords="500,162,450,166,440,144,444,104,458,98,450,90,464,74,490,78,500,90,496,108,518,122,514,142,502,148">
		<area href="?sehir=Denizli" title="DENİZLİ" shape="poly" alt=""
			coords="218,264,228,284,214,296,218,312,202,320,204,334,184,368,174,362,176,354,156,340,152,326,164,312,154,288,164,276,194,274">
		<area href="?sehir=Diyarbakır" title="DİYARBAKIR" shape="poly" alt=""
			coords="760,324,762,298,750,302,720,290,718,280,724,268,740,270,782,252,790,246,812,246,828,234,842,248,828,258,824,304,814,310,806,304,800,312">
		<area href="?sehir=Duzce" title="DÜZCE" shape="poly" alt=""
			coords="286,90,302,86,328,92,306,114,286,114,278,104">
		<area href="?sehir=Edirne" title="EDİRNE" shape="poly" alt=""
			coords="64,76,68,98,58,104,34,104,28,94,46,76,46,60,62,52,66,42,50,26,68,12,84,12,82,58">
		<area href="?sehir=Elazıg" title="ELAZIĞ" shape="poly" alt=""
			coords="758,216,776,210,784,236,772,246,778,252,746,268,730,270,674,258,694,226,732,236">
		<area href="?sehir=Erzincan" title="ERZİNCAN" shape="poly" alt=""
			coords="770,150,794,180,782,186,774,178,740,186,698,202,690,214,676,214,674,186,674,164,698,148,730,160,744,160">
		<area href="?sehir=Erzurum" title="ERZURUM" shape="poly" alt=""
			coords="864,122,892,146,880,150,892,172,878,192,852,200,842,188,826,192,822,184,800,186,774,150,794,142,788,116,820,86,826,104,850,98,856,76,866,78,890,90,888,110">
		<area href="?sehir=Eskisehir" title="ESKİŞEHİR" shape="poly" alt=""
			coords="332,216,316,224,300,210,278,220,254,212,234,178,248,170,264,150,288,154,320,160,330,178">
		<area href="?sehir=Gaziantep" title="GAZİANTEP" shape="poly" alt=""
			coords="664,372,638,382,610,362,588,378,580,370,582,354,600,342,612,346,634,334,632,322,664,330,652,344">
		<area href="?sehir=Giresun" title="GİRESUN" shape="poly" alt=""
			coords="696,150,688,158,664,140,658,120,650,110,658,90,692,90,706,84,708,96,692,118,704,128">
		<area href="?sehir=Gümüşhane" title="GÜMÜŞHANE" shape="poly" alt=""
			coords="754,116,738,158,702,150,706,132,692,118,710,98,736,112,744,104">
		<area href="?sehir=Hakkari" title="HAKKARİ" shape="poly" alt=""
			coords="1032,314,1008,332,1004,318,994,316,980,326,954,316,956,294,990,280,990,288,1006,274,1018,278">
		<area href="?sehir=Hatay" title="HATAY" shape="poly" alt=""
			coords="556,366,582,370,588,378,584,400,590,416,576,422,562,446,550,438,540,412,562,394,554,372">
		<area href="?sehir=Igdır" title="IĞDIR" shape="poly" alt=""
			coords="980,126,998,140,984,150,946,146,932,132,946,124">
		<area href="?sehir=Isparta" title="ISPARTA" shape="poly" alt=""
			coords="294,340,272,342,246,308,232,316,232,304,286,262,316,292,302,302,296,320">
		<area href="?sehir=İstanbul" title="İSTANBUL" shape="poly" alt=""
			coords="230,80,206,88,196,98,184,84,168,88,134,82,132,66,144,48,184,68">
		<area href="?sehir=İzmir" title="İZMIR" shape="poly" alt=""
			coords="140,286,86,286,72,300,72,286,50,270,42,276,28,264,34,236,50,256,64,256,52,238,70,222,60,222,62,200,76,192,94,192,92,214,80,228,84,246,112,266,118,258">
		<area href="?sehir=Kahramanmaraş" title="KAHRAMANMARAŞ" shape="poly"
			alt=""
			coords="638,304,630,318,636,320,636,330,614,346,602,340,590,348,580,338,568,340,568,318,568,290,590,260,620,260,630,268,638,278">
		<area href="?sehir=Karabük" title="KARABÜK" shape="poly" alt=""
			coords="390,96,368,108,352,92,344,90,352,70,384,56,394,62,386,78">
		<area href="?sehir=Karaman" title="KARAMAN" shape="poly" alt=""
			coords="398,400,362,412,360,382,374,368,368,362,388,332,402,336,422,320,432,336,442,346,436,362,394,380">
		<area href="?sehir=Kars" title="KARS" shape="poly" alt=""
			coords="948,124,932,134,894,144,870,124,888,110,890,94,904,94,902,82,924,60,940,74,938,98">
		<area href="?sehir=Kastamonu" title="KASTAMONU" shape="poly" alt=""
			coords="462,76,450,92,456,102,442,108,428,104,428,92,394,94,386,80,400,62,382,54,382,34,408,26,458,28,454,46,472,46,464,58">
		<area href="?sehir=Kayseri" title="KAYSERİ" shape="poly" alt=""
			coords="588,262,568,290,564,274,532,300,530,312,510,312,508,290,490,272,500,256,494,244,494,230,504,236,534,212,570,222,582,216,598,228,586,244">
		<area href="?sehir=Kirikkale" title="KIRIKKALE" shape="poly" alt=""
			coords="444,180,410,206,402,190,410,168,422,162,424,140,438,146,450,164">
		<area href="?sehir=Kirklareli" title="KIRKLARELİ" shape="poly" alt=""
			coords="140,44,118,52,106,68,90,58,84,10,96,4,110,16,136,16">
		<area href="?sehir=Kırşehir" title="KIRŞEHİR" shape="poly" alt=""
			coords="476,216,452,246,440,230,416,214,414,202,444,180,464,188">
		<area href="?sehir=Kilis" title="KİLİS" shape="poly" alt=""
			coords="638,384,618,398,590,382,590,376,614,360">
		<area href="?sehir=Kocaeli" title="KOCAELİ" shape="poly" alt=""
			coords="228,122,206,124,210,112,226,104,198,96,232,78,242,80,250,72,248,100">
		<area href="?sehir=Konya" title="KONYA" shape="poly" alt=""
			coords="462,346,438,362,444,344,426,322,404,336,394,332,370,362,374,372,362,380,318,342,298,338,300,306,318,294,296,268,310,256,318,228,330,216,338,228,368,228,386,216,408,228,416,216,440,232,420,268,408,262,400,280,412,300,446,300,464,314">
		<area href="?sehir=Kütahya" title="KÜTAHYA" shape="poly" alt=""
			coords="252,210,226,242,218,226,176,238,162,212,180,182,204,166,218,164,218,172,238,176">
		<area href="?sehir=Malatya" title="MALATYA" shape="poly" alt=""
			coords="676,258,720,268,722,278,706,286,680,280,670,290,640,300,638,276,620,254,632,244,628,228,638,224,680,214,692,214,692,230">
		<area href="?sehir=Manisa" title="MANİSA" shape="poly" alt=""
			coords="162,276,150,286,138,284,122,258,114,268,88,246,82,228,94,216,96,194,120,196,138,214,160,212,176,236,164,246">
		<area href="?sehir=Mardin" title="MARDİN" shape="poly" alt=""
			coords="860,342,838,346,818,344,782,360,764,326,802,312,806,300,814,310,826,308,838,312,854,314,868,304,858,326">
		<area href="?sehir=Mersin" title="MERSİN" shape="poly" alt=""
			coords="490,390,480,382,442,418,436,414,418,430,394,430,366,432,364,412,396,402,396,380,442,360,466,346,484,340,506,378">
		<area href="?sehir=Mugla" title="MUĞLA" shape="poly" alt=""
			coords="180,412,164,400,166,380,160,384,154,388,134,370,110,388,114,378,76,378,126,360,72,356,74,344,86,344,80,332,90,320,104,326,136,324,154,328,154,340,174,352,174,362,198,366,206,364,194,392,182,402">
		<area href="?sehir=Muş" title="MUŞ" shape="poly" alt=""
			coords="912,210,888,214,872,228,872,234,844,246,836,236,830,236,826,228,834,208,828,204,826,194,846,190,856,198,880,194,892,174">
		<area href="?sehir=Nevşehir" title="NEVŞEHIR" shape="poly" alt=""
			coords="492,236,494,250,502,256,494,274,468,276,454,246,478,216,478,206,486,210">
		<area href="?sehir=Niğde" title="NİĞDE" shape="poly" alt=""
			coords="508,316,486,340,466,350,466,312,446,296,470,270,496,278,508,292">
		<area href="?sehir=Ordu" title="ORDU" shape="poly" alt=""
			coords="652,94,650,108,656,120,650,120,648,130,632,130,636,118,616,120,616,110,596,110,580,96,602,80,626,88,634,80">
		<area href="?sehir=Osmaniye" title="OSMANİYE" shape="poly" alt=""
			coords="576,372,556,364,556,356,544,356,558,316,566,318,566,340,582,340,590,348,582,356">
		<area href="?sehir=Rize" title="RİZE" shape="poly" alt=""
			coords="816,56,826,68,816,88,788,114,780,114,776,98,770,86,786,76">
		<area href="?sehir=Adapazari" title="SAKARYA" shape="poly" alt=""
			coords="288,92,280,104,284,114,258,136,234,122,250,98,252,74">
		<area href="?sehir=Samsun" title="SAMSUN" shape="poly" alt=""
			coords="600,80,580,96,566,100,560,92,542,102,500,88,490,78,500,70,514,76,514,68,524,50,540,44,548,50,548,60,568,72,572,68">
		<area href="?sehir=Siirt" title="SİİRT" shape="poly" alt=""
			coords="904,296,888,308,872,308,872,300,848,286,860,266,884,268,908,280,914,280,922,284,922,292">
		<area href="?sehir=Sinop" title="SİNOP" shape="poly" alt=""
			coords="522,54,512,76,504,70,488,74,468,74,466,62,474,48,458,48,462,28,484,28,496,16,504,22,500,32">
		<area href="?sehir=Sivas" title="SİVAS" shape="poly" alt=""
			coords="678,216,630,224,632,240,622,260,590,260,590,238,600,228,586,216,568,224,540,210,556,186,550,166,574,164,588,146,610,144,618,148,634,128,646,130,654,120,668,142,684,154,676,168">
		<area href="?sehir=Şanlıurfa" title="ŞANLIURFA" shape="poly" alt=""
			coords="782,362,736,382,706,382,692,372,668,372,654,346,664,334,710,308,718,290,754,302,760,298,764,322">
		<area href="?sehir=Sirnak" title="ŞIRNAK" shape="poly" alt=""
			coords="958,294,948,314,932,320,926,314,912,336,902,340,896,324,862,344,864,322,872,304,888,304,910,292,922,296,924,284">
		<area href="?sehir=Tekirdağ" title="TEKİRDAĞ" shape="poly" alt=""
			coords="144,52,136,62,130,82,104,84,92,104,78,106,76,98,70,100,70,94,66,74,88,54,106,64,120,54">
		<area href="?sehir=Tokat" title="TOKAT" shape="poly" alt=""
			coords="634,124,632,136,622,146,590,146,572,166,554,166,550,166,544,154,534,156,518,144,534,126,558,118,568,118,570,102,586,96,606,108,612,108,616,118">
		<area href="?sehir=Trabzon" title="TRABZON" shape="poly" alt=""
			coords="770,84,782,110,754,112,746,102,738,114,710,100,708,84,720,78,752,86">
		<area href="?sehir=Tunceli" title="TUNCELİ" shape="poly" alt=""
			coords="758,216,732,238,700,228,688,220,700,206,720,192,760,180,776,180,778,186,762,200">
		<area href="?sehir=Uşak" title="UŞAK" shape="poly" alt=""
			coords="212,270,194,276,166,276,162,248,182,234,216,230,228,246">
		<area href="?sehir=Van" title="VAN" shape="poly" alt=""
			coords="998,280,992,286,988,282,956,294,922,286,914,252,932,216,918,208,930,196,926,190,942,178,960,190,964,180,984,172,998,238,1010,240">
		<area href="?sehir=Yalova" title="YALOVA" shape="poly" alt=""
			coords="212,114,206,128,178,128,156,116,176,104">
		<area href="?sehir=Yozgat" title="YOZGAT" shape="poly" alt=""
			coords="538,216,504,238,492,210,480,212,466,190,448,180,450,172,500,160,504,148,522,142,534,156,542,152,556,184">
		<area href="?sehir=Zonguldak" title="ZONGULDAK" shape="poly" alt=""
			coords="342,56,352,70,344,88,324,94,302,90,308,70">
		<area href="http://kktcmeteor.org/" title="K.K.T.C." target="_blank"
			shape="poly" alt=""
			coords="384,464,412,470,426,468,448,456,476,442,442,474,442,482,430,488,410,488,406,480,378,486">
	</map>






	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>



