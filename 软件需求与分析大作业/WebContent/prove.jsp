<%@ page import = "java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户名密码验证</title>
</head>
<body>
  <%
  String user1 = request.getParameter("user");
	int user = Integer.parseInt(user1);
	session.setAttribute("user",user);

  Connection conn2 = null;
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
  conn2=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
	request.setCharacterEncoding("UTF-8");
	Statement stmt2 = conn2.createStatement();
	String sql2 = "Select label2 From institutionreinfo where institutionnumber = '" + user  + "'";
	ResultSet rs2 = stmt2.executeQuery(sql2);
	rs2.next();
	session.setAttribute("bumen",rs2.getString(1));
	
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
		request.setCharacterEncoding("UTF-8");
		
		
		
		
		
		String pwd = request.getParameter("pwd");
		String randcode = request.getParameter("randcode");
		
		/* String label1 = request.getParameter("label");
		int label = Integer.parseInt(label1); */
		
		Statement stmt = conn.createStatement();
        String sql = "Select * From institutionreinfo";
		ResultSet rs = stmt.executeQuery(sql);
		
		/* while(rs.next())
		{
		System.out.println(rs.getString(2) + rs.getString(1));
		} */
		boolean userFlag = false;
		boolean pwFlag = false;
		/* 
		System.out.println(randcode);
		System.out.println(session.getAttribute("rand"));
		 */
		if(randcode.equals(session.getAttribute("rand")))
		{
		    while(rs.next())
		    {
			    if(user == rs.getInt(1))
			    {
				    userFlag = true;
				    if(pwd.equals(rs.getString(3)))
				    {
					    pwFlag = true;
					    String sql1 = "Select * From institutionreinfo where institutionnumber=" + user;
						ResultSet rs1 = stmt.executeQuery(sql1);
						rs1.next();
					    if(rs1.getInt(7) == 1)//管理用main4
					    {
					        response.setHeader("refresh", "0;url = main4.jsp?user=" + user);
					    }
					    else if(rs1.getInt(7) == 2)//审核人员用main3
					    {
					    	response.setHeader("refresh", "0;url = main3.jsp?user=" + user);
					    }
					    else if(rs1.getInt(7) == 3)//注册用户用main
					    {
					    	response.setHeader("refresh", "0;url = main.jsp?user=" + user);
					    }
					    else if(rs1.getInt(7) == 4)//部门审核人员用main5
					    {
					    	response.setHeader("refresh", "0;url = main5.jsp?user=" + user);
					    }
					    break;
				    }
			    }
		    }
		    if(!userFlag)
		    {
			    out.println("<script language='javaScript'> alert('用户不存在，请注册');</script>");
			    response.setHeader("refresh", "1;url = register.jsp");
		    }
		    else
		    {
		        if(!pwFlag)
		        {
			        out.println("<script language='javaScript'> alert('密码错误');</script>");
			        response.setHeader("refresh", "1;url = login.html");
		        }
		    }
		}
		else
		{
			out.println("<script language='javaScript'> alert('验证码错误');</script>");
		    response.setHeader("refresh", "1;url = login.html");
		}
		 stmt.close();
	%>
</body>
</html>