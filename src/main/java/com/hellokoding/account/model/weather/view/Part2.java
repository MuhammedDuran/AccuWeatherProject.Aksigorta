package com.hellokoding.account.model.weather.view; //saatlik verilerin alýndýðý  sýnýf



public class Part2 {
	
	private String date;
	private String time;
	private String tempC;
	private String chanceofrain; //with % percentage
	private String humidity;
	private String icon;
	private String weather_Description;
	private String lang_tr;
	private String weatherCode;
	private String modifiedIcon;
	private int cor;
	
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
	public String getHumidity() {
		return humidity;
	}
	public void setHumidity(String humidity) {
		this.humidity = humidity;
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
	public String getLang_tr() {
		return lang_tr;
	}
	public void setLang_tr(String lang_tr) {
		this.lang_tr = lang_tr;
	}
	public String getWeatherCode() {
		return weatherCode;
	}
	public void setWeatherCode(String weatherCode) {
		this.weatherCode = weatherCode;
	}
	public int getCor() {
		return cor;
	}
	public void setCor(int cor) {
		this.cor = cor;
	}
	public String getModifiedIcon() {
		return modifiedIcon;
	}
	public void setModifiedIcon(String modifiedIcon) {
		this.modifiedIcon = modifiedIcon;
	}
	
}
