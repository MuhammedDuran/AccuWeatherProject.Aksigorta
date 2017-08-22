package com.hellokoding.account.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.xml.transform.Templates;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.hellokoding.account.model.weather.HavaDurumu;
import com.hellokoding.account.model.weather.HavaDurumuDataCurrentCondition;
import com.hellokoding.account.model.weather.HavaDurumuDataWeather;
import com.hellokoding.account.model.weather.HavaDurumuDataWeatherHourly;
import com.hellokoding.account.web.UserController;
import com.hellokoding.account.model.weather.view.Part1;
import com.hellokoding.account.model.weather.view.Part2;
import com.hellokoding.account.model.weather.view.Part3;
import com.hellokoding.account.model.weather.view.Part4;
import com.hellokoding.account.model.weather.view.Part5;
import com.hellokoding.account.webservice.WebserviceProvide;

@Controller
@SessionAttributes("user")
public class WeatherContoller {

	

	@RequestMapping(value = "/Türkiye", method = RequestMethod.GET)
	public String goToService(@RequestParam Map<String, String> params, Model model) {

		String sehir = params.get("sehir");
		String query = null;

		String weatherUrl = "http://api.worldweatheronline.com/premium/v1/weather.ashx?key=29d33f7edae345daaed70640172407&q="
				+ sehir + "&tp=3&format=json&lang=tr";

		System.out.println(sehir);
		// System.out.println("weatherurl : " + weatherUrl);

		try {
			String json = WebserviceProvide.getJSONFromUrl(weatherUrl);
			Gson gson = new GsonBuilder().create();
			System.out.println(json);
			HavaDurumu havaDurumu = gson.fromJson(json, HavaDurumu.class);
			model.addAttribute("part1", createCurrent(havaDurumu)); // String attributeName, Object attributeName
			model.addAttribute("part2List", createHourly(havaDurumu)); // String attributeName, Object attributeName
			model.addAttribute("part3List", createDaily(havaDurumu)); // String attributeName, Object attributeName
			model.addAttribute("sehir", sehir);
			model.addAttribute("sehirModified", modifySehir(sehir));
			 model.addAttribute("part4List", createMarquee1(havaDurumu));
			 model.addAttribute("part5List", createMarquee2(havaDurumu));

		} catch (Exception e) {
			System.out.println("HATA!!" + e.getMessage());
		}

		return "welcome";
	}

	private String modifySehir(String sehir) {
		String modifiedSehir = null;
		if (StringUtils.equals(sehir, "Tire")) {
			modifiedSehir = "Aydýn,	 Türkiye";
		} else {
			modifiedSehir = sehir + ",	Türkiye";
		}
		return modifiedSehir;

	}

	// private String modifyQuery(String query) {
	//
	// String SubStr1 = new String(",");
	// String modifiedQuery = new String (query.substring(0,
	// query.indexOf(SubStr1)));
	//
	// return modifiedQuery;
	// }

	private int saat;

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
		part1.setWinddir16Point(havaDurumuDataCurrentCondition.getWinddir16Point());
		part1.setWeatherCode(havaDurumuDataCurrentCondition.getWeatherCode());
		part1.setIcon(havaDurumuDataCurrentCondition.getWeatherIconUrl().get(0).getValue());
		// part1.setValue(havaDurumuDataCurrentCondition.getWeatherIconUrl().get(0).getValue());
		part1.setLang_tr(havaDurumuDataCurrentCondition.getLang_tr().get(0).getValue());

		// System.out.println("Observation time : " + part1.getObservation_time());
		// System.out.println("City : " + part1.getQuery());
		// System.out.println("TempC : " + part1.getTemp_C());
		// System.out.println("TempF : " + part1.getTemp_F());
		// System.out.println("FeelsLikeC : " + part1.getFeelsLikeC());
		// System.out.println("Humidity : " + part1.getHumidity());
		// System.out.println("Pressure : " + part1.getPressure());
		// System.out.println("WindspeedKmph : " + part1.getWindspeedKmph());
		// System.out.println(part1.getIcon());
		// System.out.println("Weather description : " + part1.getLang_tr());

		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm:ss	dd/MM/yyyy");
		LocalDateTime now = LocalDateTime.now();
		saat = now.getHour();
		System.out.println("saat:  " + saat);
		System.out.println(dtf.format(now));// anlýk zamaný yazdýrýr.

		if (saat >= 6 && saat <= 21) {
			part1.setModifiedIcon("https://cdn.worldweatheronline.net/images/weather/small/" + part1.getWeatherCode()
					+ "_day_sm.png");
		} else {
			part1.setModifiedIcon("https://cdn.worldweatheronline.net/images/weather/small/" + part1.getWeatherCode()
					+ "_night_sm.png");
		}

		return part1;
	}

	private List<Part2> createHourly(HavaDurumu havaDurumu) {

		List<Part2> part2List = new ArrayList<Part2>();

		for (int i = 0; i < 8; i++) {

			Part2 part2 = new Part2();

			HavaDurumuDataWeatherHourly havaDurumuDataWeatherHourly = havaDurumu.getData().getWeather().get(0)
					.getHourly().get(i);

			part2.setTime(havaDurumuDataWeatherHourly.getTime());
			part2.setTempC(havaDurumuDataWeatherHourly.getTempC());
			part2.setHumidity(havaDurumuDataWeatherHourly.getHumidity());
			part2.setChanceofrain(havaDurumuDataWeatherHourly.getChanceofrain());
			part2.setIcon(havaDurumuDataWeatherHourly.getWeatherIconUrl().get(0).getValue());
			part2.setWeatherCode(havaDurumuDataWeatherHourly.getWeatherCode());
			part2.setLang_tr(havaDurumuDataWeatherHourly.getLang_tr().get(0).getValue());

			part2.setCor(Integer.parseInt(part2.getChanceofrain()));
			 System.out.println(part2.getCor());
			// System.out.println(part2.getModifiedIcon());

			switch (havaDurumuDataWeatherHourly.getTime()) {
			case "0":
				part2.setTime("00:00");
				part2.setModifiedIcon("https://cdn.worldweatheronline.net/images/weather/small/"
						+ part2.getWeatherCode() + "_night_sm.png");
				break;
			case "300":
				part2.setTime("03:00");
				part2.setModifiedIcon("https://cdn.worldweatheronline.net/images/weather/small/"
						+ part2.getWeatherCode() + "_night_sm.png");
				break;
			case "600":
				part2.setTime("06:00");
				part2.setModifiedIcon("https://cdn.worldweatheronline.net/images/weather/small/"
						+ part2.getWeatherCode() + "_day_sm.png");
				break;
			case "900":
				part2.setTime("09:00");
				part2.setModifiedIcon("https://cdn.worldweatheronline.net/images/weather/small/"
						+ part2.getWeatherCode() + "_day_sm.png");
				break;
			case "1200":
				part2.setTime("12:00");
				part2.setModifiedIcon("https://cdn.worldweatheronline.net/images/weather/small/"
						+ part2.getWeatherCode() + "_day_sm.png");
				break;
			case "1500":
				part2.setTime("15:00");
				part2.setModifiedIcon("https://cdn.worldweatheronline.net/images/weather/small/"
						+ part2.getWeatherCode() + "_day_sm.png");
				break;
			case "1800":
				part2.setTime("18:00");
				part2.setModifiedIcon("https://cdn.worldweatheronline.net/images/weather/small/"
						+ part2.getWeatherCode() + "_day_sm.png");
				break;
			case "2100":
				part2.setTime("21:00");
				part2.setModifiedIcon("https://cdn.worldweatheronline.net/images/weather/small/"
						+ part2.getWeatherCode() + "_night_sm.png");
				break;
			}

			// System.out.println("Time : " + part2.getTime());
			// System.out.println("TempC: " + part2.getTempC());
			// System.out.println("Chance of rain: " + part2.getChanceofrain());
			// System.out.println("Weather Description: " + part2.getLang_tr());

			part2List.add(part2);
		}

		return part2List;

	}

	private List<Part3> createDaily(HavaDurumu havaDurumu) throws ParseException {

		List<Part3> part3List = new ArrayList<Part3>();

		for (int i = 0; i < 8; i++) {
			Part3 part3 = new Part3();
			int j;

			HavaDurumuDataWeather havaDurumuDataWeather = havaDurumu.getData().getWeather().get(i);

			part3.setDate(havaDurumuDataWeather.getDate());
			part3.setMaxtempC(havaDurumuDataWeather.getMaxtempC());
			part3.setMintempC(havaDurumuDataWeather.getMintempC());

			SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
			Date MyDate = format1.parse(havaDurumuDataWeather.getDate());
			Date MyDay = format2.parse(havaDurumuDataWeather.getDate());
			format1.applyPattern("dd.MM.yyyy");
			format2.applyPattern("EEEE");
			part3.setFinalDate(format1.format(MyDate));
			part3.setDay(format2.format(MyDay));

			for (j = 0; j < 8; j++) {

				part3.setHumidity(havaDurumuDataWeather.getHourly().get(j).getHumidity());
				part3.setChanceofrain(havaDurumuDataWeather.getHourly().get(j).getChanceofrain());
				part3.setIcon(havaDurumuDataWeather.getHourly().get(4).getWeatherIconUrl().get(0).getValue());
				part3.setWeatherCode(havaDurumuDataWeather.getHourly().get(4).getWeatherCode());
				part3.setLang_tr(havaDurumuDataWeather.getHourly().get(4).getLang_tr().get(0).getValue());
				part3.setModifiedIcon("https://cdn.worldweatheronline.net/images/weather/small/"
						+ part3.getWeatherCode() + "_day_sm.png");
				// switch (j) {
				// case 0:
				//// System.out.println("Gece nem oraný: " + part3.getHumidity());
				//// System.out.println("Gece yaðýþ ihtimali: " + part3.getChanceofrain());
				//// System.out.println("Durum: " + part3.getLang_tr());
				// break;
				// case 4:
				// System.out.println("Gündüz nem oraný: " + part3.getHumidity());
				// System.out.println("Gündüz yaðýþ ihtimali: " + part3.getChanceofrain());
				// System.out.println("Durum: " + part3.getLang_tr());
				// break;
				// }
			}
			// System.out.println("");
			// System.out.println("Tarih: " + part3.getFinalDate());
			// System.out.println("Max TempC: " + part3.getMaxtempC());
			// System.out.println("Min TempC: " + part3.getMintempC());

			part3List.add(part3);

		}

		return part3List;
	}

	private List<Part4> createMarquee1(HavaDurumu havaDurumu) {

		List<Part4> part4List = new ArrayList<Part4>();

		String[] marqueeCities1 = new String[] { "Ýstanbul", "Ankara", "Ýzmir", "Bursa", "Antalya", "Adana", "Konya", "Gaziantep",
												"Þanlýurfa", "Kocaeli", "Mersin", "Diyarbakýr", "Hatay", "Manisa", "Kayseri",
												"Samsun", "Balikesir", "Kahramanmaraþ","Van", "Tire", "Denizli", "Adapazari",
												"Tekirdað", "Mugla", "Eskisehir", "Mardin","Malatya", "Trabzon", "Erzurum", "Tokat" };

		for (int i = 0; i < marqueeCities1.length; i++) {
			Part4 part4 = new Part4();

			String[] marqueeUrl1 = new String[marqueeCities1.length];
			marqueeUrl1[i] = "http://api.worldweatheronline.com/premium/v1/weather.ashx?key=29d33f7edae345daaed70640172407&q="
					+ marqueeCities1[i] + "&tp=3&format=json&lang=tr";

			part4.setmCity(marqueeCities1[i]);
			
			if(UserController.marqueeControl==true) {
				
				
				try {
					String json1 = WebserviceProvide.getJSONFromUrl(marqueeUrl1[i]);
					Gson gson1 = new GsonBuilder().create();
					// System.out.println(json1);
					havaDurumu = gson1.fromJson(json1, HavaDurumu.class);
					part4.setTemp_C(havaDurumu.getData().getCurrent_condition().get(0).getTemp_C());
					UserController.mTemp1[i] = part4.getTemp_C();
				}

				// part4.setTemp_C(mTemp[i]);

				catch (Exception e) {
					System.out.println("HATA!!" + e.getMessage());
				}
			
			}
			
			part4.setTemp_C(UserController.mTemp1[i]);
			part4List.add(part4);
//			System.out.println("Sýcaklýk 1 " +  part4List.get(0).getTemp_C());
//			System.out.println("Sýcaklýk 2 " + part4.getTemp_C());
		}
		return part4List;
	}

	private List<Part5> createMarquee2(HavaDurumu havaDurumu) {

		List<Part5> part5List = new ArrayList<Part5>();

		String[] marqueeCities2 = new String[] { "Baku", "Astana", "Aþgabat",
				 "Toshkent", "Bishkek", "Nicosia" };

		for (int i = 0; i < marqueeCities2.length; i++) {
			Part5 part5 = new Part5();

			String[] marqueeUrl2 = new String[marqueeCities2.length];
			marqueeUrl2[i] = "http://api.worldweatheronline.com/premium/v1/weather.ashx?key=29d33f7edae345daaed70640172407&q="
					+ marqueeCities2[i] + "&tp=3&format=json&lang=tr";

			part5.setmCity(marqueeCities2[i]);
			
			if(UserController.marqueeControl==true) {
				
				
				try {
					String json2 = WebserviceProvide.getJSONFromUrl(marqueeUrl2[i]);
					Gson gson2 = new GsonBuilder().create();
					// System.out.println(json1);
					havaDurumu = gson2.fromJson(json2, HavaDurumu.class);
					part5.setTemp_C(havaDurumu.getData().getCurrent_condition().get(0).getTemp_C());
					UserController.mTemp2[i] = part5.getTemp_C();
				}

				// part4.setTemp_C(mTemp[i]);

				catch (Exception e) {
					System.out.println("HATA!!" + e.getMessage());
				}
			
			}
			
			part5.setTemp_C(UserController.mTemp2[i]);
			part5List.add(part5);
//			System.out.println("Sýcaklýk 1 " +  part5List.get(0).getTemp_C());
//			System.out.println("Sýcaklýk 2 " + part5.getTemp_C());
		}
		UserController.marqueeControl = false;
		return part5List;
	}

}

