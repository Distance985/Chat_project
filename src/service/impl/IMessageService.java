package service.impl;
import java.util.List;
import dao.MessageDao;
import dao.impl.IMessageDao;
import entity.Message;
import service.MessageService;

/*
 * 1、类名:消息处理类
 * 2、方法:处理聊天的消息，包括读取历史聊天消息以及保存聊天消息
 */

public class IMessageService implements MessageService {

	MessageDao messageDao = new IMessageDao();
	
	//读取聊天消息
	public List<Message> listMessage() {
		System.out.println("读取了一次消息");
		return messageDao.read();
	}

	//保存聊天消息
	public void saveMessage(List<Message> messages) {
		messageDao.write(messages);
		System.out.println("保存了一次消息");
	}

}
