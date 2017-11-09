package com.sinojava.inq.service;

import java.util.List;

import com.sinojava.entity.Inq;

public interface InqService {

	public void saveOrUpdateInq(Inq inq);
	public void delInq(int inid);
	public List<Inq> listInqPart(int start, int size);
	public Long listInqCount();
	public Inq getInq(int inid);
	public void delBatchInq(String ids);
	public List<Inq> listInqPart(List<Integer> userArea, int start, int size);
	public Long listInqCount(List<Integer> userArea);
}
