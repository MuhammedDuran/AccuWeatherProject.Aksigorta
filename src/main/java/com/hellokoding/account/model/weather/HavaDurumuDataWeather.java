package com.hellokoding.account.model.weather;

import java.util.List;

public class HavaDurumuDataWeather {
	
	private String date;
	private List<HavaDurumuDataWeatherAstronomy> astronomy;
	private String maxtempC;
	private String maxtempF;
	private String mintempC;
	private String mintempF;
	private String totalSnow_cm;
	private String sunHour;
	private String uvIndex;
	private List<HavaDurumuDataWeatherHourly> hourly;
	
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public List<HavaDurumuDataWeatherAstronomy> getAstronomy() {
		return astronomy;
	}
	public void setAstronomy(List<HavaDurumuDataWeatherAstronomy> astronomy) {
		this.astronomy = astronomy;
	}
	public String getMaxtempC() {
		return maxtempC;
	}
	public void setMaxtempC(String maxtempC) {
		this.maxtempC = maxtempC;
	}
	public String getMaxtempF() {
		return maxtempF;
	}
	public void setMaxtempF(String maxtempF) {
		this.maxtempF = maxtempF;
	}
	public String getMintempC() {
		return mintempC;
	}
	public void setMintempC(String mintempC) {
		this.mintempC = mintempC;
	}
	public String getMintempF() {
		return mintempF;
	}
	public void setMintempF(String mintempF) {
		this.mintempF = mintempF;
	}
	public String getTotalSnow_cm() {
		return totalSnow_cm;
	}
	public void setTotalSnow_cm(String totalSnow_cm) {
		this.totalSnow_cm = totalSnow_cm;
	}
	public String getSunHour() {
		return sunHour;
	}
	public void setSunHour(String sunHour) {
		this.sunHour = sunHour;
	}
	public String getUvIndex() {
		return uvIndex;
	}
	public void setUvIndex(String uvIndex) {
		this.uvIndex = uvIndex;
	}
	public List<HavaDurumuDataWeatherHourly> getHourly() {
		return hourly;
	}
	public void setHourly(List<HavaDurumuDataWeatherHourly> hourly) {
		this.hourly = hourly;
	}
	
	

}
