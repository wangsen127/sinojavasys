package com.sinojava.area.service;

import java.util.List;

import com.sinojava.entity.Area;
import com.sinojava.entity.UserArea;

public interface AreaService {

	public void saveOrUpdateArea(Area area);
	public void delArea(int aid);
	public void delBatchArea(String ids);
	public List<Area> listAreaPart(int start, int size);
	public List<Area> listArea();
	public List<Area> listArea(List<Integer> userArea);
	public Long listAreaCount();
	public Area getArea(int aid);
	
	public List<UserArea> listUserAreaByUserid(int userid);
	public void saveUserArea(int userid, String aids);
}
