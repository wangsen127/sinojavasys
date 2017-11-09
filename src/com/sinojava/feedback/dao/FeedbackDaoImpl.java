package com.sinojava.feedback.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.sinojava.core.BaseDao;
import com.sinojava.entity.Feedback;
import com.sinojava.entity.Student;

@Repository("feedbackDao")
public class FeedbackDaoImpl extends BaseDao implements FeedbackDao {

	public void saveOrUpdateFeedback(Feedback fb) {
		this.getSession().saveOrUpdate(fb);
	}

	public void delFeedback(int bid) {
		String hql = "delete from Feedback f where f.bid=:bid";
		this.getSession().createQuery(hql)
						.setInteger("bid", bid)
						.executeUpdate();
	}

	public List<Feedback> listFeedbackPart(int start, int size) {
		String hql = "from Feedback f left outer join fetch f.stu a left outer join fetch a.sc b left outer join fetch b.area c where b.isend=1 order by c.aid";
		Query query = this.getSession().createQuery(hql)
								.setFirstResult(start)
								.setMaxResults(size);
		
		return query.list();
	}

	public Long listFeedbackCount() {
		String hql = "select count(f.bid) from Feedback f left outer join f.stu a left outer join a.sc b left outer join b.area c where b.isend=1";
		Query query = this.getSession().createQuery(hql);
		
		return ((Number) query.uniqueResult()).longValue();
	}

	public Feedback getFeedback(int sid) {
		
		return (Feedback) this.getSession().get(Feedback.class, sid);
	}

	public List<Feedback> listFeedbackBySid(Student stu) {
		String hql = "from Feedback f left outer join fetch f.stu a left outer join fetch a.sc b left outer join fetch b.area where f.stu=:stu";
		Query query = this.getSession().createQuery(hql)
								.setEntity("stu", stu);
		
		return query.list();
	}
	
	public void doFeedback(int bid) {
		String hql = "update Feedback f set f.status=2 where f.bid=:bid";
		this.getSession().createQuery(hql)
						.setInteger("bid", bid)
						.executeUpdate();
	}
	
	public void finishFeedback(Feedback fb) {
		String hql = "update Feedback f set f.content=:content,f.findate=now(),f.status=3 where f.bid=:bid";
		this.getSession().createQuery(hql)
						.setInteger("bid", fb.getBid())
						.setString("content", fb.getContent())
						.executeUpdate();
	}

	public List<Feedback> listFeedbackPart(List<Integer> userArea, int start,
			int size) {
		String hql = "from Feedback f left outer join fetch f.stu a left outer join fetch a.sc b left outer join fetch b.area c where c.aid in (:aids) and b.isend=1 order by c.aid";
		Query query = this.getSession().createQuery(hql)
								.setParameterList("aids", userArea)
								.setFirstResult(start)
								.setMaxResults(size);
		
		return query.list();
	}

	public Long listFeedbackCount(List<Integer> userArea) {
		String hql = "select count(f.bid) from Feedback f left outer join f.stu a left outer join a.sc b left outer join b.area c where c.aid in (:aids) and b.isend=1";
		Query query = this.getSession().createQuery(hql).setParameterList("aids", userArea);
		
		return ((Number) query.uniqueResult()).longValue();
	}
}
