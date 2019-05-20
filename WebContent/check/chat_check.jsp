<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="service.impl.IMessageService"%>
<%@page import="service.MessageService"%>
<%@page import="java.util.Date"%>
<%@page import="entity.Message"%>
<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	User user = (User)session.getAttribute("user");
	String to = request.getParameter("to");
	String from = user.getUsername();
	String content = request.getParameter("message");
	
	Message message = new Message();
	Date date = new Date();
	message.setFrom(from);
	message.setTo(to);
	message.setTime(date);
	message.setContent(content);
	
	MessageService messageService = new IMessageService();
	List<Message> messages = messageService.listMessage();
	
	if(!content.equals("")) {
		messages.add(message);
		messageService.saveMessage(messages);
		System.out.println("保存了一条消息");
	}
	
	List<Message> ms = new ArrayList<Message>();
	for(Message s : messages) {
		if(s.getFrom().equals(from)&&s.getTo().equals(to) || s.getFrom().equals(to)&&s.getTo().equals(from)) {
			ms.add(s);
		}
	}
	
	Gson gson = new Gson();
	
	response.getWriter().write(gson.toJson(ms));
		
%>