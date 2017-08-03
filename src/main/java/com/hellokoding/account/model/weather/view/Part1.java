package com.hellokoding.account.model.weather.view;  //anlýk verilerin alýndýðý  sýnýf

import java.time.LocalTime;


public class Part1 {
	
	private String observation_time;
	private String query;
	private LocalTime time;
	private String temp_C;
	private String temp_F;
	private String FeelsLikeC;
	private String humidity;
	private String pressure;
	private String windspeedKmph;
	private String winddirDegree;
	private String winddir16Point;
	private String weatherCode;
	private String icon;
	private String weather_Description;
	private String value;
	
	
	
	public String getObservation_time() {
		return observation_time;
	}
	public void setObservation_time(String observation_time) {
		this.observation_time = observation_time;
	}
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	public LocalTime getTime() {
		return time;
	}
	public void setTime(LocalTime time) {
		this.time = time;
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
	public String getFeelsLikeC() {
		return FeelsLikeC;
	}
	public void setFeelsLikeC(String feelsLikeC) {
		FeelsLikeC = feelsLikeC;
	}
	public String getHumidity() {
		return humidity;
	}
	public void setHumidity(String humidity) {
		this.humidity = humidity;
	}
	public String getPressure() {
		return pressure;
	}
	public void setPressure(String pressure) {
		this.pressure = pressure;
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
	public String getWeatherCode() {
		return weatherCode;
	}
	public void setWeatherCode(String weatherCode) {
		this.weatherCode = weatherCode;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getWeather_Description() {
		return weather_Description;
	}
	public void setWeather_Description(String weather_Description) {
		this.weather_Description = weather_Description;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	

}
