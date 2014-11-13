<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  
  <body background="bg.jpg">
    <script type = "text/javascript">
    	function validate(){
    		if(loginForm.account.value==""){
    			alert("账号不能为空！");
    			return;
    		}
    		if(loginForm.password.value==""){
    			alert("密码不能为空！");
    			return;
    		}
    		loginForm.submit();
    	}
    </script>
    <br><br><br><br>
    <%
    	String show = (String)request.getParameter("show");
 		if(show.equals("1")) out.println("<script>alert('账号不存在！')</script>");
 		if(show.equals("2")) out.println("<script>alert('密码错误！')</script>");
	%>
    <div align="center">
    	<form name = "loginForm" action = "/labf/servlet/login" method = "post">
    		请输入账号：<input name = "account" type = "text"><br>
    		请输入密码：<input name = "password" type = "password"><br>
    		<input type = "button" value = "登录" onClick = "validate()">
    	</form>
    </div>
  </body>
</html>
