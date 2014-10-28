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
    		loginForm.submit();
    	}
    </script>
    <form name = "loginForm" action = "success1.jsp" method = "post">
    	请输入账号：<input name = "account" type = "text"><br>
    	请输入密码：<input name = "password" type = "password"><br>
    	<input type = "button" value = "登录" onClick = "validate()">
    </form>
  </body>
</html>
