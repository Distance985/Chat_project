<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
<link rel="stylesheet" href="../css/aaa.css" type="text/css" />
<link rel="stylesheet" href="../css/register.css" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$(".register_button").click(function(){
			var password1 = $("input[name='password']").val();
			var password2 = $("input[name='password2']").val();
			if (password1 != password2) {
				alert("两次密码不一致！");
				return false;
			}

			$.ajax({
				type : "post",
				data : {
					"username" : $("input[name='username']").val(),
					"password" : $("input[name='password']").val(),
					"nickname" : $("input[name='nickname']").val(),
					"tel" : $("input[name='tel']").val(),
					"email" : $("input[name='email']").val(),
					"sex" : $("select").val()
				},
				url : getRootPath() + "/check/register_check.jsp",
				success : function(result) {
					var t = result.trim(); //用于去除字符串两端的空白字符
					if (t == "1") 
					{
						alert("注册成功，前往登陆");
						window.location.href = '../index.jsp';
					} 
					else if (t == "0") 
					{
						alert("用户名已存在，请重新输入");
					} 
					else if (t == "-1") 
					{
						alert("有信息为空...请填写所有信息后再注册");
					} 
					else if (t == "-2") 
					{
						alert("请输入有效的邮箱！")
					}
				}
			})
		});
	})

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
	<div class="bg" >
		<div class="register" align="center">
		
			<table align="center" border="0px"
				style="width: 500px; height: 600px;">
				<tr>
					<td colspan="2" align="center"><font size="7" color="white">注册</font>
					</td>
				</tr>
				<tr>
					<td align="right" width="160px" style="padding-right: 10px;color: white; font-size: 20px" >账&ensp;&ensp;&ensp;&ensp;号</td>
					<td><input class="input" name="username" type="text"
						required="required" /></td>
				</tr>
				<tr>
					<td align="right" width="160px" style="padding-right: 10px;color: white; font-size: 20px">密&ensp;&ensp;&ensp;&ensp;码</td>
					<td><input class="input" name="password" type="password"
						required="required" /></td>
				</tr>
				<tr>
					<td align="right" width="160px" style="padding-right: 10px;color: white ;font-size: 20px">确认密码</td>
					<td><input class="input" name="password2" type="password"
						required="required" /></td>
				</tr>
				<tr>
					<td align="right" width="160px" style="padding-right: 10px;color: white ;font-size: 20px">昵&ensp;&ensp;&ensp;&ensp;称</td>
					<td><input class="input" name="nickname" type="text"
						required="required" /></td>
				</tr>
				<tr>
					<td align="right" width="160px" style="padding-right: 10px;color: white ;font-size: 20px">性&ensp;&ensp;&ensp;&ensp;别</td>
					<td><select style="opacity: 0.6; width: 50px;height: 30px">
							<option value="男">男</option>
							<option value="女">女</option>
					</select></td>
				</tr>
				<tr>
					<td align="right" width="160px" style="padding-right: 10px;color: white ;font-size: 20px">电话号码</td>
					<td><input class="input" name="tel" type="text"
						required="required" /></td>
				</tr>
				<tr>
					<td align="right" width="160px" style="padding-right: 10px;color: white ;font-size: 20px">QQ邮箱</td>
					<td>
						<input class="input" name="email" type="email"/>	
					</td>
				</tr>
				<tr>
					<td align="right">
						<button type="reset"
							style="opacity: 0.6; width: 100px; height: 35px;font-size: 20px">重置</button>
					</td>
					<td align="center">
						<button class="register_button"
							style="opacity: 0.6; width: 100px; height: 35px;font-size: 20px">注册</button>
					</td>
				</tr>
				<tr>
					<td align="right" colspan="2"><a href="../index.jsp"
						style="color: white; font-size: large;">返回登陆</a></td>
				</tr>
			</table>
			
		</div>
		<div class="bottom" style="margin-top: 50px;">
			<img src="../img/logo.png" style="float: right; width: 60px;" /> <font
				style="float: right; color: white; padding-top: 15px;"size="5px">学无止境，勇攀高峰</font>
		</div>
	</div>
</body>
</html>