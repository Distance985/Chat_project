<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.User"%>
<%@page import="java.util.List"%>
<%@page import="service.impl.IUserService"%>
<%@page import="service.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    //查找好友
	
    request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	
	String key = request.getParameter("key");
	System.out.println("key = " + key);
	
	User user = (User)session.getAttribute("user");
	System.out.println("登陆用户 = " + user.getUsername());
	
	UserService userService = new IUserService();
	List<User> users = userService.listUsers();
	
	List<User> friends = new ArrayList<User>();
	
	for(User u:users) 
	{
		if(u.getUsername().equals(user.getUsername())) 
		{
			continue;
		}
		if(u.getUsername().contains(key)) 
		{
			friends.add(u);
		}
		else if(u.getNickname().contains(key)) 
		{
			friends.add(u);
		}
	}
	
	Gson gson = new Gson();
	response.getWriter().write(gson.toJson(friends));
	
%>