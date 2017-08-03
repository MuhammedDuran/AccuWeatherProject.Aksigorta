package com.hellokoding.account.model.weather;

public class HavaDurumuDataClimateAveragesMonth {
	
	private String index;
	private String name;
	private String avgMinTemp;
	private String avgMinTemp_F;
	private String absMaxTemp;
	private String absMaxTemp_F;
	private String avgDailyRainfall;
	
	
	public String getIndex() {
		return index;
	}
	public void setIndex(String index) {
		this.index = index;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAvgMinTemp() {
		return avgMinTemp;
	}
	public void setAvgMinTemp(String avgMinTemp) {
		this.avgMinTemp = avgMinTemp;
	}
	public String getAvgMinTemp_F() {
		return avgMinTemp_F;
	}
	public void setAvgMinTemp_F(String avgMinTemp_F) {
		this.avgMinTemp_F = avgMinTemp_F;
	}
	public String getAbsMaxTemp() {
		return absMaxTemp;
	}
	public void setAbsMaxTemp(String absMaxTemp) {
		this.absMaxTemp = absMaxTemp;
	}
	public String getAbsMaxTemp_F() {
		return absMaxTemp_F;
	}
	public void setAbsMaxTemp_F(String absMaxTemp_F) {
		this.absMaxTemp_F = absMaxTemp_F;
	}
	public String getAvgDailyRainfall() {
		return avgDailyRainfall;
	}
	public void setAvgDailyRainfall(String avgDailyRainfall) {
		this.avgDailyRainfall = avgDailyRainfall;
	}

}
