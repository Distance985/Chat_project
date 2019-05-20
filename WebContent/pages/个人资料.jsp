<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>个人资料</title>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
<% //个人资料展示页面   %>

	$(function() {
		$(".b1").click(function() {
			$.ajax({
				type : "post",
				data : {
					"motto" : $(".motto").val(),
					"nickname" : $("#nickname").val(),
					"email" : $("#email").val(),
					"tel" : $("#tel").val(),
					"address" : $("#address").val()
				},
				url : "../check/personalData_check.jsp",
				success : function(result) {
					var t = result.trim();
					if(t == "1") {
						alert("修改信息成功！");
					} else {
						alert("请输入有效的邮箱")
					}
				}
			})
		})
	})
</script>
<style type="text/css">

#container {
	width: 1580px;
	height: 790px;
	background-size: cover;
}

#banner {
	padding-left: 200px;
	padding-top: 20px;
	width: 1138px;
	height: 150px;
}

.diyihang2 {
	margin-left: 200px;
	margin-top: 5px;
}

#content {
	border: 0px solid black;
	text-align: center;
	width: 1580px;
	height: 250px;
}

table {
	color: white;
	height: 200px;
}

button {
	opacity: 0.6;
	width: 100px;
	height: 40px;
	border-color: #ffffff;
}

.td {
	opacity: 0.6;
	height: 25px;
	width: 200px;
}

#links {
	width: 1340px;
	height: 100px;
}

.logo {
	float: right;
}

.bottom {
	opacity:0.9;
	border:0px solid black;
	width: 1500px;
	height: 50px;
	float: left;
	margin-left: 5px;
	margin-top: 130px;
}

</style>

</head>
<body style="background: url(../img/背景1.jpg);">
	<%
		User user = (User) session.getAttribute("user");
		String nickname = user.getNickname();
		String username = user.getUsername();
		String email = user.getEmail();
		String tel = user.getTel();
		String sex = user.getSex();
		String address = user.getAddress();
		String motto = user.getMotto();
	%>
	<div id="container">
		<div id="banner">
			<img src="../img/yonghutouxiang2.jpg" height="94px" width="95px"
				class="touxiang" style="float: left;" />
			<p class="diyihang1"
				style="float: left; margin-left: 80px; font-size: xx-large; color: white">
				<strong>点对点通信系统</strong>
			</p>
			<br>
			<p class="diyihang2"
				style="float: left; margin-left: 200px; margin-top: 20px; font-size: x-large; font-family: strong;color: white">
				个性签名:
				<%
				if (motto == null) 
				{
			    %>
				<input class="motto" value="你还没有签名哦~"
					style="opacity: 0.4; width: 200px; height: 25px;border-radius: 5px 5px 5px 5px;">
				<%
				 } 
				else {
				%>
				<input class="motto" value="<%=motto%>"
					style="opacity: 0.4; width: 200px; height: 25px;border-radius: 5px 5px 5px 5px">
				<%
					}
				%>
			</p>
		</div>
		<div id="content">
			<form>
				<table align="center">
					<tr>
						<td colspan="4" style="font-size: 30px">个人资料</td>
					</tr>
					<tr>
						<td>昵称</td>
						<td><input id="nickname" class="td" value="<%=nickname%>" style="border-radius: 5px 5px 5px 5px"/></td>
						<td>账号</td>
						<td><input type="text" class="td" disabled="disabled" value="<%=username%>"style="background-color: gray; opacity: 0.7; color: black;border-radius: 5px 5px 5px 5px" /></td>
					</tr>
					<br>
					<tr>
						<td>QQ邮箱</td>
						<td><input id="email" class="td" value="<%=email%>" type="email" style="border-radius: 5px 5px 5px 5px"/></td>
						<td>手机号码</td>
						<td><input id="tel" type="text" class="td" value="<%=tel%>" style="border-radius: 5px 5px 5px 5px"/></td>
					</tr>
					<tr>
						<td>性别</td>
						<td><input class="td" disabled="disabled" value="<%=sex%>"
							style="background-color: gray; opacity: 0.7; color: black;border-radius: 5px 5px 5px 5px" /></td>
						<td>所在地</td>
						<%
							if (address == null) {
						%>
						<td><input id="address" class="td" value="中国湖南" style="border-radius: 5px 5px 5px 5px"/></td>
						<%
							} else {
						%>
						<td><input id="address" class="td" value="<%=address%>"; style="border-radius: 5px 5px 5px 5px"/></td>
						<%
							}
						%>
					</tr>

				</table>
			</form>
		</div>
		<div id="links">
			<button type="button" style="float: left; margin-left: 625px; margin-top: 45px;border-radius: 5px 5px 5px 5px;font-size: 15px"
				class="b1">修改信息</button>
			<a href="修改密码.jsp">
				<button type="button" class="b2" style="float: right; margin-top: 45px; margin-right: 360px;border-radius: 5px 5px 5px 5px;font-size: 15px">修改密码</button>
			</a>
		</div>
		<div class="bottom">
			<a href="main.jsp">
				<button type="button" style="margin-left: 50px; margin-top: 20px;margin-left:100px;border-radius: 5px 5px 5px 5px" class="b3;">返回</button>
			</a>
			<img src="../img/logo.png" width="60px" style="margin-top: 70px;margin-right: -70px" class="logo" />
			<font style="float: right; color: white; padding-top: 25px; margin-top: 68px;margin-right: -5px">学无止境，勇攀高峰</font>
		</div>
	</div>
</body>
</html>