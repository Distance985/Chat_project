<%@page import="java.util.ArrayList"%>
<%@page import="entity.Message"%>
<%@page import="java.util.List"%>
<%@page import="service.impl.IMessageService"%>
<%@page import="service.MessageService"%>
<%@page import="service.impl.IUserService"%>
<%@page import="service.UserService"%>
<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		User user = (User) session.getAttribute("user");
		String nickname = user.getNickname();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>chat</title>
<style type="text/css">
		div{
			border: 0px solid white;
		}
		#container{
			height: 760px;
			width:1510px;
	        border:0px solid black;
	        padding:10px;
	        margin-left:auto;
	        margin-right:auto;
	        
		}
		#head{
			height: 90px;
			width: 1508px;
			text-align: center;
		}
		#content{
			height: 560px;
			width: 1508px;
		}
		#left{
			float: left;
			height: 560px;
			width: 300px;
		}
		#center{
			float: left;
			height: 560px;
			width: 900px;
			overflow: auto;
		}
		#right{
			float: left;
			height: 560px;
			width: 300px;
			border-color: red;
		}
		#links{
		    height: 600px;
			width: 1508px;
			text-align: center;
		}
     	#bottom {
			height: 50px;
			margin-top: 20px;
		}
    </style>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript">
    	$(function() {
    		$(".send").click(function () {
    			$.ajax({
    				type:"post",
    				url:"../check/chat_check.jsp",
    				data: {
    					"to":'<%=request.getParameter("username") %>',
    					"message":$("input[name='message']").val()
    				},
    				success:function(result) {
    					$("#center").empty();
    					if(result.length > 0) {
    						var str="";
        					for(var i=0; i<result.length; i++) {
        						if(result[i].from == '<%=request.getParameter("username") %>') {
        							str += "<div style='width: 880px; height: 70px; color: white'>" +
												"<img src='../img/用户头像.png' style='float: left; width: 50px; margin-top: 10px; border-radius: 50px 50px 50px 50px' />"
											+"<input type='text' disabled='disabled' value='"+ result[i].content +"' style='float: left; height: 30px; width: 300px; opacity: 0.7;border-radius: 20px 20px 20px 20px; margin-top: 20px' />"	
        								 + "</div>";
        						} else {
        							str += "<div style='width: 880px; height: 70px;  color: white'>" +
												"<img src='../img/用户头像.png' style='float: right; width: 50px; margin-top: 10px; border-radius: 50px 50px 50px 50px' />"
											+	"<input type='text' disabled='disabled' value='"+ result[i].content +"' style='float: right; height: 30px; width: 300px; opacity: 0.7;border-radius: 20px 20px 20px 20px; margin-top: 20px' />"	
							 			 + "</div>";
        						}
        					}
        					$("#center").append(str);
    					}
    					var div = document.getElementById('center');
    		    		div.scrollTop = div.scrollHeight;
    		    		$(".message").attr("value","");
    				} ,
    				dataType:"json"
    			})
    		});
    		$("body").keydown(function() {
    			var e=window.event||arguments.callee.caller.arguments[0];
                if (e.keyCode == 13) {//keyCode=13是回车键
                	$(".send").click();
                }
            });
    		setInterval(fresh,2000);
    	})
    	
    	function clear() {
    		$("#center").empty();
    	}
    	
    	function fresh() {
    		$.ajax({
				type:"post",
				url:"../check/chat_check.jsp",
				data: {
					"to":'<%=request.getParameter("username") %>',
					"message":""
				},
				success:function(result) {
					$("#center").empty();
					if(result.length > 0) {
						var str="";
    					for(var i=0; i<result.length; i++) {
    						if(result[i].from == '<%=request.getParameter("username") %>') {
        							str += "<div style='width: 880px; height: 70px; color: white'>" +
												"<img src='../img/用户头像.png' style='float: left; width: 50px; margin-top: 10px; border-radius: 50px 50px 50px 50px' />"
											+"<input type='text' disabled='disabled' value='"+ result[i].content +"' style='float: left; height: 30px; width: 300px; opacity: 0.7;border-radius: 20px 20px 20px 20px; margin-top: 20px' />"	
        								 + "</div>";
        						} else {
        							str += "<div style='width: 880px; height: 70px;  color: white'>" +
												"<img src='../img/用户头像.png' style='float: right; width: 50px; margin-top: 10px; border-radius: 50px 50px 50px 50px' />"
											+	"<input type='text' disabled='disabled' value='"+ result[i].content +"' style='float: right; height: 30px; width: 300px; opacity: 0.7;border-radius: 20px 20px 20px 20px; margin-top: 20px' />"	
							 			 + "</div>";
        						}
    					}
    					$("#center").append(str);
					}
					var div = document.getElementById('center');
		    		div.scrollTop = div.scrollHeight;
				} ,
				dataType:"json"
			})
    	}
    </script>
</head>
<body style="background: url(../img/背景1.jpg) no-repeat;" onload="fresh()">
	<div id="container">
		<div id="head">
			<font style="float: left; margin-left: 80px; color: white" size="20px"><%=nickname %></font>
		</div>
		<div id="links">
			<div id="content">
				<div id="left"   style="border: 1px solid white;"></div>
				<div id="center" style="border: 1px solid white;"></div>
				<div id="right"  style="border: 1px solid white;"></div>
			</div>
			<input class="message" name="message" style="width:450px;height:30px;opacity:0.7;border-radius: 5px 5px 5px 5px;" type=" text" >
			<button class="send" style="border: 0px solid white; width: 100px; height: 40px; opacity: 0.7; 
					border-radius: 5px 5px 5px 5px; font-size: 15px">发送</button>
		</div>
		<div id="bottom">
			<a href="main.jsp">
				<button style="border: 0px solid white; width: 100px; height: 40px; opacity: 0.6; 
					border-radius: 5px 5px 5px 5px; margin-top: 8px; margin-left: 80px; font-size: 15px">返回主页</button>
			</a>
			<img src="../img/logo.png" style="float: right; width: 60px; margin-top: -2px;" />
			<font style="float: right; color: white; padding-top: 20px;">学无止境，勇攀高峰</font>
		</div>
	</div>
</body>
</html>