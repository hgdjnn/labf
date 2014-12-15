<%@ page language="java" import="java.sql.*,java.awt.*,java.awt.image.*,com.sun.image.codec.jpeg.*,java.util.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <body>
    This is my JSP page. <br>
     <%
			/*out.clear(); 
			response.setContentType("image/jpeg"); 
			response.addHeader("pragma","NO-cache");
			response.addHeader("Cache-Control","no-cache"); 
			response.addDateHeader("Expries",0);*/
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/labf?characterEncodeing=utf-8";
			String user = "root";
			String password = "2623628929";
			Connection con = DriverManager.getConnection(url, user, password);
			
			Statement stat = con.createStatement();
			String account = (String)session.getAttribute("account");
			String node[] = new String[100];
			String node1[] = new String[100];
			int x[] = new int[100];
			int y[] = new int[100];
			int i = 0, sum = 0, node1num =0;
			int layernum[] = {0,0,0,0,0,0,0,0,0,0,0};
			int layernode[] = {0,0,0,0,0,0,0,0,0,0,0};
			String sql = "select * from tree where accountt = '"+account+"'";
			ResultSet rs = stat.executeQuery(sql);
			
			while(rs.next())
			{
				String nodename = rs.getString("namet");
				String nodestu = rs.getString("student");
				String nodetea = rs.getString("teacher");
				int layer =rs.getInt("layer");
				layernum[layer]++;
				node[sum] = nodename + " " + nodetea + " " + nodestu + " " + layer;
				sum++;
			}
			
			
			
			
			int width=500,height=500; 
			BufferedImage image= new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB); 
			Graphics g = image.getGraphics(); 
			g.setColor(Color.white); 
			g.fillRect(0,0,width,height);
			g.setColor(Color.green); 
			
			//g.drawLine(20, 100, 120, 100);
			//g.drawString("OK",240,280); 
		
			
			for(int j=10;j>-1;j--)
			{
				if(layernum[j]%2==1)
				{
					for(int jj=0;jj<layernum[j];jj++)
					{
						g.fillOval(250+40*(layernum[j]-1)/2-40*jj,40*(11-j), 10, 10);
					}
				}
				else
				{
					for(int jj=0;jj<layernum[j];jj++)
					{
						g.fillOval(230+40*(layernum[j])/2-40*jj,40*(11-j), 10, 10);
					}
				}
			}
			
			
			for(i=10;i>-1;i--)
			{
				for(int ii=0;ii<sum;ii++)
				{
					String nodestr[] = node[ii].split(" ");
					if(i-Double.parseDouble(nodestr[3])<0.1&&i-Double.parseDouble(nodestr[3])>-0.1)
					{
				
						int xx=0, y1=0, m=0;
						for(int iii=0;iii<node1num;iii++)
						{
							if(nodestr[0].equals(node1[iii]))
							{
								m=1;
								xx = x[iii];
								y1 = y[iii];
							}
						}
						if(m==0)
						{
							node1[node1num]=nodestr[0];	
							y1=40*(11-i);
							if(layernum[i]%2==1) xx=250+40*(layernum[i]-1)/2-40*layernode[i];
							else xx=230+40*(layernum[i])/2-40*layernode[i];
							layernode[i]++;
							x[node1num]=xx;
							y[node1num]=y1;
							node1num++;
							
						}
						
						
						String teach[] = nodestr[1].split("/");
						for(int iii=0;iii<teach.length;iii++)
						{
							for(int iiii=0;iiii<node1num;iiii++)
							{
								if(teach[iii].equals(node1[iiii]))
								{
									g.setColor(Color.green); 
									g.drawLine(xx+5, y1+5, x[iiii]+5, y[iiii]+5);
								}
							}
						}
						
						g.setColor(Color.black); 
						g.drawString(nodestr[0],xx+10,y1+20);
					
						
						
						
					}
					
				}
			}
			
			
			g.dispose(); 
			ServletOutputStream sos = response.getOutputStream(); 
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(sos); 
			encoder.encode(image); 
			sos.close();
  	  %>
    
  </body>
</html>
