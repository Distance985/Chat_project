<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>找回密码</title>
</head>
<body>
	<div style="border: 1px solid black;">
		<form action="lib/find.jsp" method="post">
			<table border="1" align="center" width="300px" height="400px" style="margin-top: 200px"> 
				<tr >
					<td colspan="2">找回密码</td>
				</tr>
				<tr>
					<td>账&ensp;号:</td>
					<td>
						<input id="1" name="username"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button id="2" style="margin-left: 50px; margin-top: 5px;" >发送验证码到邮箱</button>
					</td>
				</tr>
			</table>
		</form>				
	</div>
</body>
</html>