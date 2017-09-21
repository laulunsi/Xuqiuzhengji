<%@ page import = "java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>需求管理</title>
<style type="text/css">
 table{
border-color: #e9e6e7;
margin: auto;
text-align:center;
}
 
 table tr:nth-child(odd){
background: #e9e6e7;
	height: 30px;
}
table tr:nth-child(even){
background:white;
	height: 30px;
}
th {
	height: 30px;
}
div{
      text-align: center;
}
 </style>
</head>
<body>
<div style=" float:left;">
<table border="1" width="981" text-align:center>
	<tr>
			<th>需求编号</th>
			<th>需求名称</th>
			<th>关键字</th>
			<th>科技活动类型</th>
			<th>审核情况</th>
			<th>功能</th>
		</tr>
	<%
	                Connection conn = null;
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
	                request.setCharacterEncoding("UTF-8");
	                
	                
	                Statement stmt = conn.createStatement();
	                String sql = "Select * From demandinfo where institutionnumber =" + session.getAttribute("user");
	        		ResultSet rs = stmt.executeQuery(sql);
				    while (rs.next()) 
				    {
				    	int demandid = rs.getInt(1);
				    	  if(rs.getInt(17) == 1)
				    	  {
						      out.println("<tr><td>" + rs.getInt(1)+
								      "</td><td>" + rs.getString(3)+
							          "</td><td>" + rs.getString(9)+ 
						              "</td><td>" + rs.getString(13)+
						              "</td><td>" + "形式审核通过"+
						              "</td><td><a href='xqxq2.jsp?demandid=" + demandid 
						              + "'>详情</a>&nbsp;<a href='deldemand.jsp?demandid=" 
							          + demandid + "'>删除</a></td></tr>");
				    	  }
				    	  else if(rs.getInt(17) == 2)
				    	  {
				    		  out.println("<tr><td>" + rs.getInt(1)+
								      "</td><td>" + rs.getString(3)+
							          "</td><td>" + rs.getString(9)+ 
						              "</td><td>" + rs.getString(13)+
						              "</td><td>" + "形式审核不通过"+
						              "</td><td><a href='xqxq2.jsp?demandid=" + demandid 
						              + "'>详情</a>&nbsp;<a href='deldemand.jsp?demandid=" 
							          + demandid + "'>删除</a></td></tr>");  
				    	  }
				    	  else if(rs.getInt(17) == 0)
				    	  {
				    		  out.println("<tr><td>" + rs.getInt(1)+
								      "</td><td>" + rs.getString(3)+
							          "</td><td>" + rs.getString(9)+ 
						              "</td><td>" + rs.getString(13)+
						              "</td><td>" + "提交形式审核未审核"+
						              "</td><td><a href='xqxq2.jsp?demandid=" + demandid 
						              + "'>详情</a>&nbsp;<a href='deldemand.jsp?demandid=" 
							          + demandid + "'>删除</a></td></tr>");  
				    	  }
				    	  else
				    	  {
				    		  out.println("<tr><td>" + rs.getInt(1)+
								      "</td><td>" + rs.getString(3)+
							          "</td><td>" + rs.getString(9)+ 
						              "</td><td>" + rs.getString(13)+
						              "</td><td>" + "保存未提交"+
						              "</td><td><a href='xqxq2.jsp?demandid=" + demandid 
						              + "'>详情</a>&nbsp;<a href='deldemand.jsp?demandid=" 
							          + demandid + "'>删除</a></td></tr>");  
				    	  }
					}
	 %>
	</table>
	</div>
	<div style=" float:right;">
	<input type="submit" name="button" style="background:#ee0000;width:100px;height:80px" id="button" value="新增需求" onclick="javascrtpt:window.location.href='tableAdd.jsp'"/>
	</div>
</body>
</html>