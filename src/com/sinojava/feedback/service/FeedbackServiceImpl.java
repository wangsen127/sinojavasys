package com.sinojava.feedback.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinojava.entity.Feedback;
import com.sinojava.entity.Student;
import com.sinojava.feedback.dao.FeedbackDao;

@Service("feedbackService")
public class FeedbackServiceImpl implements FeedbackService {
	
	@Autowired
	private FeedbackDao feedbackDao;
	
	
	public void saveOrUpdateFeedback(Feedback stu) {
		feedbackDao.saveOrUpdateFeedback(stu);
	}

	public void delFeedback(int bid) {
		feedbackDao.delFeedback(bid);
	}
	
	public void delBatchFeedback(String ids) {
		String[] is = ids.split(",");
		for (int i = 0; i < is.length; i++) {
			feedbackDao.delFeedback(Integer.parseInt(is[i]));
		}
	}

	public List<Feedback> listFeedbackPart(int start, int size) {
		
		return feedbackDao.listFeedbackPart(start, size);
	}

	public Long listFeedbackCount() {
		
		return feedbackDao.listFeedbackCount();
	}

	public Feedback getFeedback(int bid) {
		
		return feedbackDao.getFeedback(bid);
	}

	public List<Feedback> listFeedbackBySid(Student stu) {
		
		return feedbackDao.listFeedbackBySid(stu);
	}

	public void doFeedback(String ids) {
		
		String[] is = ids.split(",");
		for (int i = 0; i < is.length; i++) {
			feedbackDao.doFeedback(Integer.parseInt(is[i]));
		}
	}
	
	public void finishFeedback(Feedback fb) {
		
		feedbackDao.finishFeedback(fb);
	}

	public List<Feedback> listFeedbackPart(List<Integer> userArea, int start,
			int size) {
		return feedbackDao.listFeedbackPart(userArea, start, size);
	}

	public Long listFeedbackCount(List<Integer> userArea) {
		return feedbackDao.listFeedbackCount(userArea);
	}


	
}
