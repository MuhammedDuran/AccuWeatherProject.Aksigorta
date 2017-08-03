package com.hellokoding.account.model.weather.view; //saatlik verilerin alýndýðý  sýnýf



public class Part2 {
	
	private String date;
	private String time;
	private String tempC;
	private String chanceofrain; //with % percentage
	private String icon;
	private String weather_Description;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getTempC() {
		return tempC;
	}
	public void setTempC(String tempC) {
		this.tempC = tempC;
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
