package service;

import java.util.List;

import entity.Message;

//用户消息服务的接口

public interface MessageService {
	/**
	 * 得到所有消息的集合
	 */
	public List<Message> listMessage();
	/**
	 * 保存消息
	 */
	public void saveMessage(List<Message> messages);
	
}
