<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


  <body>
    This is my JSP page. <br>
     <% 
   			 Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/labf?characterEncodeing=utf-8";
			String user = "root";
			String password = "2623628929";
			
			Connection con = DriverManager.getConnection(url, user, password);
			
			
			
			Statement stat = con.createStatement();
			
			String work="",urlt="",teacher="",student="";
		    String nodename = request.getParameter("nodename");
			String sql = "select * from tree where namet = '"+nodename+"'";
			String account="11";
			ResultSet rs = stat.executeQuery(sql);
			while(rs.next())
			{
				work = rs.getString("workt");
				urlt = rs.getString("urlt");
				teacher = rs.getString("teacher");
				student = rs.getString("student");
				account = rs.getString("accountt");
				if(work==null) work="null";
				if(urlt==null) urlt="null";
				if(teacher==null) teacher="null";
				if(student==null) student="null";
				out.println("������" + nodename + "<br>");	
				out.println("������" + work + "<br>");
				out.println("��ʦ��" + teacher + "<br>");
				out.println("ѧ����" + student + "<br>");
				out.println("���ӣ�" + urlt);				
			}
			
			stat.close();
			con.close();
     %>
     <input type="button" onclick="change()" value="�鿴"/>
		 <script type = "text/javascript">
		 	function change(){
		 		var mm="<%=urlt%>";
		 		window.location=mm;
		 	}
		 </script>
		 <hr>
     <a href = "showtree2.jsp?account=<%=account%>&name=<%=nodename%>">�鿴�����ڵ�ʦ����</a>
  </body>
</html>
