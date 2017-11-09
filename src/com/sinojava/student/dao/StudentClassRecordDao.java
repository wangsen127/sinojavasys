package com.sinojava.student.dao;

import java.util.List;

import com.sinojava.entity.Student;
import com.sinojava.entity.StudentClassRecord;

public interface StudentClassRecordDao {

	public void saveOrUpdateStudentClassRecord(StudentClassRecord rec);
	public void delStudentClassRecord(int rid);
	public List<StudentClassRecord> listStudentClassRecordPart(int start, int size);
	public Long listStudentClassRecordCount();
	public StudentClassRecord getStudentClassRecord(int rid);
	public List<StudentClassRecord> listStudentClassRecordBySid(Student stu);
	
	public void delStudentClassRecordByStudent(Student stu);
}
