package com.sinojava.feedback.action;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sinojava.core.BaseActionSupport;
import com.sinojava.entity.Feedback;
import com.sinojava.entity.Student;
import com.sinojava.feedback.service.FeedbackService;

@Controller
public class FeedbackAction extends BaseActionSupport {

	@Autowired
	private FeedbackService feedbackService;
	
	private int bid;
	private int sid;
    private int status;
    private String content;
    private Date date;
	private String ids;
	
	public void listFeedback(){
		List<Integer> userArea = (List<Integer>) this.getSession().get("userArea");
		
		List<Feedback> list = feedbackService.listFeedbackPart(userArea, this.getStart(), this.getRows());
		long count = feedbackService.listFeedbackCount(userArea);
		this.renderJson(list, count);
	}
	
	public void saveFeedback(){
		
		Feedback fb = new Feedback();
		Student stu = new Student();
		stu.setSid(sid);
		fb.setStu(stu);
		fb.setStatus(1);
		fb.setDate(new Date());
		
		feedbackService.saveOrUpdateFeedback(fb);
		this.renderJson(true);
		
	}
	
	public void getFeedback(){
		
		this.renderJson(feedbackService.getFeedback(bid));
	}

	public void editFeedback(){
		
		Feedback fb = new Feedback();
		fb.setBid(bid);
		Student stu = new Student();
		stu.setSid(sid);
		fb.setStu(stu);
		fb.setStatus(status);
		fb.setDate(date);
		fb.setContent(content);
		
		feedbackService.saveOrUpdateFeedback(fb);
		this.renderJson(true);
		
	}
	
	public void delFeedback(){
		
		feedbackService.delFeedback(bid);
		this.renderJson(true);
	}
	
	public void delBatchFeedback(){
		
		feedbackService.delBatchFeedback(ids);
		this.renderJson(true);
		
	}
	
	public void listFeedbackBySid(){
		
		Student stu = new Student();
		stu.setSid(sid);
		this.renderJson(feedbackService.listFeedbackBySid(stu));
	}
	
	public void doFeedback() {
		
		feedbackService.doFeedback(ids);
		this.renderJson(true);
	}
	
	public void finishFeedback(){
		
		Feedback fb = new Feedback();
		fb.setBid(bid);
		fb.setContent(content);
		
		feedbackService.finishFeedback(fb);
		this.renderJson(true);
	}
	
	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

}
