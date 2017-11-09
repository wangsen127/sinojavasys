package com.sinojava.user.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.dispatcher.SessionMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sinojava.area.service.AreaService;
import com.sinojava.core.BaseActionSupport;
import com.sinojava.core.MD5Util;
import com.sinojava.entity.Stuclass;
import com.sinojava.entity.Student;
import com.sinojava.entity.User;
import com.sinojava.entity.UserArea;
import com.sinojava.student.service.StudentService;
import com.sinojava.user.service.UserService;

@Controller
public class UserAction extends BaseActionSupport {

	@Autowired
	private UserService userService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private StudentService studentService;
	
	private int userid;
	private String usercode;
	private String username;
	private String password;
	private int role;
	private String email;
	private int sex;
	private String cellphone;
	private String officePhone;
	private String ids;
	
	private int cid;
	
	public void listUser(){
		
		this.renderJson(userService.listUserPart(this.getStart(), this.getRows()), 
				userService.listUserCount());
	}
	
	public void saveUser(){
		
		User user = new User();
		user.setUsercode(usercode);
		user.setUsername(username);
		user.setPassword(MD5Util.toMD5(password));
		user.setRole(role);
		user.setEmail(email);
		user.setSex(sex);
		user.setCellphone(cellphone);
		user.setOfficePhone(officePhone);
		user.setDelflag(1);
		
		userService.saveOrUpdateUser(user);
		this.renderJson(true);
		
	}
	
	public void getUser(){
		
		this.renderJson(userService.getUser(userid));
		
	}

	public void editUser(){
		
		User user = new User();
		user.setUserid(userid);
		user.setUsercode(usercode);
		user.setUsername(username);
		user.setPassword(password);
		user.setRole(role);
		user.setEmail(email);
		user.setSex(sex);
		user.setCellphone(cellphone);
		user.setOfficePhone(officePhone);
		user.setDelflag(1);
		
		userService.saveOrUpdateUser(user);
		this.renderJson(true);
		
	}
	
	public void delUser(){
		
		userService.delUser(userid);
		this.renderJson(true);
	}
	
	public void delBatchUser(){
		
		userService.delBatchUser(ids);
		this.renderJson(true);
		
	}
	
	public void checkUser(){
		
		this.renderJson(userService.checkUser(usercode));
	}
	
	public void resetPassword(){
		
		userService.resetPassword(userid, MD5Util.toMD5(password));
		this.renderJson(true);
	}
	
	public String registerStudent(){
		
		User user = new User();
		user.setUsercode(usercode);
		user.setUsername(username);
		user.setPassword(MD5Util.toMD5(password));
		user.setRole(5);
		user.setEmail(email);
		user.setSex(sex);
		user.setCellphone(cellphone);
		user.setOfficePhone(officePhone);
		user.setDelflag(1);
		
		Student stu = new Student();
		stu.setStuname(username);
		stu.setCellphone(cellphone);
		stu.setTime(0);
		stu.setStatus(1);
		Stuclass sc = new Stuclass();
		sc.setCid(cid);
		stu.setSc(sc);
		
		userService.registerStudent(user, stu);
		return LOGIN;
	}
	
	public String login(){
		
		User user = userService.login(usercode, MD5Util.toMD5(password));
		
		if(user == null) return LOGIN;
		
		this.getSession().put("loginUser", user);
		
		if(user.getRole() == 5){
			Student stu = studentService.getStudentByUserid(user.getUserid());
			this.getSession().put("loginStu", stu);
			return "ask";
		} 
		
		List<UserArea> list = areaService.listUserAreaByUserid(user.getUserid());
		StringBuffer sb = new StringBuffer();
		List<Integer> ss = new ArrayList<Integer>();
		for (int i = 0;i < list.size();i++) {
			UserArea ua = list.get(i);
			ss.add(ua.getAid());
			sb.append(ua.getAid());
			if(i != list.size()-1)
				sb.append(",");
		}
		this.getSession().put("aids", sb.toString());
		this.getSession().put("userArea", ss);
		
		return INDEX;
	}
	
	public String logout(){
		this.getSession().remove("loginUser");
		
		((SessionMap)this.getSession()).invalidate();
		
		return LOGIN;
	}
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsercode() {
		return usercode;
	}
	public void setUsercode(String usercode) {
		this.usercode = usercode;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getCellphone() {
		return cellphone;
	}
	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}
	public String getOfficePhone() {
		return officePhone;
	}
	public void setOfficePhone(String officePhone) {
		this.officePhone = officePhone;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}
}
