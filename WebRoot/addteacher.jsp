<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>

 <html>
  <body>
 		<form name = "loginForm" action = "changetea.jsp" method = "get">
 			<input type = "hidden" name = "namet" value = <%=request.getParameter("namet") %>>
    		����������ʦ���֣�<input name = "name" type = "text"><br>
    		����������ʦְҵ��<input name = "work" type = "text"><br>
    		����������ʦ���ӣ�<input name = "url1" type = "text"><br>
    		<input type = "submit" value = "ȷ���޸�">
    	</form>
    	<input type="button" onclick="change()" value="ȡ���޸�"/>
    	<script type = "text/javascript">
		 	function change(){
		 		var mm="tree.jsp";
		 		window.location=mm;
		 	}
		 </script>
  </body>
</html>
