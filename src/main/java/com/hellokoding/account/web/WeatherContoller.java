package com.hellokoding.account.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.hellokoding.account.model.weather.HavaDurumu;
import com.hellokoding.account.model.weather.HavaDurumuDataCurrentCondition;
import com.hellokoding.account.model.weather.HavaDurumuDataWeather;
import com.hellokoding.account.model.weather.HavaDurumuDataWeatherHourly;
import com.hellokoding.account.model.weather.view.Part1;
import com.hellokoding.account.model.weather.view.Part2;
import com.hellokoding.account.model.weather.view.Part3;
import com.hellokoding.account.webservice.WebserviceProvide;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@SessionAttributes("user")
public class WeatherContoller {
	

	@RequestMapping(value = "/getCity", method = RequestMethod.GET)
	public String goToService(@RequestParam Map<String, String> params, Model model) {
		String sehir = params.get("sehir");
		String weatherUrl = "http://api.worldweatheronline.com/premium/v1/weather.ashx?key=29d33f7edae345daaed70640172407&q="
				+ sehir + "&tp=6&format=json";

		System.out.println(sehir);
		System.out.println("weatherurl : " + weatherUrl);
		
		
		try {
			String json = WebserviceProvide.getJSONFromUrl(weatherUrl);
			Gson gson = new GsonBuilder().create();
			System.out.println(json);
			HavaDurumu havaDurumu = gson.fromJson(json, HavaDurumu.class);
			model.addAttribute("part1", createCurrent(havaDurumu)); // String attributeName, Object attributeName
			model.addAttribute("part2List", createHourly(havaDurumu)); // String attributeName, Object attributeName
			model.addAttribute("part3", createDaily(havaDurumu)); // String attributeName, Object attributeName
			model.addAttribute("sehir", sehir);
			model.addAttribute("sehirModified", modifySehir(sehir));
			
		} catch (Exception e) {
			System.out.println("HATA!!"+e.getMessage());
		}

		return "welcome";
	}

	private String modifySehir(String sehir) {
		String modifiedSehir = null;
		if(StringUtils.equals(sehir, "Tire"))
		{
			modifiedSehir = "Aydýn,	 Türkiye";
		}
		else
		{
			modifiedSehir = sehir + ",	Türkiye";
		}
		return modifiedSehir;
	}

	private Part1 createCurrent(HavaDurumu havaDurumu) {
		Part1 part1 = new Part1();

		HavaDurumuDataCurrentCondition havaDurumuDataCurrentCondition = havaDurumu.getData().getCurrent_condition()
				.get(0);
		part1.setObservation_time(havaDurumuDataCurrentCondition.getObservation_time());
		part1.setQuery(havaDurumu.getData().getRequest().get(0).getQuery());
		part1.setTemp_C(havaDurumuDataCurrentCondition.getTemp_C());
		part1.setTemp_F(havaDurumuDataCurrentCondition.getTemp_F());
		part1.setFeelsLikeC(havaDurumuDataCurrentCondition.getFeelsLikeC());
		part1.setHumidity(havaDurumuDataCurrentCondition.getHumidity());
		part1.setPressure(havaDurumuDataCurrentCondition.getPressure());
		part1.setWindspeedKmph(havaDurumuDataCurrentCondition.getWindspeedKmph());
		part1.setWinddirDegree(havaDurumuDataCurrentCondition.getWinddirDegree());
		part1.setIcon(havaDurumuDataCurrentCondition.getWeatherIconUrl().get(0).getValue());
		part1.setValue(havaDurumuDataCurrentCondition.getWeatherIconUrl().get(0).getValue());
		part1.setWeather_Description(havaDurumuDataCurrentCondition.getWeatherDesc().get(0).getValue());

		System.out.println("Observation time : " + part1.getObservation_time());
		System.out.println("City   : " + part1.getQuery());
		System.out.println("TempC  : " + part1.getTemp_C());
		System.out.println("TempF  : " + part1.getTemp_F());
		System.out.println("FeelsLikeC : " + part1.getFeelsLikeC());
		System.out.println("Humidity : " + part1.getHumidity());
		System.out.println("Pressure : " + part1.getPressure());
		System.out.println("WindspeedKmph : " + part1.getWindspeedKmph());
		System.out.println(part1.getIcon());
		System.out.println("Weather description : " + part1.getWeather_Description());

		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm:ss	dd/MM/yyyy");
		LocalDateTime now = LocalDateTime.now();
		System.out.println(dtf.format(now)); // anlýk zamaný yazdýrýr.

		return part1;
	}

	private List<Part2> createHourly(HavaDurumu havaDurumu) {

		List<Part2> part2List = new ArrayList<Part2>();

		for (int i = 0; i < 4; i++) {

			Part2 part2 = new Part2();

			HavaDurumuDataWeatherHourly havaDurumuDataWeatherHourly = havaDurumu.getData().getWeather().get(0)
					.getHourly().get(i);

			part2.setTime(havaDurumuDataWeatherHourly.getTime());
			part2.setTempC(havaDurumuDataWeatherHourly.getTempC());
			part2.setChanceofrain(havaDurumuDataWeatherHourly.getChanceofrain());
			part2.setIcon(havaDurumuDataWeatherHourly.getWeatherIconUrl().get(0).getValue());
			part2.setWeather_Description(havaDurumuDataWeatherHourly.getWeatherDesc().get(0).getValue());

			switch (havaDurumuDataWeatherHourly.getTime()) {
			case "0":
				part2.setTime("00:00");
				break;
			case "600":
				part2.setTime("06:00");
				break;
			case "1200":
				part2.setTime("12:00");
				break;
			case "1800":
				part2.setTime("18:00");
				break;
			}

			System.out.println("Time : 	" + part2.getTime());
			System.out.println("TempC: 	" + part2.getTempC());
			System.out.println("Chance of rain:	" + part2.getChanceofrain());
			System.out.println("Weather Description: 	" + part2.getWeather_Description());

			part2List.add(part2);
		}

		return part2List;

	}

	private Part3 createDaily(HavaDurumu havaDurumu) throws ParseException  {

		Part3 part3 = new Part3();
		
		 

		for  (int i = 1; i < 7; i++) {
			int j;

			HavaDurumuDataWeather havaDurumuDataWeather = havaDurumu.getData().getWeather().get(i);

			part3.setDate(havaDurumuDataWeather.getDate());
			part3.setMaxtempC(havaDurumuDataWeather.getMaxtempC());
			part3.setMinTempC(havaDurumuDataWeather.getMintempC());
			
			  SimpleDateFormat format1=new SimpleDateFormat("yyyy-MM-dd");
			  Date MyDate = format1.parse(havaDurumuDataWeather.getDate());
			  format1.applyPattern("EEEE");
			  String finalDay=format1.format(MyDate);

			for (j = 0; j < 4; j++) {

				part3.setHumidity(havaDurumuDataWeather.getHourly().get(j).getHumidity());
				part3.setChanceofrain(havaDurumuDataWeather.getHourly().get(j).getChanceofrain());
				switch (j) {
				case 0:
					System.out.println("Gece nem oraný:	" + part3.getHumidity());
					System.out.println("Gece yaðýþ ihtimali:  " + part3.getChanceofrain());
					break;
				case 2:
					System.out.println("Gündüz nem oraný:	" + part3.getHumidity());
					System.out.println("Gündüz yaðýþ ihtimali:  " + part3.getChanceofrain());
					break;
				}
			}
			System.out.println("");
			System.out.println("Tarih: " + finalDay + "  " + part3.getDate());
			System.out.println("Max TempC: 	" + part3.getMaxtempC());
			System.out.println("Min TempC: 	" + part3.getMinTempC());
			
			 
              
		}

		return part3;
	}

}
