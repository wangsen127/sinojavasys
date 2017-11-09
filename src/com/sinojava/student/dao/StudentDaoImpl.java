package com.sinojava.student.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.sinojava.core.BaseDao;
import com.sinojava.entity.Student;

@Repository("studentDao")
public class StudentDaoImpl extends BaseDao implements StudentDao {

	public void saveOrUpdateStudent(Student stu) {
		this.getSession().saveOrUpdate(stu);
	}

	public void delStudent(int sid) {
		String hql = "delete from Student s where s.sid=:sid";
		this.getSession().createQuery(hql)
						.setInteger("sid", sid)
						.executeUpdate();
	}

	public List<Student> listStudentPart(int start, int size) {
		String hql = "from Student s left outer join fetch s.sc a left outer join fetch a.area b where a.isend=1 order by b.aid";
		Query query = this.getSession().createQuery(hql)
								.setFirstResult(start)
								.setMaxResults(size);
		
		return query.list();
	}

	public Long listStudentCount() {
		String hql = "select count(s.sid) from Student s left outer join s.sc a left outer join a.area b where a.isend=1";
		Query query = this.getSession().createQuery(hql);
		
		return ((Number) query.uniqueResult()).longValue();
	}

	public Student getStudent(int sid) {
		
		return (Student) this.getSession().get(Student.class, sid);
	}

	public void editStudentClass(Student stu) {
		String hql = "update Student s set s.sc=:sc,s.status=:status where s.sid=:sid";
		this.getSession().createQuery(hql)
						 .setEntity("sc", stu.getSc())
						 .setInteger("status", stu.getStatus())	
						 .setInteger("sid", stu.getSid())
						 .executeUpdate();
	}

	public Student getStudentByUserid(int userid) {
		String hql = "from Student s left outer join fetch s.sc a left outer join fetch a.area where s.userid=:userid";
		Query query = this.getSession().createQuery(hql)
										.setInteger("userid", userid);
		
		return (Student) query.uniqueResult();
	}

	public void addTime(int sid) {
		String hql = "update Student s set s.time=s.time+1 where s.sid=:sid";
		this.getSession().createQuery(hql)
						.setInteger("sid", sid)
						.executeUpdate();
	}

	public void clearTime(int sid) {
		String hql = "update Student s set s.time=0 where s.sid=:sid";
		this.getSession().createQuery(hql)
						.setInteger("sid", sid)
						.executeUpdate();
	}
	
	public List<Student> listStudentPart(List<Integer> userArea, int start, int size) {
		String hql = "from Student s left outer join fetch s.sc a left outer join fetch a.area b where a.isend=1 and b.aid in (:aids) order by b.aid";
		Query query = this.getSession().createQuery(hql)
								.setParameterList("aids", userArea)
								.setFirstResult(start)
								.setMaxResults(size);
		
		return query.list();
	}

	public Long listStudentCount(List<Integer> userArea) {
		String hql = "select count(s.sid) from Student s left outer join s.sc a left outer join a.area b where a.isend=1 and b.aid in (:aids)";
		Query query = this.getSession().createQuery(hql).setParameterList("aids", userArea);
		
		return ((Number) query.uniqueResult()).longValue();
	}
}
