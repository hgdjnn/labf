<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>

  <body>
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
    		if(loginForm.password1.value==""){
    			alert("密码确认不能为空！");
    			return;
    		}
    		if(loginForm.password.value!=loginForm.password1.value)
    		{
    			alert("2次密码不一致！"+loginForm.password.value+loginForm.password1.value);
    			return;
    		}
    		loginForm.submit();
    	}
    </script>
    <form name = "loginForm" action = "successs.jsp" method = "post">
    	请输入账号：<input name = "account" type = "text"><br>
    	请输入密码：<input name = "password" type = "password"><br>
    	再次输密码：<input name = "password1" type = "password"><br>
    	<input type = "button" value = "注册" onClick = "validate()">
    </form>
  </body>
</html>
