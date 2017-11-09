package com.sinojava.stuclass.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.sinojava.core.BaseDao;
import com.sinojava.entity.Area;
import com.sinojava.entity.Stuclass;

@Repository("stuclassDao")
public class StuclassDaoImpl extends BaseDao implements StuclassDao {

	public void saveOrUpdateStuclass(Stuclass sc) {
		this.getSession().saveOrUpdate(sc);
	}

	public void delStuclass(int cid) {
		String hql = "delete from Stuclass sc where sc.cid=:cid";
		this.getSession().createQuery(hql)
						.setInteger("cid", cid)
						.executeUpdate();
	}

	public List<Stuclass> listStuclassPart(int start, int size) {
		String hql = "from Stuclass sc left outer join fetch sc.area a order by sc.cid";
		Query query = this.getSession().createQuery(hql)
								.setFirstResult(start)
								.setMaxResults(size);
		
		return query.list();
	}

	public Long listStuclassCount() {
		String hql = "select count(sc.cid) from Stuclass sc left outer join sc.area";
		Query query = this.getSession().createQuery(hql);
		
		return ((Number) query.uniqueResult()).longValue();
	}

	public Stuclass getStuclass(int cid) {
		
		return (Stuclass) this.getSession().get(Stuclass.class, cid);
	}

	public void endClass(int cid) {
		String hql = "update Stuclass sc set sc.isend=0,sc.endtime=now() where sc.cid=:cid";
		this.getSession().createQuery(hql)
						 .setInteger("cid", cid)
						 .executeUpdate();
	}

	public List<Stuclass> listStuclassByArea(Area area) {
		String hql = "from Stuclass sc left outer join fetch sc.area where sc.area=:area order by sc.cid";
		Query query = this.getSession().createQuery(hql)
								.setEntity("area", area);
		
		return query.list();
	}
	
	public List<Stuclass> listStuclassPart(List<Integer> userArea, int start, int size) {
		String hql = "from Stuclass sc left outer join fetch sc.area a where a.aid in (:aids) order by sc.starttime desc";
		Query query = this.getSession().createQuery(hql)
								.setParameterList("aids", userArea)
								.setFirstResult(start)
								.setMaxResults(size);
		
		return query.list();
	}

	public Long listStuclassCount(List<Integer> userArea) {
		String hql = "select count(sc.cid) from Stuclass sc left outer join sc.area a where a.aid in (:aids)";
		Query query = this.getSession().createQuery(hql).setParameterList("aids", userArea);
		
		return ((Number) query.uniqueResult()).longValue();
	}
}
