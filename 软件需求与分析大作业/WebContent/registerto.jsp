<%@ page import = "java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
</head>
<body>
  <%
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
	    request.setCharacterEncoding("UTF-8");
	    
        String institutionname = request.getParameter("institutionname");
	    String password = request.getParameter("password");
	    String email = request.getParameter("email");
	    String contact = request.getParameter("contact");
	    String contactnumber = request.getParameter("contactnumber");
	    
	    Statement stmt = conn.createStatement();
        String sql = "Select * From institutionreinfo";
		ResultSet rs = stmt.executeQuery(sql);
		boolean existFlag = true;
		    while(rs.next())
		    {
			    if(institutionname.equals(rs.getString(2)))
			    {
				    existFlag = false;
				    out.println("<script language='javaScript'> alert('此机构已注册，点击确定回到注册页面。');</script>");
				    response.setHeader("refresh", "1;url=register.jsp");
			    }
		    }
		
		if(existFlag)
		{
		    String InsertSQL = "Insert Into institutionreinfo(institutionname,password,email,contact,contactnumber,label) Values('" + institutionname + "','" + password  + "','" + email + "','" + contact + "','" + contactnumber + "','3')";
			int i = stmt.executeUpdate(InsertSQL);
			if (i == 1)
			{
			    String SelectSQL = "select institutionnumber from institutionreinfo where institutionname = '" + institutionname + "'";
			    ResultSet rs1 = stmt.executeQuery(SelectSQL);
				rs1.next();
				out.println("<script language='javaScript'> alert('注册成功，点击确定自动进入登陆界面。您的编号为：" + rs1.getInt(1) + ",请记住您的编号还有密码，因为要用于登录');top.location='login.html';</script>");
				
			}
		}
	%>
    
</body>
</html>