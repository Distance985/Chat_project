package service;

import java.util.List;

import entity.User;

//处理用户的接口

public interface UserService {
	
	//添加用户 
	public boolean addUser(User user);
	
	//删除用户
	public void deleteUser(User user);
	
	//添加好友，双向添加，friend会被动的加user好友
	public void addFriend(User user, User friend);
	
	//删除好友，双向删除，friend的好友列表也会把user删除 
	public void deleteFriend(User user, User friend);
	
	//得到所有用户
	public List<User> listUsers();
	
	// 更新用户信息 
	public void updateUser(User user);
	
	//通过用户名查找用户 
	public User findUser(String username);
}
