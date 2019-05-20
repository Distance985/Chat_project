package dao.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

import dao.MessageDao;
import entity.Message;
import entity.User;

//类的作用:完成对聊天消息的文件存储以及读出的工作

public class IMessageDao implements MessageDao {
	
	String path = "C:\\Users\\19021\\Desktop";
	File dir = new File(path);
	File file_messages = new File(dir, "messages.txt");
	ObjectInputStream ois = null;
	ObjectOutputStream oos = null;

	//从文件夹中读取聊天消息
	@Override
	public List<Message> read() {
		check();
		List<Message> messages = new ArrayList<Message>();
		if (file_messages.length() > 0) {
			try {
				ois = new ObjectInputStream(new FileInputStream(file_messages));
				messages = (List<Message>) ois.readObject();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
		}
		return messages;
	}

	//将聊天消息写入到文件中存储
	@Override
	public void write(List<Message> messages) {
		try {
			oos = new ObjectOutputStream(new FileOutputStream(file_messages));
			oos.writeObject(messages);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
    //检查文件是否存在
	public void check() {
		if (!dir.exists()) {
			dir.mkdirs();
		}
		if (!file_messages.exists()) {
			try {
				file_messages.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
    //关闭输入输出流
	public void close() {
		if (ois != null) {
			try {
				ois.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (oos != null) {
			try {
				oos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
}
