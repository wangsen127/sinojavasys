package com.sinojava.student.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sinojava.entity.Stuclass;
import com.sinojava.entity.Student;
import com.sinojava.entity.StudentClassRecord;
import com.sinojava.student.dao.StudentClassRecordDao;
import com.sinojava.student.dao.StudentDao;

@Service("studentService")
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private StudentDao studentDao;
	@Autowired
	private StudentClassRecordDao studentClassRecordDao;
	
	
	public void saveOrUpdateStudent(Student stu) {
		studentDao.saveOrUpdateStudent(stu);
	}

	public void delStudent(int sid) {
		studentDao.delStudent(sid);
	}
	
	public void delBatchStudent(String ids) {
		String[] is = ids.split(",");
		for (int i = 0; i < is.length; i++) {
			int sid = Integer.parseInt(is[i]);
			Student stu = new Student();
			stu.setSid(sid);
			studentClassRecordDao.delStudentClassRecordByStudent(stu);
			studentDao.delStudent(sid);
		}
	}

	public List<Student> listStudentPart(int start, int size) {
		
		return studentDao.listStudentPart(start, size);
	}

	public Long listStudentCount() {
		
		return studentDao.listStudentCount();
	}

	public Student getStudent(int sid) {
		
		return studentDao.getStudent(sid);
	}

	public void editStudentClass(String ids, int cid, int status) {
		
		String[] is = ids.split(",");
		for (int i = 0; i < is.length; i++) {
			Student stu = new Student();
			stu.setSid(Integer.parseInt(is[i]));
			stu.setStatus(status);
			Stuclass sc = new Stuclass();
			sc.setCid(cid);
			stu.setSc(sc);
			
			studentDao.editStudentClass(stu);
			
			StudentClassRecord rec = new StudentClassRecord();
			rec.setStu(stu);
			rec.setSc(sc);
			rec.setDate(new Date());
			studentClassRecordDao.saveOrUpdateStudentClassRecord(rec);
		}
		
	}

	public List<StudentClassRecord> listStudentClassRecordBySid(Student stu) {
		
		return studentClassRecordDao.listStudentClassRecordBySid(stu);
	}

	public Student getStudentByUserid(int userid) {
		return studentDao.getStudentByUserid(userid);
	}
	
	public List<Student> listStudentPart(List<Integer> userArea, int start, int size) {
		
		return studentDao.listStudentPart(userArea, start, size);
	}

	public Long listStudentCount(List<Integer> userArea) {
		
		return studentDao.listStudentCount(userArea);
	}

}
