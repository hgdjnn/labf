<%@ page language="java" import="java.sql.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <body>
    <%
    String name = request.getParameter("q"); 
    Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/labf?characterEncodeing=utf-8";
			String user = "root";
			String password = "2623628929";
			
			Connection con = DriverManager.getConnection(url, user, password);
			
			
			
			Statement stat = con.createStatement();
			
			String work="",urlt="",teacher="",student="";
			String account = (String)session.getAttribute("account");
			String sql = "select * from tree where namet = '"+name+"' AND accountt = '"+account+"'";
			ResultSet rs = stat.executeQuery(sql);
			while(rs.next())
			{
				work = rs.getString("workt");
				urlt = rs.getString("urlt");
				teacher = rs.getString("teacher");
				student = rs.getString("student");
				if(work==null) work="null";
				if(urlt==null) urlt="null";
				if(teacher==null) teacher="null";
				if(student==null) student="null";
				out.println("������" + name + "<br>");	
				out.println("������" + work + "<br>");
				out.println("���ӣ�" + urlt + "<br>");
				out.println("��ʦ��" + teacher + "<br>");
				out.println("ѧ����" + student + "<br><hr>");				
			}
			out.println("�����Ǹýڵ����ʦ��<br>");
			Statement stat1 = con.createStatement();
			String sql1 = "select * from tree where accountt = '"+account+"'";
			ResultSet rs1 = stat1.executeQuery(sql1);
			while(rs1.next())
			{
				String name1 = rs1.getString("namet");
				String work1 = rs1.getString("workt");
				String urlt1 = rs1.getString("urlt");
				String teacher1 = rs1.getString("teacher");
				String student1 = rs1.getString("student");
				if(student1!=null)
				{
					if(student1.contains(name))
					{
					if(work1==null) work1="null";
					if(urlt1==null) urlt1="null";
					if(teacher1==null) teacher1="null";
					if(student1==null) student1="null";
					out.println("������" + name1 + "<tr>");	
					out.println("������" + work1 + "<tr>");
					out.println("���ӣ�" + urlt1 + "<tr>");
					out.println("��ʦ��" + teacher1 + "<tr>");
					out.println("ѧ����" + student1 + "<tr><br>");
					}
				}	
			}
				out.println("<hr>�����Ǹýڵ��ѧ����<br>");
			Statement stat2 = con.createStatement();
			String sql2 = "select * from tree where accountt = '"+account+"'";
			ResultSet rs2 = stat1.executeQuery(sql1);
			while(rs2.next())
			{
				String name1 = rs2.getString("namet");
				String work1 = rs2.getString("workt");
				String urlt1 = rs2.getString("urlt");
				String teacher1 = rs2.getString("teacher");
				String student1 = rs2.getString("student");
				if(teacher1!=null)
				{
					if(teacher1.contains(name))
					{
					if(work1==null) work1="null";
					if(urlt1==null) urlt1="null";
					if(teacher1==null) teacher1="null";
					if(student1==null) student1="null";
					out.println("������" + name1 + "<tr>");	
					out.println("������" + work1 + "<tr>");
					out.println("���ӣ�" + urlt1 + "<tr>");
					out.println("��ʦ��" + teacher1 + "<tr>");
					out.println("ѧ����" + student1 + "<tr><br>");
					}
				}	
			}
			stat.close();
			con.close();
     %>
  
  </body>
</html>

