package com.sinojava.inq.action;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sinojava.core.BaseActionSupport;
import com.sinojava.entity.Inq;
import com.sinojava.entity.Student;
import com.sinojava.inq.service.InqService;

@Controller
public class InqAction extends BaseActionSupport {
	private static final long serialVersionUID = 1L;

	@Autowired
	private InqService inqService;

	private int inid;
	private int sid;
	private int issolve;
	private int master;
	private int easy;
	private String other;
	private String ids;

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public void listInq() {
		List<Integer> userArea = (List<Integer>) this.getSession().get("userArea");
		
		List<Inq> list = inqService.listInqPart(userArea, this.getStart(), this.getRows());
		long count = inqService.listInqCount(userArea);
		this.renderJson(list, count);
	}

	public String saveInq() {

		Inq inq = new Inq();
		Student stu = new Student();
		stu.setSid(sid);
		inq.setStu(stu);
		inq.setDate(new Date());
		inq.setIssolve(issolve);
		inq.setMaster(master);
		inq.setEasy(easy);
		inq.setOther(other);

		inqService.saveOrUpdateInq(inq);
		return SUCCESS;
	}

	public void getInq() {

		this.renderJson(inqService.getInq(inid));

	}

	public void editInq() {

		Inq inq = new Inq();
		inq.setInid(inid);
		Student stu = new Student();
		stu.setSid(sid);
		inq.setStu(stu);
		inq.setDate(new Date());
		inq.setIssolve(issolve);
		inq.setMaster(master);
		inq.setEasy(easy);
		inq.setOther(other);

		inqService.saveOrUpdateInq(inq);
		this.renderJson(true);

	}

	public void delBatchInq() {
		inqService.delBatchInq(ids);
		this.renderJson(true);
	}

	public int getInid() {
		return inid;
	}

	public void setInid(int inid) {
		this.inid = inid;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public int getIssolve() {
		return issolve;
	}

	public void setIssolve(int issolve) {
		this.issolve = issolve;
	}

	public int getMaster() {
		return master;
	}

	public void setMaster(int master) {
		this.master = master;
	}

	public int getEasy() {
		return easy;
	}

	public void setEasy(int easy) {
		this.easy = easy;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

}
