package com.sinojava.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;


/**
 * TClass entity. @author MyEclipse Persistence Tools
 */

public class Stuclass  implements java.io.Serializable {


    // Fields    

     private Integer cid;
     private Area area;
     private String cname;
     private Integer type;
     private Date starttime;
     private Integer isend;
     private Date endtime;


    // Constructors

    /** default constructor */
    public Stuclass() {
    }

   
    // Property accessors

    public Integer getCid() {
        return this.cid;
    }
    
    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Area getArea() {
        return this.area;
    }
    
    public void setArea(Area area) {
        this.area = area;
    }

    public String getCname() {
        return this.cname;
    }
    
    public void setCname(String cname) {
        this.cname = cname;
    }

    public Integer getType() {
        return this.type;
    }
    
    public void setType(Integer type) {
        this.type = type;
    }

    public Date getStarttime() {
        return this.starttime;
    }
    
    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Integer getIsend() {
        return this.isend;
    }
    
    public void setIsend(Integer isend) {
        this.isend = isend;
    }

    public Date getEndtime() {
        return this.endtime;
    }
    
    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }
}