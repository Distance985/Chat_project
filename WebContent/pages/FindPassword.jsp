<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$("#2").click(function() {
			var username = $("#1").val();
			if(username == "") {
				alert("请输入账号！")
				return false;
			}
			window.location.href="find.jsp?username=" + username;
		});
	});
</script>
</head>
<body style="background: url(../img/背景1.jpg) no-repeat;">
	<div style="border: 0px solid black;">
	<div style="border: 0px solid black;color: white;font-size: 50px;margin-top: 150px"align="center">找回密码</div>
			<table border="0" align="center" width="300px" style="margin-top: 50px"> 
				<tr>
				</tr>
				<tr>
					<td colspan="2" style="color: white;font-size: 20px;height: 170px"align="center">账&ensp;号:
						<input id="1" name="username" style="opacity:0.7;border-radius: 5px 5px 5px 5px"/>
					</td>
				</tr>
				<tr>
					<td>
						<a href="../index.jsp">
							<button style="width: 70px;height: 33px;opacity:0.6;
								margin-left: 25px; margin-top: 20px;border-radius: 5px 5px 5px 5px">返回</button>
						</a>
					</td>
					<td colspan="1">
						<button id="2" type="button" style="margin-left: 25px;opacity:0.6;
							margin-top: 20px;width: 130px;height: 35px;border-radius: 5px 5px 5px 5px" >发送验证码到邮箱</button>
					</td>
				</tr>
			</table>		
	</div>
</body>
</html>