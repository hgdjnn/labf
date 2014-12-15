<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<html>
  
  <body background="bg.jpg">
  	<div align="center">
  		<br><br><br><br><br>
    	 <form name = "loginForm" action = "change.jsp" method = "get">
    		请输入新名字：<input name = "name" type = "text"><br>
    		请输入新职业：<input name = "work" type = "text"><br>
    		请输入新链接：<input name = "url1" type = "text"><br>
    		<input type = "submit" value = "确认修改">
    	</form>
    	<input type="button" onclick="change()" value="取消修改"/>
    	<script type = "text/javascript">
		 	function change(){
		 		var mm="person.jsp";
		 		window.location=mm;
		 	}
		 </script>
    </div>
  </body>
</html>
