<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<html>
  
  <body background="bg.jpg">
  	<div align="center">
  		<br><br><br><br><br>
    	 <form name = "loginForm" action = "change.jsp" method = "get">
    		�����������֣�<input name = "name" type = "text"><br>
    		��������ְҵ��<input name = "work" type = "text"><br>
    		�����������ӣ�<input name = "url1" type = "text"><br>
    		<input type = "submit" value = "ȷ���޸�">
    	</form>
    	<input type="button" onclick="change()" value="ȡ���޸�"/>
    	<script type = "text/javascript">
		 	function change(){
		 		var mm="person.jsp";
		 		window.location=mm;
		 	}
		 </script>
    </div>
  </body>
</html>
