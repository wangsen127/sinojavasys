package com.sinojava.user.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinojava.entity.Student;
import com.sinojava.entity.StudentClassRecord;
import com.sinojava.entity.User;
import com.sinojava.student.dao.StudentClassRecordDao;
import com.sinojava.student.dao.StudentDao;
import com.sinojava.user.dao.UserDao;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private StudentClassRecordDao studentClassRecordDao;
	
	public void saveOrUpdateUser(User user) {
		userDao.saveOrUpdateUser(user);
	}

	public void delUser(int userid) {
		userDao.delUser(userid);
	}
	
	public void delBatchUser(String ids) {
		String[] is = ids.split(",");
		for (int i = 0; i < is.length; i++) {
			userDao.delUser(Integer.parseInt(is[i]));
		}
	}

	public List<User> listUserPart(int start, int size) {
		
		return userDao.listUserPart(start, size);
	}

	public Long listUserCount() {
		
		return userDao.listUserCount();
	}

	public User getUser(int userid) {
		
		return userDao.getUser(userid);
	}

	public boolean checkUser(String usercode) {
		return userDao.checkUser(usercode);
	}

	public void resetPassword(int userid, String password) {
		userDao.resetPassword(userid, password);
	}

	public User login(String usercode, String password) {
		return userDao.login(usercode, password);
	}

	public void registerStudent(User user, Student stu) {
		
		userDao.saveOrUpdateUser(user);
		
		stu.setUserid(user.getUserid());
		
		studentDao.saveOrUpdateStudent(stu);
		
		StudentClassRecord rec = new StudentClassRecord();
		rec.setStu(stu);
		rec.setSc(stu.getSc());
		rec.setDate(new Date());
		studentClassRecordDao.saveOrUpdateStudentClassRecord(rec);
	}
	
}
