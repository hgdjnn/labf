<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  
  <body background="bg.jpg">
    <script type = "text/javascript">
    	function validate(){
    		if(loginForm.account.value==""){
    			alert("�˺Ų���Ϊ�գ�");
    			return;
    		}
    		if(loginForm.password.value==""){
    			alert("���벻��Ϊ�գ�");
    			return;
    		}
    		loginForm.submit();
    	}
    </script>
    <br><br><br><br>
    <%
    	String show = (String)request.getParameter("show");
 		if(show.equals("1")) out.println("<script>alert('�˺Ų����ڣ�')</script>");
 		if(show.equals("2")) out.println("<script>alert('�������')</script>");
	%>
    <div align="center">
    	<form name = "loginForm" action = "/labf/servlet/login" method = "post">
    		�������˺ţ�<input name = "account" type = "text"><br>
    		���������룺<input name = "password" type = "password"><br>
    		<input type = "button" value = "��¼" onClick = "validate()">
    	</form>
    </div>
  </body>
</html>
