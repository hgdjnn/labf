<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>

  
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
				out.println("ע��ɹ���");
				String sql1 = "INSERT INTO pet(account,password) VALUES('" + account +"','" + pass1 +"')";
				String sql1t= "INSERT INTO tree(accountt) VALUES('"+ account +"')";
				stat.executeUpdate(sql1);
				stat.executeUpdate(sql1t);
				session.setAttribute("account", account);
				ur = "person.jsp";
			}
			else
			{
				out.println("ע��ʧ�ܣ��˺��Ѿ�����");
				ur = "index.jsp";
			}
			stat.close();
			con.close();
		 %>
		 <input type="button" onclick="change()" value="ȷ��"/>
		 <script type = "text/javascript">
		 	function change(){
		 		var mm="<%=ur%>";
		 		window.location=mm;
		 	}
		 </script>
  </body>
</html>
