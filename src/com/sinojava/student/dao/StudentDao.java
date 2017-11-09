package com.sinojava.student.dao;

import java.util.List;

import com.sinojava.entity.Student;
import com.sinojava.entity.StudentClassRecord;

public interface StudentDao {

	public void saveOrUpdateStudent(Student stu);
	public void delStudent(int sid);
	public List<Student> listStudentPart(int start, int size);
	public Long listStudentCount();
	public Student getStudent(int sid);
	public Student getStudentByUserid(int userid);
	public void addTime(int sid);
	public void clearTime(int sid);
	
	public void editStudentClass(Student stu);
	
	public List<Student> listStudentPart(List<Integer> userArea, int start, int size);
	public Long listStudentCount(List<Integer> userArea);
}
