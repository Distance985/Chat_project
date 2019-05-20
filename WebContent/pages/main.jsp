<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link type="text/css" href="../css/aaa.css" rel="stylesheet" />
<link type="text/css" href="../css/main.css" rel="stylesheet" />
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
		function deleteFriend(obj) {
		var tr = $(obj).parent().parent();
		var username = tr.children().eq(1).text();
		alert(username);
		$.ajax({
			type:"post",
			url:getRootPath() + "/check/deleteFriend_check.jsp",
			data: {
				"username":username
			},
			success:function(result) {
				var t = result.trim();
				if(t == "1") {
					alert("删除成功");
					window.location.href="main.jsp";
				} else {
					alert("删除失败，请稍后再试");
				}
			}
		})
	}
	
	function chat(obj) {
		var tr = $(obj).parent().parent();
		var username = tr.children().eq(1).text();
		window.location.href="chat.jsp?username=" + username;
	}
	
	function getRootPath() {
		var curWwwPath = window.document.location.href;
		var pathName = window.document.location.pathname;
		var pos = curWwwPath.indexOf(pathName);
		var localhostPaht = curWwwPath.substring(0, pos);
		var projectName = pathName.substring(0,pathName.substr(1).indexOf('/') + 1);
		return (localhostPaht + projectName);
	}
</script>
</head>
<body style="background: url(../img/背景1.jpg) no-repeat;">
	<div class="bg"
		style="margin-top: 8px;margin-left: 8px">
		<div class="top">
			<font class="title" size="7" color="white">点对点通信系统</font>
			<img class="head" src="../img/用户头像.png" />
			<a href="个人资料.jsp">
<% 
	User user = (User)session.getAttribute("user");
	String nickname = user.getNickname();
	List<User> friends = User.friends.get(user.getUsername());
	if(friends == null) {
		friends = new ArrayList<User>();
	}
%>
				<font class="username" size="5"><%=nickname %></font>
			</a>
		</div>
		<div class="friends">
			<font size="6" style="margin-left: 40%; color: white;">我的好友</font>
			<table border="1" bordercolor="#094E85" align="center" style="width: 680px; margin-left: 10px;margin-top: 20px">
				<tr style="height: 50px">
					<td style="width: 80px; margin-left: 0px; color: white" >昵称</td>
					<td style="width: 80px; margin-left: 0px; color: white" >账号</td>
					<td style="width: 40px; margin-left: 20px; color: white" >性别</td>
					<td style="width: 120px; margin-left: 20px; color: white" >电子邮件</td>
					<td style="width: 80px; margin-left: 20px; color: white" >聊天</td>
					<td style="width: 80px; margin-left: 20px; color: white" >删除</td>
				</tr>
<% 
	if(friends.isEmpty()) {
%>
				<tr>
					<td colspan="6" align="center" style="color: white">暂无好友，快加几个好友聊天吧~</td>
				</tr>
<%
	} else {
		for(User u:friends) {
%>
				<tr style="height: 30px;color: white">
					<td align="center"><%=u.getNickname() %></td>
					<td align="center"><%=u.getUsername() %></td>
					<td align="center"><%=u.getSex() %></td>
					<td align="center"><%=u.getEmail() %></td>
					<td align="center">
						<button class="chat" onclick="chat(this)" style="border: 1px solid white; width: 100px; height: 30px; 
							margin-left: 15px; opacity: 0.6; border-radius: 5px 5px 5px 5px; cursor: pointer;font-size: 15px">
							聊天</button>
					</td>
					<td align="center">
						<button class="delete" style="border: 1px solid white; width: 100px; height: 30px; 
							margin-left: 15px; opacity: 0.6; border-radius: 5px 5px 5px 5px; cursor: pointer;font-size: 15px"
							onclick="deleteFriend(this)">
							删除好友</button>
					</td>
				</tr>
<%
		}
	}
%>
			</table>
		</div>
		
		<div class="operation">
			<a href="addFriends.jsp">
				<button style="border: 1px solid white; width: 100px; height: 40px; opacity: 0.6; 
					border-radius: 5px 5px 5px 5px; cursor: pointer; margin-top: 8px; 
					margin-left: 100px; font-size: 15px">添加好友</button>
			</a>
			<a href="../index.jsp">
				<button style="border: 1px solid white; width: 100px; height: 40px; opacity: 0.6; 
					border-radius: 5px 5px 5px 5px; cursor: pointer; 
					margin-left: 225px; font-size: 15px">退出登录</button>
			</a>
		</div>
	</div>
</body>
</html>