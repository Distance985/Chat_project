<%@page import="entity.User"%>
<%@page import="java.util.List"%>
<%@page import="service.UserService"%>
<%@page import="service.impl.IUserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    //登录之前的检测
    
	UserService userService = new IUserService();
	List<User> users = userService.listUsers();
	
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	boolean flag = false;
	//判断登录信息是否正确
	for(User u:users) 
	{
		if(u.getUsername().equals(username)) 
		{
			if(u.getPassword().equals(password)) 
			{
				session.setAttribute("user", u);
				response.getWriter().write("1");
				flag = true;
				break;
			} 
			else 
			{
				response.getWriter().write("0");
				break;
			}
		}
	}
	if(!flag) 
	{
		response.getWriter().write("0");
	}
%>