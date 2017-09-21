<%@ page import = "java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息</title>
<style type="text/css">
 table{
width: 70%;
border-color: #e9e6e7;
margin: auto;
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
}
 </style>
</head>
<body>
                    <%
                    Connection conn = null;
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
	                request.setCharacterEncoding("UTF-8");
	                Statement stmt = conn.createStatement();
	                String sql = "Select * From institutioninfo where institutionnumber=" + session.getAttribute("user");
	        		ResultSet rs = stmt.executeQuery(sql);
	        		while(rs.next())
	        		{
	        		%>
<table border="1" width="981">
    <tr>
	<td width="20%">信息</td>
	<td width="80%">内容</td>
	</tr>
	<tr>
	<td>机构编号：</td>
	<td><%=rs.getInt(1)%></td>
	</tr>
	<tr>
	<td>机构全称：</td>
	<td><%=rs.getString(2)%></td>
	</tr>
	<tr>
	<td>电子邮箱：</td>
	<td><%=rs.getString(3)%></td>
	</tr>
	<tr>
	<td>地址：</td>
	<td><%=rs.getString(4)%></td>
	</tr>
	<tr>
	<td>联系人：</td>
	<td><%=rs.getString(5)%></td>
	</tr>
	<tr>
	<td>联系人手机号码：</td>
	<td><%=rs.getString(6)%></td>
	</tr>
	<tr>
	<td>联系人固定电话：</td>
	<td><%=rs.getString(7)%></td>
	</tr>
	<tr>
	<td>归口管理部门：</td>
	<td><%=rs.getString(8)%></td>
	</tr>
	<tr>
	<td>所在地域：</td>
	<td><%=rs.getString(9)%></td>
	</tr>
	<tr>
	<td>单位网址：</td>
	<td><%=rs.getString(10)%></td>
	</tr>
	<tr>
	<td>法人代表：</td>
	<td><%=rs.getString(11)%></td>
	</tr>
	<tr>
	<td>邮政编码：</td>
	<td><%=rs.getString(12)%></td>
	</tr>
	<tr>
	<td>联系人传真：</td>
	<td><%=rs.getString(13)%></td>
	</tr>
	<tr>
	<td>机构属性：</td>
	<td><%=rs.getString(14)%></td>
	</tr>
	<tr>
	<td>机构简介：</td>
	<td><%=rs.getString(15)%></td>
	</tr>
	</table>
	<% }%>
</body>
</html>