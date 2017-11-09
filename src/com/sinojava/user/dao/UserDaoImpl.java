package com.sinojava.user.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.sinojava.core.BaseDao;
import com.sinojava.entity.User;

@Repository("userDao")
public class UserDaoImpl extends BaseDao implements UserDao {

	public void saveOrUpdateUser(User user) {
		this.getSession().saveOrUpdate(user);
	}

	public void delUser(int userid) {
		//逻辑删除
		String hql = "update User u set u.delflag=0 where u.userid=:userid";
		this.getSession().createQuery(hql)
						.setInteger("userid", userid)
						.executeUpdate();
	}

	public List<User> listUserPart(int start, int size) {
		String hql = "from User u where u.delflag=1 order by u.userid";
		Query query = this.getSession().createQuery(hql)
								.setFirstResult(start)
								.setMaxResults(size);
		
		return query.list();
	}

	public Long listUserCount() {
		String hql = "select count(u.userid) from User u where u.delflag=1";
		Query query = this.getSession().createQuery(hql);
		
		return ((Number) query.uniqueResult()).longValue();
	}

	public User getUser(int userid) {
		
		return (User) this.getSession().get(User.class, userid);
	}
	
	public boolean checkUser(String usercode) {
		
		String hql = "select count(u.userid) from User u where u.delflag=1 and u.usercode=:usercode";
		Query query = this.getSession().createQuery(hql).setString("usercode", usercode);
		
		long count = ((Number) query.uniqueResult()).longValue();
		if(count == 0) return true;
		return false;
	}
	
	public void resetPassword(int userid, String password) {
		
		String hql = "update User u set u.password=:password where u.userid=:userid";
		this.getSession().createQuery(hql)
						.setString("password", password)
						.setInteger("userid", userid)
						.executeUpdate();
	}

	public User login(String usercode, String password) {
		
		String hql = "from User u where u.delflag=1 and u.usercode=:usercode and u.password=:password";
		Query query = this.getSession().createQuery(hql)
										.setString("usercode", usercode)
										.setString("password", password);
		return (User) query.uniqueResult();
	}

}
