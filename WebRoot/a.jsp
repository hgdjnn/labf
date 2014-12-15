<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'tree.jsp' starting page</title>
    
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
　
    <link rel="StyleSheet" href="dtree.css" type="text/css" />
　　<script type="text/javascript" src="dtree.js"></script>

  </head>
<h2>Example</h2>
<div class="dtitle">
<p><a href="javascript: d.openAll();">open all</a> | <a href="javascript: d.closeAll();">close all</a></p>

	 <%
		ArrayList tree = (ArrayList)session.getAttribute("tree");
			out.println( "kh<BR>");
			if(tree==null)
			{
				tree = new ArrayList();
				session.setAttribute("tree",tree);
				out.println("kong!!!!");
			}
			else
			{
				for(int i=0;i<tree.size();i++)
				{
					String node[]=(String[])tree.get(i);
					out.println(node[0]+" "+node[1]+" "+node[2] + node[3] + "<BR>");
				}
			}
			
			
		
  	  %>
<script type="text/javascript">
<!--

		d = new dTree('d');
		
        d.add(0,-1,'请选择您需要的操作');
        <%for(int i=0;i<9;i++)
        {
        	int m=0;
        	while(m<tree.size())
        	{
        		String node[]=(String[])tree.get(i);
        		if(i<5)
        		{
        			if(i+5==Integer.parseInt(node[3]))
        			{
        				
        			}
        		}
        	}
        %>
        	d.add(<%=m%>,<%=i%>,'12');
        <%
        }
        %>
      
        
          
      
document.write(d);

-->
</script>
</div>
</body>
</html> 