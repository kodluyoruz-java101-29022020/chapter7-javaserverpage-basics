package com.jsp.basics.bean;

import java.io.Serializable;

public class User implements Serializable {

	private static final long serialVersionUID = -2016212747462017700L;

	private String name;
	private String surname;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
}
