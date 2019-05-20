package dao.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.FriendDao;
import entity.User;

//类的作用:实现对注册用户的好友列表的文件存储以及读出工作

public class IFriendDao implements FriendDao {
	
	String path = "C:\\Users\\19021\\Desktop";
	File dir = new File(path);
	File file_friends = new File(dir, "friends.txt");
	ObjectInputStream ois = null;
	ObjectOutputStream oos = null;

	//读取用户的好友列表
	@Override
	public Map<String, List<User>> read() {
		check();
		Map<String, List<User>> friends = new HashMap<String, List<User>>();
		if (file_friends.length() > 0) {
			try {
				ois = new ObjectInputStream(new FileInputStream(file_friends));
				friends = (Map<String, List<User>>) ois.readObject();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
		}
		return friends;
	}

	//将好友列表写入文件存储
	@Override
	public void write(Map<String, List<User>> friends) {
		try {
			oos = new ObjectOutputStream(new FileOutputStream(file_friends));
			oos.writeObject(friends);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	//检查文件夹是否已经存在
	public void check() {
		if (!dir.exists()) {
			dir.mkdirs();
		}
		if (!file_friends.exists()) {
			try {
				file_friends.createNewFile();
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
