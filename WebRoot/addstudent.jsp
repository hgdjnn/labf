<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>

 <html>
  <body>
 		<form name = "loginForm" action = "changestu.jsp" method = "get">
 			<input type = "hidden" name = "namet" value = <%=request.getParameter("namet") %>>
    		��������ѧ�����֣�<input name = "name" type = "text"><br>
    		��������ѧ��ְҵ��<input name = "work" type = "text"><br>
    		��������ѧ�����ӣ�<input name = "url1" type = "text"><br>
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
