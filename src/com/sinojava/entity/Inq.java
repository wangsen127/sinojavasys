package com.sinojava.entity;

import java.util.Date;

public class Inq implements java.io.Serializable {
	private Integer inid;
	private Student stu;
	private Date date;
	private Integer issolve;
	private Integer master;
	private Integer easy;
	private String other;

	public Integer getInid() {
		return inid;
	}

	public void setInid(Integer inid) {
		this.inid = inid;
	}

	public Student getStu() {
		return stu;
	}

	public void setStu(Student stu) {
		this.stu = stu;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getIssolve() {
		return issolve;
	}

	public void setIssolve(Integer issolve) {
		this.issolve = issolve;
	}

	public Integer getMaster() {
		return master;
	}

	public void setMaster(Integer master) {
		this.master = master;
	}

	public Integer getEasy() {
		return easy;
	}

	public void setEasy(Integer easy) {
		this.easy = easy;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}
}