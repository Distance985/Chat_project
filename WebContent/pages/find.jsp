<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery.js"></script>
</head>
<body style="background: url(../img/背景1.jpg) no-repeat;">
	<div align="center">
			<table style="border:0px solid black; margin-top: 350px;">
				<tr>
					<td style="color: white">请输入6位验证码：</td>
					<td><input type="text" id="a" onkeyup="value=value.replace(/[^(\d)]/g,'')" name="sss" style="opacity:0.7;border-radius: 5px 5px 5px 5px"/>
					</td>
				</tr>
				<tr>
					<td>
						<a href="../index.jsp">
							<button style="margin-left: 20px; margin-top: 40px;opacity:0.6;width: 90px;height: 30px;border-radius: 5px 5px 5px 5px">返回登录</button>
						</a>
					</td>
					<td align="center" colspan="1">
						<button id="2" style="margin-top: 40px;opacity:0.6;width: 70px;height: 30px;border-radius: 5px 5px 5px 5px">确定</button>
					</td>
				</tr>
			</table>
	</div>
	<script type="text/javascript">
	$(function(){
		$("#2").click(function(){
			var a = $("#code").val();
			var b = $("#a").val();
			if(a==b)
			{
				alert("请牢记您的密码："+$("#pwd").val());
			}
			else
			{
				alert("验证码不正确请重新输入")
			}
		});
	})
	</script>
</body>
</html>