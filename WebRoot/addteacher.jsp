<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>

 <html>
  <body>
 		<form name = "loginForm" action = "changetea.jsp" method = "get">
 			<input type = "hidden" name = "namet" value = <%=request.getParameter("namet") %>>
    		请输入新老师名字：<input name = "name" type = "text"><br>
    		请输入新老师职业：<input name = "work" type = "text"><br>
    		请输入新老师链接：<input name = "url1" type = "text"><br>
    		<input type = "submit" value = "确认修改">
    	</form>
    	<input type="button" onclick="change()" value="取消修改"/>
    	<script type = "text/javascript">
		 	function change(){
		 		var mm="tree.jsp";
		 		window.location=mm;
		 	}
		 </script>
  </body>
</html>
