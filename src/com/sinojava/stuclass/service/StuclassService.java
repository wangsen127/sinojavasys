package com.sinojava.stuclass.service;

import java.util.List;

import com.sinojava.entity.Area;
import com.sinojava.entity.Stuclass;

public interface StuclassService {

	public void saveOrUpdateStuclass(Stuclass sc);
	public void delStuclass(int cid);
	public void delBatchStuclass(String ids);
	public List<Stuclass> listStuclassPart(int start, int size);
	public Long listStuclassCount();
	public Stuclass getStuclass(int cid);
	public void endClass(int cid);
	
	public List<Stuclass> listStuclassByArea(Area area);
	public List<Stuclass> listStuclassPart(List<Integer> userArea, int start, int size);
	public Long listStuclassCount(List<Integer> userArea);
}
