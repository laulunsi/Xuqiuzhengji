<%@ page import = "java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除需求</title>
</head>
<body>
<%
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
        request.setCharacterEncoding("UTF-8");
        
	    String demandid1=request.getParameter("demandid");
        int demandid = Integer.parseInt(demandid1);
        
        Statement stmt = conn.createStatement();
        String sql = "delete from demandinfo where demandnumber=" + demandid;
        int i = stmt.executeUpdate(sql);
	    if(i==1)
		{
		out.println("<script language='javaScript'> alert('删除成功，点击确定后自动跳到主页！');</script>");
		response.setHeader("refresh","1;url=xuqiuguanli.jsp");
		}
		else
		{
		out.println("<script language='javaScript'> alert('删除失败，点击确定后自动跳到主页！');</script>");
		response.setHeader("refresh","1;url=xuqiuguanli.jsp");
		}
	%>
</body>
</html>