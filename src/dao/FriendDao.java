package dao;

import java.util.List;
import java.util.Map;

import entity.User;

public interface FriendDao {
	
	public Map<String, List<User>> read();
	
	public void write(Map<String, List<User>> friends);
	
}
