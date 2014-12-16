<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
	<body>
  <%
    Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/labf?characterEncodeing=utf-8";
			String user = "root";
			String password = "2623628929";
			
			Connection con = DriverManager.getConnection(url, user, password);
			
			
			
			Statement stat = con.createStatement();
			
			String account = (String)session.getAttribute("account");
			String namet1 = request.getParameter("namet"); 
    		String namet2 = request.getParameter("name");
    		String workt = request.getParameter("work");
    		String url1 = request.getParameter("url1");
			String sql = "select * from tree where namet = '"+namet1+"' AND accountt = '"+account+"'";
			ResultSet rs = stat.executeQuery(sql);
			if(rs.next())
			{
				String student = rs.getString("student");
				int layer = rs.getInt("layer");
				layer--;
				if(student==null) student="/"+namet2;
				else 	student+="/"+namet2;
				out.println(student);
				String sql1 = "update tree set student='"+student+"' where accountt='"+account+"' AND namet = '"+namet1+"'";	
				stat.executeUpdate(sql1);
				String teacher ="/"+namet1;	
				String sql1t= "INSERT INTO tree(accountt,namet,workt,urlt,teacher,layer) VALUES('"+ account +"','"+ namet2 +"','"+ workt +"','"+ url1 +"','"+ teacher +"','"+ layer +"')";
				stat.executeUpdate(sql1t);
			}
			stat.close();
			con.close();
     %>
     <input type="button" onclick="change()" value="·µ»Ø"/>
    	<script type = "text/javascript">
		 	function change(){
		 		var mm="tree.jsp";
		 		window.location=mm;
		 	}
		 </script>
  </body>
</html>

