<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="service.impl.IUserService"%>
<%@page import="service.UserService"%>
<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");

	String motto = request.getParameter("motto");
	String nickname = request.getParameter("nickname");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	
	String check = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@qq.com$";
	Pattern regex = Pattern.compile(check);    
	Matcher matcher = regex.matcher(email);
	boolean isMatched = matcher.matches();
	
	if(isMatched) {
		User user = (User)session.getAttribute("user");
		user.setMotto(motto);
		user.setNickname(nickname);
		user.setEmail(email);
		user.setTel(tel);
		user.setAddress(address);
		
		UserService userService = new IUserService();
		userService.updateUser(user);
		
		response.getWriter().write("1");
	}

%>