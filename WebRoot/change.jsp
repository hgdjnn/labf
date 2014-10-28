<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>

  
  <body>
    <%	
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/labf?characterEncodeing=utf-8";
			String user = "root";
			String password = "2623628929";
			
			Connection con = DriverManager.getConnection(url, user, password);
			
			Statement stat = con.createStatement();
			String name = request.getParameter("name");
			String work = request.getParameter("work");
			String url1 = request.getParameter("url1");
			String account = (String)session.getAttribute("account");
			if(name!=null)
			{
				String sql = "update pet set name='"+name+"' where account='"+account+"'";
				stat.executeUpdate(sql);
			}
			if(work!=null)
			{
				String sql = "update pet set work='"+work+"' where account='"+account+"'";
				stat.executeUpdate(sql);
			}
			if(url!=null)
			{
				String sql = "update pet set url='"+url1+"' where account='"+account+"'";
				stat.executeUpdate(sql);
			}
			stat.close();
			con.close();
	 %>
	 <input type="button" onclick="change()" value="È·¶¨"/>
		 <script type = "text/javascript">
		 	function change(){
		 		var mm="person.jsp";
		 		window.location=mm;
		 	}
		 </script>
  </body>
</html>
