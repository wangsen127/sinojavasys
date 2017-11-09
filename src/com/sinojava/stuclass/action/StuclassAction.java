package com.sinojava.stuclass.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sinojava.core.BaseActionSupport;
import com.sinojava.entity.Area;
import com.sinojava.entity.Stuclass;
import com.sinojava.stuclass.service.StuclassService;

@Controller
public class StuclassAction extends BaseActionSupport {

	@Autowired
	private StuclassService stuclassService;
	
	private int cid;
    private int aid;
    private String cname;
    private int type;
    private Date starttime;
    private Date endtime;
	private String ids;
	
	public void listStuclass(){
		
		List<Integer> userArea = (List<Integer>) this.getSession().get("userArea");
		
		List<Stuclass> list = stuclassService.listStuclassPart(userArea, this.getStart(), this.getRows());
		long count = stuclassService.listStuclassCount(userArea);
		this.renderJson(list, count);
	}
	
	public void saveStuclass(){
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd班");
		Stuclass sc = new Stuclass();
		sc.setCname(sdf.format(starttime));
		sc.setType(type);
		sc.setStarttime(starttime);
		sc.setIsend(1);
		Area a = new Area();
		a.setAid(aid);
		sc.setArea(a);
		
		stuclassService.saveOrUpdateStuclass(sc);
		this.renderJson(true);
		
	}
	
	public void getStuclass(){
		
		this.renderJson(stuclassService.getStuclass(cid));
	}

	public void editStuclass(){
		
		Stuclass sc = new Stuclass();
		sc.setCid(cid);
		sc.setCname(cname);
		sc.setType(type);
		sc.setStarttime(starttime);
		sc.setIsend(1);
		Area a = new Area();
		a.setAid(aid);
		sc.setArea(a);
		
		stuclassService.saveOrUpdateStuclass(sc);
		this.renderJson(true);
		
	}
	
	public void delStuclass(){
		
		stuclassService.delStuclass(cid);
		this.renderJson(true);
	}
	
	public void delBatchStuclass(){
		
		stuclassService.delBatchStuclass(ids);
		this.renderJson(true);
		
	}
	
	public void endClass(){
		
		stuclassService.endClass(cid);
		this.renderJson(true);
	}
	
	public void listStuclassByArea(){
		
		Area area = new Area();
		area.setAid(aid);
		this.renderJson(stuclassService.listStuclassByArea(area));
	}
	
	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Date getStarttime() {
		return starttime;
	}

	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}

	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	
}
