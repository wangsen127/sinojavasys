package com.sinojava.user.dao;

import java.util.List;

import com.sinojava.entity.User;

public interface UserDao {

	public void saveOrUpdateUser(User user);
	public void delUser(int userid);
	public List<User> listUserPart(int start, int size);
	public Long listUserCount();
	public User getUser(int userid);
	public boolean checkUser(String usercode);
	public void resetPassword(int userid, String password);
	public User login(String usercode,String password);
	
}
