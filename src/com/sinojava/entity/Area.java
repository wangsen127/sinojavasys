package com.sinojava.entity;



/**
 * Area entity. @author MyEclipse Persistence Tools
 */

public class Area  implements java.io.Serializable {


    // Fields    

     private Integer aid;
     private String aname;

    // Constructors

    /** default constructor */
    public Area() {
    }

   
    // Property accessors

    public Integer getAid() {
        return this.aid;
    }
    
    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getAname() {
        return this.aname;
    }
    
    public void setAname(String aname) {
        this.aname = aname;
    }

}