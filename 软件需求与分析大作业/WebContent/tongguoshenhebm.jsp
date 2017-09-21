<%@ page import = "java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>通过审核</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String demandid1 = request.getParameter("demandid");//单位编号
    String shenhejieguo = request.getParameter("shenhejieguo");//单位编号
    String tijiaobumen = (String)request.getParameter("tijiaobumen");//提交部门
    String shenheyijian = (String)request.getParameter("shenheyijian");//审核意见
    int demandid =Integer.parseInt(demandid1);
	Connection conn = null;
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
	request.setCharacterEncoding("UTF-8");
	Statement stmt = conn.createStatement();
	String sql = "update demandinfo set shenhebm = '"+ shenhejieguo +"',bmshenheyijian = '"+ shenheyijian +"' where demandnumber =" + demandid;
	System.out.println(shenhejieguo);
	int i = stmt.executeUpdate(sql);
	if (i == 1)
	{
		if(shenhejieguo.equals("1"))
		{
		out.println("<script language='javaScript'> alert('该需求已审核完成，通过！');</script>");
		response.setHeader("refresh", "1;url=weishenhebm.jsp");
		}
		else
		{
		out.println("<script language='javaScript'> alert('该需求已审核完成，结果为不通过！');</script>");
		response.setHeader("refresh", "1;url=weishenhebm.jsp");
		}
	}
	 %>
</body>
</html>