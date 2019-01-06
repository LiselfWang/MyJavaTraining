package com.leo.viewModel;

import java.util.Date;

public class WhoIsTheMurder {
	String murder;
	String detector;
	String goodPerson;
	String deadPerson;
	String place;
	Date date;
	String accident;

	public WhoIsTheMurder(String murder, String detector, String goodPerson, String deadPerson, String place, Date date,
			String accident) {
		this.murder = murder;
		this.detector = detector;
		this.deadPerson = deadPerson;
		this.goodPerson = goodPerson;
		this.place = place;
		this.date = date;
		this.accident = accident;

	}

	public String getMurder() {
		return murder;
	}

	public void setMurder(String murder) {
		this.murder = murder;
	}

	public String getDetector() {
		return detector;
	}

	public void setDetector(String detector) {
		this.detector = detector;
	}

	public String getGoodPerson() {
		return goodPerson;
	}

	public void setGoodPerson(String goodPerson) {
		this.goodPerson = goodPerson;
	}

	public String getDeadPerson() {
		return deadPerson;
	}

	public void setDeadPerson(String deadPerson) {
		this.deadPerson = deadPerson;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getAccident() {
		return accident;
	}

	public void setAccident(String accident) {
		this.accident = accident;
	}

}
