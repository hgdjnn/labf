<%@ page language="java" import="java.sql.*,java.util.*" pageEncoding="GB18030"%>
<html>
<head>

</head>
  
  <body>
 	<font color=BLUE><strong>��ӭ��${sessionScope.account}</strong></font>
  	<br><br><br>
  	<HR style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="80%" color=#987cb9 SIZE=1>
  	<br><br>
  	  <body background="person.jpg">
  	 <%
  	 		Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/labf?characterEncodeing=utf-8";
			String user = "root";
			String password = "2623628929";
			
			Connection con = DriverManager.getConnection(url, user, password);
			
			
			
			
			Statement stat = con.createStatement();
			String ur = "a";
			String account = (String)session.getAttribute("account");
			String url1 = "no.jsp";
			String sql = "SELECT * FROM pet WHERE account='"+account+"'";
			ResultSet rs = stat.executeQuery(sql);
			if(rs.next())
			{
				String name = rs.getString("name");
				String work = rs.getString("work");
				url1 = rs.getString("url");
				
				if(name!=null){
					out.print("����������" + name + "<br>");
				}
				else out.print("������������δ��ӣ�<br>");
				if(work!=null){
					out.println("����ְҵ��" + work + "<br>");
				}
				else out.print("���Ĺ�������δ��ӣ�<br>");
				if(url1!=null){
					out.println("�������ӣ�" + url1);
				}
				else{
					url1 = "no.jsp";
					out.println("�������ӣ�" + url1);
				} 
			}
			
			
			
			
			ArrayList tree = (ArrayList)session.getAttribute("tree");
			out.println( "kh<BR>");
			if(tree==null)
			{
				tree = new ArrayList();
				session.setAttribute("tree",tree);
				out.println("kong!!!!");
			}
			else
			{
				for(int i=0;i<tree.size();i++)
				{
					String node[]=(String[])tree.get(i);
					out.println(node[0]+" "+node[1]+" "+node[2] + "<BR>");
				}
			}
			
		
  	  %>
  	  <input type="button" onclick="change()" value="�鿴"/>
		 <script type = "text/javascript">
		 	function change(){
		 		var mm="<%=url1%>";
		 		window.location=mm;
		 	}
		 </script>
  	  
  	 <br><a href = "me.jsp">�༭�ҵĸ�����Ϣ</a><br>
     <a href = "tree.jsp">�鿴�ҵ�ʦ����</a>
  	 
  </body>
</html>
