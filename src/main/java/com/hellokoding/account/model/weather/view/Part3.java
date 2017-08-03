package com.hellokoding.account.model.weather.view; //günlük

import java.time.LocalTime;

public class Part3 {
	

	private String date;
	private String maxtempC;
	private String minTempC;
	private String humidity;
	private String chanceofrain;
	private String icon;
	private String weather_Description;
	private String day;
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getMaxtempC() {
		return maxtempC;
	}
	public void setMaxtempC(String maxtempC) {
		this.maxtempC = maxtempC;
	}
	public String getMinTempC() {
		return minTempC;
	}
	public void setMinTempC(String minTempC) {
		this.minTempC = minTempC;
	}
	public String getHumidity() {
		return humidity;
	}
	public void setHumidity(String humidity) {
		this.humidity = humidity;
	}
	public String getChanceofrain() {
		return chanceofrain;
	}
	public void setChanceofrain(String chanceofrain) {
		this.chanceofrain = chanceofrain;
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
}
