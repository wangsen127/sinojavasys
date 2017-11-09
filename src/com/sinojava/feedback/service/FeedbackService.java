package com.sinojava.feedback.service;

import java.util.List;

import com.sinojava.entity.Feedback;
import com.sinojava.entity.Student;

public interface FeedbackService {

	public void saveOrUpdateFeedback(Feedback fb);
	public void delFeedback(int bid);
	public void delBatchFeedback(String ids);
	public List<Feedback> listFeedbackPart(int start, int size);
	public Long listFeedbackCount();
	public Feedback getFeedback(int bid);
	public List<Feedback> listFeedbackBySid(Student stu);
	public void doFeedback(String ids);
	public void finishFeedback(Feedback fb);
	
	public List<Feedback> listFeedbackPart(List<Integer> userArea, int start, int size);
	public Long listFeedbackCount(List<Integer> userArea);
}
