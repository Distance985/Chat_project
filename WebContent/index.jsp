<%@page import="entity.User"%>
<%@page import="dao.impl.IFriendDao"%>
<%@page import="dao.FriendDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>   
<head>        
<meta charset="utf-8" />
<title>login</title>
<link rel="stylesheet" href="css/aaa.css" type="text/css" />
<link rel="stylesheet" href="css/index.css" type="text/css" />
<script src="js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {     //设置点击事件
		$(".login_button").click(function() {                 //自定义点击事件
			var username = $("input[name='username']").val(); //获取登录用户名
			if (username == "") 
			{
				alert("账号为空！");
				return false;
			}
			var passsword = $("input[name='password']").val(); //获取登录密码
			if (passsword == "") 
			{
				alert("密码为空！");
				return false;
			}
			$.ajax({
				type:"post",
				data:{
					"username":$("input[name='username']").val(),
					"password":$("input[name='password']").val()
				},
				url:"check/login_check.jsp", //发送检查账号密码的请求
				success:function(result) 
				{
					var t =result.trim();
					if(t == "1") 
					{
						window.location.href='./pages/main.jsp'; //合法用户进入其主页
					} 
					else 
					{
						alert("账号或密码错误...");
					}
				}
			})
		});
		//设置回车键的事件
		$("body").keydown(function() {  
			var e=window.event||arguments.callee.caller.arguments[0];
            if (e.keyCode == 13) {  //keyCode=13是回车键
            	$(".login_button").click();
            }
        });
	})
</script>
</head>
<body style="background: url(img/背景3.jpg);">
<%
	FriendDao friendDao = new IFriendDao();
	User.friends = friendDao.read();
%>
	<div class="bg" >
		<div class="logo">
			<img src="img/logo.png" style="width: 100px;" />
		</div>
		<div class="title" >
			<font size="7" color="white" style="float: left; padding-left: 30px; padding-top: 20px;">点对点通信系统</font>
		</div>
		<div class="login">
			<table align="center" border="0px" style="width: 400px; height: 250px;">
				<tr>
					<td colspan="2" align="center" style="height: 30px;"><font color="white" size="5"></font></td>
				</tr>
				<tr height="50px">
					<td align="right" width="110px" style="color: white; padding-right: 10px; font-size: 25px">账号</td>
					<td align="left"><input class="input" name="username" type="text" style="border-radius: 5px 5px 5px 5px"/></td>
				</tr>
				<tr height="50px">
					<td align="right" width="110px" style="color: white; padding-right: 10px; font-size: 25px">密码</td>
					<td align="left"><input class="input" name="password" type="password" style="border-radius: 5px 5px 5px 5px"/></td>
				</tr>
				<tr height="80px">
					<td align="right"><img src="img/二维码.png" width="60px" onclick="out()" /></td>
					<td align="center">
						<button class="login_button" style="opacity: 0.6; width: 100px; height: 40px; font-size: 20px;border-radius: 4px 4px 4px 4px;">登录</button>
					</td>
				</tr>
				<tr height="100px">
					<td>
						<a href="./pages/FindPassword.jsp" style="color: white; font-size: 20px; padding-top: 15px">找回密码</a>
					</td>
					<td align="right">
					     <a href="./pages/register.jsp" style="color: white; font-size: 20px; padding-top: 15px">没有账号？点我注册</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>