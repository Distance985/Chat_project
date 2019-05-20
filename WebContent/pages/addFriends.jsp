<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>addFriends</title>
<link type="text/css" href="../css/addFriends.css" rel="stylesheet" />
<link type="text/css" href="../css/aaa.css" rel="stylesheet" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$(".find").click(function() {
			if($(".key").val() == ""){
				return;
			}
			$.ajax({
				type:"post",
				url:getRootPath() + "/check/findFriend_check.jsp",
				data:{
					"key":$(".key").val()
				},
				success:function(result) {
					$("table tr:not(:first)").remove();
					if(result.length == 0) {
						var tr = "<tr><td colspan='6', align='center'>查无好友信息</td></tr>";
						$("table").append(tr);
					} else {
						var tr="";
						for(var i=0; i<result.length; i++) {
							tr += "<tr><td align='center' id='"+i+"'>"+result[i].nickname+"</td><td align='center' id='"+i+"' name='"+result[i].username+"'>"
								+result[i].username+"</td><td align='center' id='"+i+"'>"+result[i].sex
								+"</td><td align='center' id='"+i+"'>"+result[i].address+"</td><td align='center' id='"+i+"'>"+result[i].email
								+"</td><td align='center'><button onclick='addFriend(this)' class='addFriend' id='"+i+"' style='border: 1px solid white; width: 100px; height: 30px; opacity: 0.4; border-radius: 5px 5px 5px 5px; cursor: pointer;'>添加好友</botton></td></tr>";
						}
						$("table").append(tr);
					}
				},
				dataType:"json"
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
	
	function addFriend(obj) {
		var tr = $(obj).parent().parent();
		var username = tr.children().eq(1).text();
		$.ajax({
			type:"post",
			url:getRootPath() + "/check/addFriend_check.jsp",
			data: 
			{
				"username":username
			},
			success:function(result) {
				var t = result.trim();
				if(t == "0") 
				{
					alert("该用户已经是您的好友了");
				} 
				else if(t == "1") 
				{
					alert("添加成功");
				}
			}
		})
	}
</script>
</head>
<body style="background: url(../img/背景1.jpg) no-repeat;">
	<div class="bg" >

		<div id="banner">
			<br>
			<a href="main.jsp">
				<input style="font color: white; width: 100px; height: 30px; opacity: 0.6; 
					margin-left: -70px; cursor: pointer; border-radius: 5px 5px 5px 5px;"
					type="button" value="返回" />
			</a>
			<input style="border: 1px solid white; width: 400px; height: 30px; opacity: 0.5; 
				border-radius: 5px 5px 5px 5px;margin-left: 170px" type="search" class="key" placeholder="昵称/账号" />
				
			<input style="border: 1px solid white; width: 100px; height: 30px; margin-left: 200px; 
				opacity: 0.5; border-radius: 5px 5px 5px 5px; cursor: pointer;"
				type="button" class="find" value="搜索" />
		</div>

		<div id="content">
			<table border="1" bordercolor="#094E85" align="center" style="margin-left: 250px">
					<tr>
						<td align="center" style="width: 100px;color: white">昵称 </td>
						<td align="center" style="width: 100px;color: white">账号</td>
						<td align="center" style="width: 60px;color: white">性别</td>
						<td align="center" style="width: 140px;color: white">所在地</td>
						<td align="center" style="width: 120px;color: white">邮箱</td>
						<td align="center" style="width: 100px;color: white">操作</td>
					</tr>
				</table>
		</div>
		<div class="bottom" style="margin-top: 70px;">
			<img src="../img/logo.png"
				style="float: right; width: 60px; margin-top: -2px;" /> <font
				style="float: right; color: white; padding-top: 25px; margin-top: -5px">学无止境，勇攀高峰</font>
		</div>

	</div>
</body>
</html>