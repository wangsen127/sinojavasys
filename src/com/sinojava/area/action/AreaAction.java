package com.sinojava.area.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sinojava.area.service.AreaService;
import com.sinojava.core.BaseActionSupport;
import com.sinojava.entity.Area;

@Controller
public class AreaAction extends BaseActionSupport {

	@Autowired
	private AreaService areaService;
	
	private int aid;
	private String aname;
	private String ids;
	private int userid;
	private String aids;
	
	public void listArea(){
		
		this.renderJson(areaService.listAreaPart(this.getStart(), this.getRows()), 
				areaService.listAreaCount());
	}
	
	public void listAreaAll(){
		
		List<Integer> userArea = (List<Integer>) this.getSession().get("userArea");
		
		this.renderJson(areaService.listArea(userArea));
	}
	
	public void listAreaAll2(){
		
		this.renderJson(areaService.listArea());
	}
	
	public void saveArea(){
		
		Area area = new Area();
		area.setAname(aname);
		
		areaService.saveOrUpdateArea(area);
		this.renderJson(true);
	}
	
	public void getArea(){
		
		this.renderJson(areaService.getArea(aid));
		
	}

	public void editArea(){
		
		Area area = new Area();
		area.setAid(aid);
		area.setAname(aname);
		
		areaService.saveOrUpdateArea(area);
		this.renderJson(true);
	}
	
	public void delArea(){
		
		areaService.delArea(aid);
		this.renderJson(true);
	}
	
	public void delBatchArea(){
		
		areaService.delBatchArea(ids);
		this.renderJson(true);
		
	}
	
	public void listAreaByUserid(){
		
		this.renderJson(areaService.listUserAreaByUserid(userid));
	}
	
	public void saveUserArea(){
		
		areaService.saveUserArea(userid, aids);
		this.renderJson(true);
	}
	
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getAids() {
		return aids;
	}
	public void setAids(String aids) {
		this.aids = aids;
	}
	
}
