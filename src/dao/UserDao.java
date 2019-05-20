package dao;

import java.util.List;

import entity.User;

public interface UserDao {
	
	public List<User> read();
	
	public void write(List<User> users);
	
}
