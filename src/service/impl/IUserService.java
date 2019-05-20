package service.impl;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import dao.FriendDao;
import dao.UserDao;
import dao.impl.IFriendDao;
import dao.impl.IUserDao;
import entity.User;
import service.UserService;

/*
 * 1、类名:用户服务类
 * 2、方法:删除用户、增加用户、为用户添加好友、为用户删除好友、查找用户、更新用户列表、获取好友列表
 */

public class IUserService implements UserService {
	
	UserDao userDao = new IUserDao();
	FriendDao friendDao = new IFriendDao();

	@Override
	public boolean addUser(User user) {
		List<User> users = userDao.read();
		//判断用户是否存在
		for(User u:users) {
			if(u.getUsername().equals(user.getUsername())){
				return false;
			}
		}
		//添加唯一id
		UUID uuid = UUID.randomUUID();
		user.setId(uuid.getLeastSignificantBits());
		user.setAddress("中国湖南");
		users.add(user);
		userDao.write(users);
		System.out.println("添加了新用户");
		return true;
	}

	//删除指定用户
	@Override
	public void deleteUser(User user) {
		List<User> users = userDao.read();
		users.remove(user);
		userDao.write(users);
		System.out.println("删除了用户");
	}

	//为用户增加好友
	@Override
	public void addFriend(User user, User friend) {
		List<User> us = User.friends.get(user.getUsername());
		if(us == null) {
			us = new ArrayList<User>();
		}
		List<User> fs = User.friends.get(friend.getUsername());
		if(fs == null) {
			fs = new ArrayList<User>();
		}
		
		//双向添加好友
		us.add(friend);
		fs.add(user);
		//双向添加好友
		User.friends.put(user.getUsername(), us);
		User.friends.put(friend.getUsername(), fs);
		
		friendDao.write(User.friends);
		System.out.println("添加好友成功");
	}

	//为用户删除好友
	@Override
	public void deleteFriend(User user, User friend) {
		List<User> us = User.friends.get(user.getUsername());
		List<User> fs = User.friends.get(friend.getUsername());
		
		//双向删除好友
		for(int i=0; i<us.size(); i++) {
			User u = us.get(i);
			if(u.getUsername().equals(friend.getUsername())) {
				us.remove(u);
				break;
			}
		}
		for(int i=0; i<fs.size(); i++) {
			User u = fs.get(i);
			if(u.getUsername().equals(user.getUsername())) {
				fs.remove(u);
				break;
			}
		}
		
		friendDao.write(User.friends);
		System.out.println("删除好友成功");
	}

	//获取目前已有用户的列表
	@Override
	public List<User> listUsers() {
		return userDao.read();
	}

	//更新指定用户的信息
	@Override
	public void updateUser(User user) {
		List<User> users = userDao.read();
		User t = null;
		for(User u:users) {
			if(u.getUsername().equals(user.getUsername())) {
				t=u;
				break;
			}
		}
		users.remove(t);
		users.add(user);
		userDao.write(users);
		System.out.println("修改用户信息成功!");
	}

	//根据用户名查找好友
	@Override
	public User findUser(String username) {
		List<User> users = userDao.read();
		User t = null;
		for(User u:users) {
			if(u.getUsername().equals(username)) {
				t=u;
				break;
			}
		}
		return t;
	}

}
