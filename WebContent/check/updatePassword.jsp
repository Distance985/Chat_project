<%@page import="java.util.List"%>
<%@page import="service.impl.IUserService"%>
<%@page import="service.UserService"%>
<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    //修改账户密码
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	
	String password = request.getParameter("password");
	String password1 = request.getParameter("password1");
	String password2 = request.getParameter("password2");
	
	User user = (User)session.getAttribute("user");
	
	if(!password1.equals(password2)) 
	{
		response.getWriter().write("-1"); //两次密码不一致
	} 
	else if(!user.getPassword().equals(password)) 
	{
		response.getWriter().write("0"); //原密码错误
	}
	else                                 //更改密码
	{
		UserService userService = new IUserService();
		user.setPassword(password1);
		userService.updateUser(user);
		response.getWriter().write("1");
	}
%>