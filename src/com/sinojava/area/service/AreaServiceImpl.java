package com.sinojava.area.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinojava.area.dao.AreaDao;
import com.sinojava.entity.Area;
import com.sinojava.entity.UserArea;

@Service("areaService")
public class AreaServiceImpl implements AreaService {
	
	@Autowired
	private AreaDao areaDao;
	
	public void saveOrUpdateArea(Area Area) {
		areaDao.saveOrUpdateArea(Area);
	}

	public void delArea(int aid) {
		areaDao.delArea(aid);
	}
	
	public void delBatchArea(String ids) {
		String[] is = ids.split(",");
		for (int i = 0; i < is.length; i++) {
			areaDao.delArea(Integer.parseInt(is[i]));
		}
	}

	public List<Area> listAreaPart(int start, int size) {
		
		return areaDao.listAreaPart(start, size);
	}
	
	public List<Area> listArea() {
		
		return areaDao.listArea();
	}
	
	public List<Area> listArea(List<Integer> userArea) {
		
		return areaDao.listArea(userArea);
	}

	public Long listAreaCount() {
		
		return areaDao.listAreaCount();
	}

	public Area getArea(int aid) {
		
		return areaDao.getArea(aid);
	}
	
	public List<UserArea> listUserAreaByUserid(int userid){
		
		return areaDao.listUserAreaByUserid(userid);
	}
	
	public void saveUserArea(int userid, String aids) {
		
		//删除原有地区
		areaDao.delUserAreaByUserid(userid);
		
		//添加新地区
		String[] ss = aids.split(",");
		for (int i = 0; i < ss.length; i++) {
			UserArea ua = new UserArea();
			ua.setUserid(userid);
			ua.setAid(Integer.parseInt(ss[i]));
			
			areaDao.saveUserArea(ua);
		}
	}
}
