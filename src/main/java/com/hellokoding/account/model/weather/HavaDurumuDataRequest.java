package com.hellokoding.account.model.weather;

public class HavaDurumuDataRequest {
	
	private String type;
	private String query;
	private boolean showlocaltime = true;
	
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	public boolean isShowlocaltime() {
		return showlocaltime;
	}
	public void setShowlocaltime(boolean showlocaltime) {
		this.showlocaltime = showlocaltime;
	}
	
	

}
