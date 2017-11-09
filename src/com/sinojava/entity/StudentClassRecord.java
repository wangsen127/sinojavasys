package com.sinojava.entity;

import java.util.Date;

/**
 * StudentClassRecord entity. @author MyEclipse Persistence Tools
 */

public class StudentClassRecord implements java.io.Serializable {

	// Fields

	private Integer rid;
	private Student stu;
	private Stuclass sc;
	private Date date;

	// Constructors

	/** default constructor */
	public StudentClassRecord() {
	}


	// Property accessors

	public Integer getRid() {
		return this.rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public Student getStu() {
		return stu;
	}


	public void setStu(Student stu) {
		this.stu = stu;
	}


	public Stuclass getSc() {
		return sc;
	}


	public void setSc(Stuclass sc) {
		this.sc = sc;
	}


	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}