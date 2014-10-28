<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>

  
  <body>
    <%	
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/labf?characterEncodeing=utf-8";
			String user = "root";
			String password = "2623628929";
			
			Connection con = DriverManager.getConnection(url, user, password);
			if(con!=null){
				out.print("hello");
			}else{
				out.print("no hello");
			}
			
			
			
			Statement stat = con.createStatement();
			String ur = "a";
			String account = request.getParameter("account");
			String pass1 = request.getParameter("password");
			String sql = "SELECT * FROM pet WHERE account = '"+account+"'";
			ResultSet rs = stat.executeQuery(sql);
			if(!rs.next())
			{
				out.println("注册成功！");
				String sql1 = "INSERT INTO pet(account,password) VALUES('" + account +"','" + pass1 +"')";
				stat.executeUpdate(sql1);
				session.setAttribute("account", account);
				ur = "person.jsp";
			}
			else
			{
				out.println("注册失败！账号已经存在");
				ur = "index.jsp";
			}
			stat.close();
			con.close();
		 %>
		 <input type="button" onclick="change()" value="确定"/>
		 <script type = "text/javascript">
		 	function change(){
		 		var mm="<%=ur%>";
		 		window.location=mm;
		 	}
		 </script>
  </body>
</html>
