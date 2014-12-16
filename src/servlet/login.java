package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import java.text.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class login extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public login() {
		super();
	}


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
		String url = "jdbc:mysql://localhost:3306/labf?characterEncodeing=utf-8";
		String user = "root";
		String password = "2623628929";
		
		Connection con = DriverManager.getConnection(url, user, password);
	
		
		
		
		
		Statement stat = con.createStatement();
		
		String account = request.getParameter("account");
		String pass1 = request.getParameter("password");
		String sql = "SELECT * FROM pet WHERE account = '"+account+"'";
		//String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		
		HttpSession session = request.getSession();
		ResultSet rs;
		rs = stat.executeQuery(sql);
		
		if(!rs.next())
		{
			response.sendRedirect("http://localhost:8084/labf/login.jsp?show=1");
		}
		else
		{
			String pass2 = rs.getString("password");
			if(pass1.equals(pass2))
			{
				session.setAttribute("account", account);
				ArrayList tree = new ArrayList();
				String sqlt = "SELECT * FROM tree WHERE accountt = '"+account+"'";
				ResultSet rss;
				rss = stat.executeQuery(sqlt);
				while(rss.next())
				{
					String namet = rss.getString("namet");
					String workt = rss.getString("workt");
					String urlt = rss.getString("urlt");
					String layer = rss.getString("layer");
					String node[] = new String[4];
					node[0]=namet;
					node[1]=workt;
					node[2]=urlt;
					node[3]=layer;
					tree.add(node);
				}
				session.setAttribute("tree", tree);
				response.sendRedirect("http://localhost:8084/labf/person.jsp");
			}
			else
			{
				response.sendRedirect("http://localhost:8084/labf/login.jsp?show=2");
			}
			
		}
		stat.close();
		con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
