package com.sinojava.student.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.sinojava.core.BaseDao;
import com.sinojava.entity.Student;
import com.sinojava.entity.StudentClassRecord;

@Repository("studentClassRecordDao")
public class StudentClassRecordDaoImpl extends BaseDao implements StudentClassRecordDao {

	public void saveOrUpdateStudentClassRecord(StudentClassRecord rec) {
		this.getSession().saveOrUpdate(rec);
	}

	public void delStudentClassRecord(int rid) {
		String hql = "delete from StudentClassRecord r where r.rid=:rid";
		this.getSession().createQuery(hql)
						.setInteger("rid", rid)
						.executeUpdate();
	}

	public List<StudentClassRecord> listStudentClassRecordPart(int start, int size) {
		String hql = "from StudentClassRecord r left outer join fetch r.stu a left outer join fetch r.sc b left outer join fetch b.area c order by r.rid";
		Query query = this.getSession().createQuery(hql)
								.setFirstResult(start)
								.setMaxResults(size);
		
		return query.list();
	}

	public Long listStudentClassRecordCount() {
		String hql = "select count(r.rid) from StudentClassRecord r left outer join r.stu a left outer join r.sc b left outer join b.area c";
		Query query = this.getSession().createQuery(hql);
		
		return ((Number) query.uniqueResult()).longValue();
	}

	public StudentClassRecord getStudentClassRecord(int rid) {
		
		return (StudentClassRecord) this.getSession().get(StudentClassRecord.class, rid);
	}
	
	public List<StudentClassRecord> listStudentClassRecordBySid(Student stu) {
		String hql = "from StudentClassRecord r left outer join fetch r.stu a left outer join fetch r.sc b left outer join fetch b.area c where r.stu=:stu order by r.date";
		Query query = this.getSession().createQuery(hql)
										.setEntity("stu", stu);
		
		return query.list();
	}

	public void delStudentClassRecordByStudent(Student stu) {
		String hql = "delete from StudentClassRecord r where r.stu=:stu";
		this.getSession().createQuery(hql)
						.setEntity("stu", stu)
						.executeUpdate();
	}
}
