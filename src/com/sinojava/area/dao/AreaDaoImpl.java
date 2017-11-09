package com.sinojava.area.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.sinojava.core.BaseDao;
import com.sinojava.entity.Area;
import com.sinojava.entity.UserArea;

@Repository("areaDao")
public class AreaDaoImpl extends BaseDao implements AreaDao {

	public void saveOrUpdateArea(Area area) {
		this.getSession().saveOrUpdate(area);
	}

	public void delArea(int aid) {
		String hql = "delete from Area a where a.aid=:aid";
		this.getSession().createQuery(hql)
						.setInteger("aid", aid)
						.executeUpdate();
	}

	public List<Area> listAreaPart(int start, int size) {
		String hql = "from Area a order by a.aid";
		Query query = this.getSession().createQuery(hql)
								.setFirstResult(start)
								.setMaxResults(size);
		
		return query.list();
	}
	
	public List<Area> listArea() {
		String hql = "from Area a order by a.aid";
		Query query = this.getSession().createQuery(hql);
		
		return query.list();
	}
	
	public List<Area> listArea(List<Integer> userArea) {
		if(userArea==null || userArea.isEmpty()){
			String hql = "from Area a order by a.aid";
			Query query = this.getSession().createQuery(hql);
			
			return query.list();
		}
		String hql = "from Area a where a.aid in (:aids) order by a.aid";
		Query query = this.getSession().createQuery(hql).setParameterList("aids", userArea);
		
		return query.list();
	}

	public Long listAreaCount() {
		String hql = "select count(a.aid) from Area a";
		Query query = this.getSession().createQuery(hql);
		
		return ((Number) query.uniqueResult()).longValue();
	}

	public Area getArea(int aid) {
		
		return (Area) this.getSession().get(Area.class, aid);
	}

	public List<UserArea> listUserAreaByUserid(int userid) {
		
		String hql = "from UserArea ua where ua.userid=:userid";
		return this.getSession().createQuery(hql)
								.setInteger("userid", userid)
								.list();
	}
	
	public void delUserAreaByUserid(int userid) {
		
		String hql = "delete from UserArea ua where ua.userid=:userid";
		this.getSession().createQuery(hql)
						 .setInteger("userid", userid)
						 .executeUpdate();
	}
	
	public void saveUserArea(UserArea ua) {
		
		this.getSession().saveOrUpdate(ua);
	}
}
