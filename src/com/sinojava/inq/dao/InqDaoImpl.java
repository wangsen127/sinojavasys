package com.sinojava.inq.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.sinojava.core.BaseDao;
import com.sinojava.entity.Inq;

@Repository("inqDao")
public class InqDaoImpl extends BaseDao implements InqDao {

	public void saveOrUpdateInq(Inq inq) {
		this.getSession().saveOrUpdate(inq);
	}

	public void delInq(int inid) {
		// 删除
		String hql = "delete from Inq i where i.inid=:inid";
		this.getSession().createQuery(hql).setInteger("inid", inid)
				.executeUpdate();
	}

	public List<Inq> listInqPart(int start, int size) {
		String hql = "from Inq i left outer join fetch i.stu a left outer join fetch a.sc b left outer join fetch b.area c where b.isend=1 order by c.aid";
		Query query = this.getSession().createQuery(hql).setFirstResult(start)
				.setMaxResults(size);

		return query.list();
	}

	public Long listInqCount() {
		String hql = "select count(i.inid) from Inq i left outer join i.stu a left outer join a.sc b left outer join b.area c where b.isend=1";
		Query query = this.getSession().createQuery(hql);

		return ((Number) query.uniqueResult()).longValue();
	}

	public Inq getInq(int inid) {

		return (Inq) this.getSession().get(Inq.class, inid);
	}

	public List<Inq> listInqPart(List<Integer> userArea, int start, int size) {
		String hql = "from Inq i left outer join fetch i.stu a left outer join fetch a.sc b left outer join fetch b.area c where b.isend=1 and c.aid in (:aids) order by c.aid";
		Query query = this.getSession().createQuery(hql)
										.setParameterList("aids", userArea)
										.setFirstResult(start)
										.setMaxResults(size);

		return query.list();
	}

	public Long listInqCount(List<Integer> userArea) {
		String hql = "select count(i.inid) from Inq i left outer join i.stu a left outer join a.sc b left outer join b.area c where b.isend=1 and c.aid in (:aids)";
		Query query = this.getSession().createQuery(hql).setParameterList("aids", userArea);

		return ((Number) query.uniqueResult()).longValue();
	}
}
