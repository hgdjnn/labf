<%@ page language="java" import="java.sql.*,java.awt.*,java.awt.image.*,com.sun.image.codec.jpeg.*,java.util.*" pageEncoding="GB18030"%>

<html>
<head>
<script type="text/javascript">
function showCustomer()
{
var xmlhttp;   
var str = document.searchForm.name.value;
				//var mm="login.jsp";
		 		//window.location=mm; 
if (str=="")
  {
  document.getElementById("txtHint").innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("txtHint").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("POST","search.jsp?q="+str,true);
xmlhttp.send();
}
</script>
</head>
<body>


<form name="searchForm" action="" style="margin-top:15px;"> 
    		�������ѯ���֣�<input name = "name" type = "text"><br>
    		<input type = "button" value = "��ѯ" onClick = "showCustomer()"><br>
    		
    		
</form>
			

  <input type="button" onclick="addteacher()" value="��Ӹýڵ���ʦ"/>
		 <script type = "text/javascript">
		 	function addteacher(){
		 		if(document.searchForm.name.value=="")
		 		{
		 			alert("�ڵ����Ʋ���Ϊ�գ�");
    				return;
		 		}
		 		var str = document.searchForm.name.value;
		 		var mm="addteacher.jsp?namet="+str;
		 		window.location=mm;
		 	}
		 </script>
		 
	  <input type="button" onclick="addstudent()" value="��Ӹýڵ�ѧ��"/>
		 <script type = "text/javascript">
		 	function addstudent(){
		 		if(document.searchForm.name.value=="")
		 		{
		 			alert("�ڵ����Ʋ���Ϊ�գ�");
    				return;
		 		}
		 		var str = document.searchForm.name.value;
		 		var mm="addstudent.jsp?namet="+str;
		 		window.location=mm;
		 	}
		 </script>
		 
<br />
		<a href = "showtree.jsp">ͼ�λ�ʦ����</a>
<HR style="FILTER: progid:DXImageTransform.Microsoft.Glow(color=#987cb9,strength=10)" width="80%" color=#987cb9 SIZE=1>
<div id="txtHint">�ͻ���Ϣ���ڴ˴��г� ...</div>
<body background="tree.jpg">

</body>
</html>