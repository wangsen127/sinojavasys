package com.sinojava.entity;



/**
 * UserArea entity. @author MyEclipse Persistence Tools
 */

public class UserArea  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Integer userid;
     private Integer aid;


    // Constructors

    /** default constructor */
    public UserArea() {
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }


	public Integer getUserid() {
		return userid;
	}


	public void setUserid(Integer userid) {
		this.userid = userid;
	}


	public Integer getAid() {
		return aid;
	}


	public void setAid(Integer aid) {
		this.aid = aid;
	}

}