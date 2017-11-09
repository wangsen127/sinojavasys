package com.sinojava.student.service;

import java.util.List;

import com.sinojava.entity.Student;
import com.sinojava.entity.StudentClassRecord;

public interface StudentService {

	public void saveOrUpdateStudent(Student stu);
	public void delStudent(int sid);
	public void delBatchStudent(String ids);
	public List<Student> listStudentPart(int start, int size);
	public Long listStudentCount();
	public Student getStudent(int sid);
	public Student getStudentByUserid(int userid);
	
	public void editStudentClass(String ids, int cid, int status);
	public List<StudentClassRecord> listStudentClassRecordBySid(Student stu);

	public List<Student> listStudentPart(List<Integer> userArea, int start, int size);
	public Long listStudentCount(List<Integer> userArea);
}
