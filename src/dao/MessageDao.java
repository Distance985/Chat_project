package dao;

import java.util.List;

import entity.Message;

public interface MessageDao {
	
	public List<Message> read();
	
	public void write(List<Message> messages);
	
}
