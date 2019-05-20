package entity;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 1、类名:用户类
 * 2、属性:用户的id、用户名、密码、昵称、性别、个性签名、电话、电子邮件、地址、好友列表
 * 3、方法:设置用户的各种信息，获取用户的信息
 */

public class User implements Serializable {

	private long id; // 用户id
	private String username; // 用户名
	private String password; // 密码
	private String nickname; // 昵称
	private String sex; // 性别
	private String motto; // 个性签名
	private String tel; // 电话
	private String email; // 电子邮件
	private String address; // 地址
	public static Map<String,List<User>> friends = new HashMap<String, List<User>>(); // 用户好友的集合

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getMotto() {
		return motto;
	}

	public void setMotto(String motto) {
		this.motto = motto;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", nickname=" + nickname
				+ ", sex=" + sex + ", motto=" + motto + ", tel=" + tel + ", email=" + email + ", address=" + address
				+ "]";
	}

}
