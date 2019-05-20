<%@page import="java.util.List"%>
<%@page import="service.impl.IUserService"%>
<%@page import="service.UserService"%>
<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    //删除好友
    
	String username = request.getParameter("username");
	User user = (User)session.getAttribute("user");
	
	UserService userService = new IUserService();
	List<User> users = userService.listUsers();
	User friend = new User();
	//找到指定好友
	for(User u:users) {
		if(u.getUsername().equals(username)) {
			friend = u;
			break;
		}
	}
	//进行删除
	userService.deleteFriend(user, friend);
	System.out.println(user.getUsername() + "删除好友" + friend.getUsername());
	response.getWriter().write("1");
	
%>