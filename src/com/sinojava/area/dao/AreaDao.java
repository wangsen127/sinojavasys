package com.sinojava.area.dao;

import java.util.List;

import com.sinojava.entity.Area;
import com.sinojava.entity.UserArea;

public interface AreaDao {

	public void saveOrUpdateArea(Area area);
	public void delArea(int aid);
	public List<Area> listAreaPart(int start, int size);
	public List<Area> listArea();
	public List<Area> listArea(List<Integer> userArea);
	public Long listAreaCount();
	public Area getArea(int aid);
	
	//根据用户ID查询该用户所管理的地区ID
	public List<UserArea> listUserAreaByUserid(int userid);
	public void delUserAreaByUserid(int userid);
	public void saveUserArea(UserArea ua);
}
