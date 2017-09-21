<%@ page import = "java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户管理</title>
</head>
<style> 
body{ text-align:center} 
/* .div{ margin:0 auto; width:400px; height:100px; border:1px solid #F00}  */
/* css注释：为了观察效果设置宽度 边框 高度等样式 */ 
font {font-weight:bold;}
</style>
<body>
<div style="margin:0 auto;"> 
<table border="1" width="981" text-align:center>
	<tr>
			<th>用户编号</th>
			<th>用户名称</th>
			<th>用户角色</th>
			<th>功能</th>
		</tr>
	<%
	                Connection conn = null;
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
	                request.setCharacterEncoding("UTF-8");
	                
	                
	                Statement stmt = conn.createStatement();
	                String sql = "Select * From institutionreinfo";
	        		ResultSet rs = stmt.executeQuery(sql);
				    while (rs.next()) 
				    {
				    	  int userid = rs.getInt(1);
						  out.println("<tr><td>" + rs.getInt(1)+
								      "</td><td>" + rs.getString(2)+
							          "</td><td>" + "注册用户"+
						              "</td><td><a href='fuyuQjuese.jsp?userid=" + userid 
						              + "'>赋予角色</a>&nbsp;<a href='tongguoshenhe.jsp?userid=" 
							          + userid + "'>删除用户</a></td></tr>");
					}
	 %>
	</table>
</div>
</body>
</html>
