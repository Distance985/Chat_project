<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="service.impl.IUserService"%>
<%@page import="service.UserService"%>
<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    //进行注册前的检测,对注册信息合法性检查
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");

	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String nickname = request.getParameter("nickname");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	String sex = request.getParameter("sex");
	
    //判断信息是否填写完整	
	boolean flag = true;
	if(username.equals("") || password.equals("") || nickname.equals("") || tel.equals("") 
			|| email.equals("") || sex.equals("")) {
		flag = false;
	}
	
	if(flag) 
	{
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setNickname(nickname);
		user.setTel(tel);
		user.setEmail(email);
		user.setSex(sex);
		
		//Pattern 
		//用于创建一个正则表达式
		//也可以说创建一个匹配模式
		String check = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@qq.com$";
		Pattern regex = Pattern.compile(check);  
		Matcher matcher = regex.matcher(email);
		boolean isMatched = matcher.matches();
        //添加好友		
		if(isMatched) 
		{
			UserService userService = new IUserService();
			boolean b = userService.addUser(user);
			if(b) 
			{
				response.getWriter().write("1");
			} 
			else 
			{
				response.getWriter().write("0");
			}
		}
		else 
		{
			response.getWriter().write("-2");
		}
	} 
	else 
	{
		   response.getWriter().write("-1");
	}
%>