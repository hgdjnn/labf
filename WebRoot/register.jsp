<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>

  <body>
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
    		if(loginForm.password1.value==""){
    			alert("����ȷ�ϲ���Ϊ�գ�");
    			return;
    		}
    		if(loginForm.password.value!=loginForm.password1.value)
    		{
    			alert("2�����벻һ�£�");
    			return;
    		}
    		loginForm.submit();
    	}
    </script>
    <br><br><br><br><br>
    <%
    	String show = (String)request.getParameter("show");
 		if(show.equals("1")) out.println("<script>alert('�˺��Ѿ����ڣ�')</script>");
     %>
     <div align="center">
    	<form name = "loginForm" action = "/labf/servlet/register" method = "post">
    		�������˺ţ�<input name = "account" type = "text"><br>
    		���������룺<input name = "password" type = "password"><br>
    		�ٴ������룺<input name = "password1" type = "password"><br>
    		<input type = "button" value = "ע��" onClick = "validate()">
    	</form>
    </div>
  </body>
</html>
