<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>

  
  <body>
 
  	 欢迎！${sessionScope.account}<br>
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
				
				out.print("您的姓名：" + name + "<br>");
				out.println("您的职业：" + work + "<br>");
				out.println("您的链接：" + url1);
			}
			if(url1.length()==0)
			{
				url1 = "no.jsp";
			}
  	  %>
  	  <input type="button" onclick="change()" value="查看"/>
		 <script type = "text/javascript">
		 	function change(){
		 		var mm="<%=url1%>";
		 		window.location=mm;
		 	}
		 </script>
  	  
  	 <br><a href = "me.jsp">编辑我的个人信息</a><br>
     <a href = "tree.jsp">查看我的师承树</a>
  	 
  </body>
</html>
