package com.hellokoding.account.model.weather;

import java.util.List;

public class HavaDurumuDataCurrentCondition {
	
	private String observation_time;
	private String temp_C;
	private String temp_F;
	private String weatherCode;
	private List<HavaDurumuDataCurrentConditionWeatherIconUrl> weatherIconUrl;
	private List<HavaDurumuDataCurrentConditionWeatherDesc> weatherDesc;
	private String windspeedMiles;
	private String windspeedKmph;
	private String winddirDegree;
	private String winddir16Point;
	private String precipMM;
	private String humidity;
	private String visibility;
	private String pressure;
	private String cloudcover;
	private String FeelsLikeC;
	private String FeelsLikeF;
	
	
	public String getObservation_time() {
		return observation_time;
	}
	public void setObservation_time(String observation_time) {
		this.observation_time = observation_time;
	}
	public String getTemp_C() {
		return temp_C;
	}
	public void setTemp_C(String temp_C) {
		this.temp_C = temp_C;
	}
	public String getTemp_F() {
		return temp_F;
	}
	public void setTemp_F(String temp_F) {
		this.temp_F = temp_F;
	}
	public String getWeatherCode() {
		return weatherCode;
	}
	public void setWeatherCode(String weatherCode) {
		this.weatherCode = weatherCode;
	}
	public List<HavaDurumuDataCurrentConditionWeatherIconUrl> getWeatherIconUrl() {
		return weatherIconUrl;
	}
	public void setWeatherIconUrl(List<HavaDurumuDataCurrentConditionWeatherIconUrl> weatherIconUrl) {
		this.weatherIconUrl = weatherIconUrl;
	}
	public List<HavaDurumuDataCurrentConditionWeatherDesc> getWeatherDesc() {
		return weatherDesc;
	}
	public void setWeatherDesc(List<HavaDurumuDataCurrentConditionWeatherDesc> weatherDesc) {
		this.weatherDesc = weatherDesc;
	}
	public String getWindspeedMiles() {
		return windspeedMiles;
	}
	public void setWindspeedMiles(String windspeedMiles) {
		this.windspeedMiles = windspeedMiles;
	}
	public String getWindspeedKmph() {
		return windspeedKmph;
	}
	public void setWindspeedKmph(String windspeedKmph) {
		this.windspeedKmph = windspeedKmph;
	}
	public String getWinddirDegree() {
		return winddirDegree;
	}
	public void setWinddirDegree(String winddirDegree) {
		this.winddirDegree = winddirDegree;
	}
	public String getWinddir16Point() {
		return winddir16Point;
	}
	public void setWinddir16Point(String winddir16Point) {
		this.winddir16Point = winddir16Point;
	}
	public String getPrecipMM() {
		return precipMM;
	}
	public void setPrecipMM(String precipMM) {
		this.precipMM = precipMM;
	}
	public String getHumidity() {
		return humidity;
	}
	public void setHumidity(String humidity) {
		this.humidity = humidity;
	}
	public String getVisibility() {
		return visibility;
	}
	public void setVisibility(String visibility) {
		this.visibility = visibility;
	}
	public String getPressure() {
		return pressure;
	}
	public void setPressure(String pressure) {
		this.pressure = pressure;
	}
	public String getCloudcover() {
		return cloudcover;
	}
	public void setCloudcover(String cloudcover) {
		this.cloudcover = cloudcover;
	}
	public String getFeelsLikeC() {
		return FeelsLikeC;
	}
	public void setFeelsLikeC(String feelsLikeC) {
		FeelsLikeC = feelsLikeC;
	}
	public String getFeelsLikeF() {
		return FeelsLikeF;
	}
	public void setFeelsLikeF(String feelsLikeF) {
		FeelsLikeF = feelsLikeF;
	}
	

}
