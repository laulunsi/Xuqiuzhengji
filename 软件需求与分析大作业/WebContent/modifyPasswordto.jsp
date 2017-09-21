<%@ page import = "java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
</head>
<body>
 <%
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
	    request.setCharacterEncoding("UTF-8");
	    
        String oldpassword = request.getParameter("oldpassword");
	    String newpassword = request.getParameter("newpassword");
	    Statement stmt = conn.createStatement();
        String sql = "Select password From institutionreinfo where institutionnumber =" + session.getAttribute("user");
		ResultSet rs = stmt.executeQuery(sql);
		boolean existFlag = true;
		    while(rs.next())
		    {
			    if(!oldpassword.equals(rs.getString(1)))
			    {
				    existFlag = false;
				    out.println("<script language='javaScript'> alert('原密码输入不正确，请重新输入！');</script>");
				    response.setHeader("refresh", "1;url=modifyPassword.jsp");
			    }
		    }
		
		if(existFlag)
		{
		    String InsertSQL = "update institutionreinfo set password = '" + newpassword + "' where institutionnumber = '"+ session.getAttribute("user") + "'";
			int i = stmt.executeUpdate(InsertSQL);
			System.out.println(InsertSQL);
			if (i == 1)
			{
				out.println("<script language='javaScript'> alert('密码修改成功，点击确定进入主界面。');</script>");
				response.setHeader("refresh", "1;url=open.html");
			}
		}
	%>
</body>
</html>