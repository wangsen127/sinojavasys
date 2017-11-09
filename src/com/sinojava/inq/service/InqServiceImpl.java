package com.sinojava.inq.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinojava.entity.Feedback;
import com.sinojava.entity.Inq;
import com.sinojava.entity.Student;
import com.sinojava.feedback.dao.FeedbackDao;
import com.sinojava.inq.dao.InqDao;
import com.sinojava.student.dao.StudentDao;

@Service("inqService")
public class InqServiceImpl implements InqService {

	@Autowired
	private InqDao inqDao;
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private FeedbackDao feedbackDao;

	public void saveOrUpdateInq(Inq inq) {
		inqDao.saveOrUpdateInq(inq);
		
		//当调查结果中掌握情况为部分掌握或未掌握时
		if(inq.getMaster() > 2){
			//1.学生记次数
			studentDao.addTime(inq.getStu().getSid());
			
			//2.生成反馈
			Feedback fb = new Feedback();
			fb.setStu(inq.getStu());
			fb.setStatus(1);
			fb.setDate(new Date());
			feedbackDao.saveOrUpdateFeedback(fb);
		}
	}

	public void delInq(int inid) {
		inqDao.delInq(inid);
	}

	public void delBatchInq(String ids) {
		String[] is = ids.split(",");
		for (int i = 0; i < is.length; i++) {
			inqDao.delInq(Integer.parseInt(is[i]));
		}
	}

	public List<Inq> listInqPart(int start, int size) {

		return inqDao.listInqPart(start, size);
	}

	public Long listInqCount() {

		return inqDao.listInqCount();
	}

	public Inq getInq(int inid) {

		return inqDao.getInq(inid);
	}

	public List<Inq> listInqPart(List<Integer> userArea, int start, int size) {
		return inqDao.listInqPart(userArea, start, size);
	}

	public Long listInqCount(List<Integer> userArea) {
		return inqDao.listInqCount(userArea);
	}

}
