<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<head>
	<meta charset="UTF-8">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.4.1.min.js"></script>
	<script type="text/javascript">
	
	<% //修改密码的页面 %>
	
	$(function() {
		$("#b").click(function() {
				var password = $("input[name='pass']").val();
				var password1 = $("input[name='pass1']").val();
				var password2 = $("input[name='pass2']").val();
				if(password=="" || password1=="" || password2=="") {
					alert("内容不能为空!")
					return false;
				}
				if (password1 != password2) {
					alert("两次密码不一致！");
					return false;
				}
				$.ajax({
					type:"post",
					url:"../check/updatePassword.jsp",
					data:{
						"password":$("input[name='pass']").val(),
						"password1":$("input[name='pass1']").val(),
						"password2":$("input[name='pass2']").val()
					},
					success:function(result) {
						var t = result.trim();
						if(t == "-1")
						{
							alert("两次密码不一致！");
						} 
						else if (t == "0") 
						{
							alert("原密码错误!");
						} 
						else if(t == "1") 
						{
							alert("修改成功！请重新登录");
							window.location.href="../index.jsp";
						}
					}
				})
			});
		})
	
		</script>
		<style type="text/css">
			* 
			{
				border: 0px solid red;
			}
			#father {

				margin-top:150px;
				border: 0px solid red;
			}
			
			#son1 {
				align-content: center;
				margin-right: auto;
				margin-left: auto;
				border: 0px solid red;
			}
			
			#son4 {
				width: 400px;
				height: 40px;
				margin-right: auto;
				margin-left: auto;
				margin-top: 30px;
			}		
			table 
			{
				height: 200px;
				font-size: 25px;
				width: 400px;
				color: white;
			}
			#a{
				width:100px;
				height:40px;
				float: left;
				margin-left: 40px;
				border-radius: 5px 5px 5px 5px;
				font-size: 15px;
				opacity:0.6;
			}
			#b {
				width:100px;
				height:40px;
				float: left;
				margin-left: 120px;
				border-radius: 5px 5px 5px 5px;
				font-size: 15px;
				opacity:0.6;
			}
			img{
				margin-left: 905px;
				margin-top: 203px;
			}
		</style>
	</head>

	<body style="background: url(../img/背景1.jpg) no-repeat;">
		<div id="father">
			<div align="center" id="son1">
				<div style="margin: 30px auto;">
					<font style="color: white; font-size: 35px;">修改密码</font>
				</div>
				<table border="1px" >
					<tr>
						<td>当前密码</td>
						<td>
							<input type="password" style="width: 250px;height:25px;opacity: 0.5;" name="pass" id="pass"/>
						</td>
					</tr>
					<tr>
						<td>新密码</td>
						<td>
							<input type="password" style="width: 250px;height:25px;opacity: 0.5;" name="pass1" id="pass1"/>
						</td>
					</tr>
					<tr>
						<td>确认密码</td>
						<td>
							<input type="password" style="width: 250px;height:25px;opacity: 0.5;" name="pass2" id="pass2"/>
						</td>
					</tr>
				</table>
			</div>
			<div id="son4" style="border: 0px solid white;margin-top: 60px">
				<a href="个人资料.jsp">
					<button id="a" >返回</button>
				</a>
					<!--加一个返回到个人主页的链接  -->
				<button id="b">确认</button>
				<img src="../img/logo.png" width="80px" />	
			</div>
			</div>
	</body>

</html>