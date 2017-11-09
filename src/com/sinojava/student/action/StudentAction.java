package com.sinojava.student.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sinojava.core.BaseActionSupport;
import com.sinojava.entity.Stuclass;
import com.sinojava.entity.Student;
import com.sinojava.student.service.StudentService;

@Controller
public class StudentAction extends BaseActionSupport {

	@Autowired
	private StudentService studentService;
	
	private int sid;
	private int userid;
    private int cid;
    private String stuname;
    private String cellphone;
    private int time;
    private int status;
	private String ids;
	
	public void listStudent(){
		List<Integer> userArea = (List<Integer>) this.getSession().get("userArea");
		
		List<Student> list = studentService.listStudentPart(userArea, this.getStart(), this.getRows());
		long count = studentService.listStudentCount(userArea);
		this.renderJson(list, count);
	}
	
//	public void saveStudent(){
//		
//		Student stu = new Student();
//		stu.setUserid(userid);
//		stu.setStuname(stuname);
//		stu.setCellphone(cellphone);
//		stu.setTime(0);
//		Stuclass sc = new Stuclass();
//		sc.setCid(cid);
//		stu.setSc(sc);
//		
//		studentService.saveOrUpdateStudent(stu);
//		this.renderJson(true);
//		
//	}
	
	public void getStudent(){
		
		this.renderJson(studentService.getStudent(sid));
	}

	public void editStudent(){
		
		Student stu = new Student();
		stu.setSid(sid);
		stu.setUserid(userid);
		stu.setStuname(stuname);
		stu.setCellphone(cellphone);
		stu.setTime(time);
		stu.setStatus(status);
		Stuclass sc = new Stuclass();
		sc.setCid(cid);
		stu.setSc(sc);
		
		studentService.saveOrUpdateStudent(stu);
		this.renderJson(true);
		
	}
	
	public void delStudent(){
		
		studentService.delStudent(sid);
		this.renderJson(true);
	}
	
	public void delBatchStudent(){
		
		studentService.delBatchStudent(ids);
		this.renderJson(true);
		
	}
	
	public void editStudentClass(){
		
		studentService.editStudentClass(ids,cid,status);
		this.renderJson(true);
	}
	
	public void listStudentClassRecordBySid(){
		
		Student stu = new Student();
		stu.setSid(sid);
		this.renderJson(studentService.listStudentClassRecordBySid(stu));
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getStuname() {
		return stuname;
	}

	public void setStuname(String stuname) {
		this.stuname = stuname;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
	
}
