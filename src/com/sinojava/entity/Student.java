package com.sinojava.entity;



/**
 * Student entity. @author MyEclipse Persistence Tools
 */

public class Student  implements java.io.Serializable {


    // Fields    

     private Integer sid;
     private Integer userid;
     private Stuclass sc;
     private String stuname;
     private String cellphone;
     private Integer time;
     private Integer status;
     

    // Constructors

    /** default constructor */
    public Student() {
    }

   
    // Property accessors

    public Integer getSid() {
        return this.sid;
    }
    
    public void setSid(Integer sid) {
        this.sid = sid;
    }
    
    public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Stuclass getSc() {
		return sc;
	}


	public void setSc(Stuclass sc) {
		this.sc = sc;
	}


	public String getStuname() {
        return this.stuname;
    }
    
    public void setStuname(String stuname) {
        this.stuname = stuname;
    }

    public String getCellphone() {
        return this.cellphone;
    }
    
    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }

    public Integer getTime() {
        return this.time;
    }
    
    public void setTime(Integer time) {
        this.time = time;
    }


	public Integer getStatus() {
		return status;
	}


	public void setStatus(Integer status) {
		this.status = status;
	}
    

}