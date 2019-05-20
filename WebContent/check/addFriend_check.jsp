<%@page import="java.util.ArrayList"%>
<%@page import="entity.User"%>
<%@page import="java.util.List"%>
<%@page import="service.impl.IUserService"%>
<%@page import="service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    //添加好友前的验证
    
    //设置对客户端请求和数据库取值时的编码,防止因解码问题而出现乱码
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	
	String username = request.getParameter("username");
	
	User user = (User)session.getAttribute("user");
	
	UserService userService = new IUserService();
	List<User> users = userService.listUsers();
	User friend = null;
	//查到到指定用户已进行加好友的操作
	for(User u: users) {
		if(u.getUsername().equals(username)) {
			friend = u;
			break;
		}
	}
	
	//列出用户当前所拥有的好友
	List<User> friends = User.friends.get(user.getUsername());
	if(friends == null) {
		friends = new ArrayList<User>();
	}
	boolean flag = true;
	for(User u:friends) {
		if(u.getUsername().equals(username)) {
			flag = false;
			response.getWriter().write("0"); //已经是好友
		}
	}
	//如果该好友已经添加就不用再添加了,不然就得添加
	if(flag) {
		userService.addFriend(user, friend);
		System.out.println(user.getUsername() + "加" + friend.getUsername() + "为好友");
		response.getWriter().write("1"); //添加成功
	}
	
%>