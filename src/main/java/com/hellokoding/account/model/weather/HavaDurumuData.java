package com.hellokoding.account.model.weather;

import java.util.List;


public class HavaDurumuData {
	
	private List<HavaDurumuDataRequest> request;
	private List<HavaDurumuDataCurrentCondition> current_condition;
	private List<HavaDurumuDataWeather> weather;
	private List<HavaDurumuDataClimateAverages> ClimateAverages;
	
	
	public List<HavaDurumuDataRequest> getRequest() {
		return request;
	}
	public void setRequest(List<HavaDurumuDataRequest> request) {
		this.request = request;
	}
	public List<HavaDurumuDataCurrentCondition> getCurrent_condition() {
		return current_condition;
	}
	public void setCurrent_condition(List<HavaDurumuDataCurrentCondition> current_condition) {
		this.current_condition = current_condition;
	}
	public List<HavaDurumuDataWeather> getWeather() {
		return weather;
	}
	public void setWeather(List<HavaDurumuDataWeather> weather) {
		this.weather = weather;
	}
	public List<HavaDurumuDataClimateAverages> getClimateAverages() {
		return ClimateAverages;
	}
	public void setClimateAverages(List<HavaDurumuDataClimateAverages> climateAverages) {
		ClimateAverages = climateAverages;
	}
	
	}
