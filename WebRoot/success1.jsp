<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


  
  <body>
  	<%	
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/labf?characterEncodeing=utf-8";
			String user = "root";
			String password = "2623628929";
			
			Connection con = DriverManager.getConnection(url, user, password);
			
			
			
			
			Statement stat = con.createStatement();
			String ur = "a";
			String account = request.getParameter("account");
			String pass1 = request.getParameter("password");
			String sql = "SELECT * FROM pet WHERE account = '"+account+"'";
			ResultSet rs = stat.executeQuery(sql);
			if(!rs.next())
			{
				out.println("µÇÂ¼Ê§°Ü£¬¸ÃÕË»§²»´æÔÚ£¡£¡");
				ur = "index.jsp";
			}
			else
			{
				String pass2 = rs.getString("password");
				if(pass1.equals(pass2))
				{
					out.println("µÇÂ¼³É¹¦£¡");
					ur = "person.jsp";
					session.setAttribute("account", account);
				}
				else
				{
					out.println("µÇÂ¼Ê§°Ü£¡ÃÜÂë´íÎó");
					ur = "index.jsp";
				}
				
			}
			stat.close();
			con.close();
		 %>
    	<input type="button" onclick="change()" value="È·¶¨"/>
		 <script type = "text/javascript">
		 	function change(){
		 		var mm="<%=ur%>";
		 		window.location=mm;
		 	}
		 </script>
  </body>
</html>
