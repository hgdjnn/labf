<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>

  
  <body>
 
  	 ��ӭ��${sessionScope.account}<br>
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
				
				out.print("����������" + name + "<br>");
				out.println("����ְҵ��" + work + "<br>");
				out.println("�������ӣ�" + url1);
			}
			if(url1.length()==0)
			{
				url1 = "no.jsp";
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
