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
    		loginForm.submit();
    	}
    </script>
    <form name = "loginForm" action = "success1.jsp" method = "post">
    	�������˺ţ�<input name = "account" type = "text"><br>
    	���������룺<input name = "password" type = "password"><br>
    	<input type = "button" value = "��¼" onClick = "validate()">
    </form>
  </body>
</html>
