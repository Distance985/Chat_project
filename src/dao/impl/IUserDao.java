package dao.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

import dao.UserDao;
import entity.User;

//类的作用:对注册用户进行文件存储以及读出操作

public class IUserDao implements UserDao {

	String path = "C:\\Users\\19021\\Desktop";
	File dir = new File(path);
	File file_users = new File(dir, "users.txt");
	ObjectInputStream ois = null;
	ObjectOutputStream oos = null;

	//从文件中获取以及注册的用户列表
	@Override
	public List<User> read() {
		check();
		List<User> users = new ArrayList<User>();
		if (file_users.length() > 0) {
			try {
				ois = new ObjectInputStream(new FileInputStream(file_users));
				users = (List<User>) ois.readObject();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
		}
		return users;
	}

	//将当前已有的用户列表存储到文件中
	@Override
	public void write(List<User> users) {
		try {
			oos = new ObjectOutputStream(new FileOutputStream(file_users));
			oos.writeObject(users);
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
		if (!file_users.exists()) {
			try {
				file_users.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
    //关闭流
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
