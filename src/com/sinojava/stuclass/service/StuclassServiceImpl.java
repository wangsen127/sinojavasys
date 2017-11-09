package com.sinojava.stuclass.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinojava.entity.Area;
import com.sinojava.entity.Stuclass;
import com.sinojava.stuclass.dao.StuclassDao;

@Service("stuclassService")
public class StuclassServiceImpl implements StuclassService {
	
	@Autowired
	private StuclassDao stuclassDao;
	
	public void saveOrUpdateStuclass(Stuclass sc) {
		stuclassDao.saveOrUpdateStuclass(sc);
	}

	public void delStuclass(int cid) {
		stuclassDao.delStuclass(cid);
	}
	
	public void delBatchStuclass(String ids) {
		String[] is = ids.split(",");
		for (int i = 0; i < is.length; i++) {
			stuclassDao.delStuclass(Integer.parseInt(is[i]));
		}
	}

	public List<Stuclass> listStuclassPart(int start, int size) {
		
		return stuclassDao.listStuclassPart(start, size);
	}

	public Long listStuclassCount() {
		
		return stuclassDao.listStuclassCount();
	}

	public Stuclass getStuclass(int Stuclassid) {
		
		return stuclassDao.getStuclass(Stuclassid);
	}

	public void endClass(int cid) {
		stuclassDao.endClass(cid);
	}

	public List<Stuclass> listStuclassByArea(Area area) {
		
		return stuclassDao.listStuclassByArea(area);
	}

	public List<Stuclass> listStuclassPart(List<Integer> userArea, int start,
			int size) {
		return stuclassDao.listStuclassPart(userArea, start, size);
	}

	public Long listStuclassCount(List<Integer> userArea) {
		return stuclassDao.listStuclassCount(userArea);
	}

}
