package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class register extends HttpServlet {

	public register() {
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
			HttpSession session = request.getSession();
			ResultSet rs = stat.executeQuery(sql);
			if(!rs.next())
			{
				String sql1 = "INSERT INTO pet(account,password) VALUES('" + account +"','" + pass1 +"')";
				String sql1t= "INSERT INTO tree(accountt,layer) VALUES('"+ account +"',5)";
				stat.executeUpdate(sql1);
				stat.executeUpdate(sql1t);
				session.setAttribute("account", account);
				response.sendRedirect("http://localhost:8084/labf/person.jsp");
			}
			else
			{
				response.sendRedirect("http://localhost:8084/labf/register.jsp?show=1");
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
