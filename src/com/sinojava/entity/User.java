package com.sinojava.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer userid;
	private String usercode;
	private String username;
	private String password;
	private Integer role;
	private String email;
	private Integer sex;
	private Date birthday;
	private String cellphone;
	private String officePhone;
	private String remark;
	private String loginIp;
	private Date loginDate;
	private Integer delflag;

	// Constructors

	/** default constructor */
	public User() {
	}

	/** full constructor */
	public User(String usercode, String username, String password,
			Integer role, String email, Integer sex, Date birthday,
			String cellphone, String officePhone, String remark,
			String loginIp, Date loginDate, Integer delflag) {
		this.usercode = usercode;
		this.username = username;
		this.password = password;
		this.role = role;
		this.email = email;
		this.sex = sex;
		this.birthday = birthday;
		this.cellphone = cellphone;
		this.officePhone = officePhone;
		this.remark = remark;
		this.loginIp = loginIp;
		this.loginDate = loginDate;
		this.delflag = delflag;
	}

	// Property accessors

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getUsercode() {
		return this.usercode;
	}

	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getRole() {
		return this.role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getSex() {
		return this.sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getCellphone() {
		return this.cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getOfficePhone() {
		return this.officePhone;
	}

	public void setOfficePhone(String officePhone) {
		this.officePhone = officePhone;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getLoginIp() {
		return this.loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public Date getLoginDate() {
		return this.loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	public Integer getDelflag() {
		return this.delflag;
	}

	public void setDelflag(Integer delflag) {
		this.delflag = delflag;
	}

}