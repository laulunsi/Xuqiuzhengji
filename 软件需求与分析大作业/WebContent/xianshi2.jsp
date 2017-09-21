<%@ page import = "java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>显示查找结果</title>
</head>
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
<body>
<table border="1" width="981" text-align:center>
	<tr>
			<th>需求编号</th>
			<th>需求名称</th>
			<th>关键字</th>
			<th>科技活动类型</th>
			<th>功能</th>
		</tr>
	<%
	    request.setCharacterEncoding("utf-8");
        String biaoyintiaojian = "1";
        String shuruzhi = request.getParameter("shuruzhi");
        String xs = request.getParameter("xs");
        String bm = request.getParameter("bm");
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
	    request.setCharacterEncoding("UTF-8");
	                
	    Statement stmt = conn.createStatement();
	    Statement stmt1 = conn.createStatement();
	    String sql = "";
	    if(biaoyintiaojian.equals("1"))
	    {
	    	if(xs.equals("0"))
	    	{
	    		sql = "Select * From demandinfo where shenhexs = '0' and shenhebm ='0'";
	        	ResultSet rs = stmt1.executeQuery(sql);
			    while (rs.next()) 
			    {
			    	  int demandid = rs.getInt(1);
					  out.println("<tr><td>" + rs.getInt(1)+
							      "</td><td>" + rs.getString(3)+
						          "</td><td>" + rs.getString(9)+ 
					              "</td><td>" + rs.getString(13)+ 
					              "</td><td><a href='xqxq4.jsp?demandid=" + demandid 
					              + "'>详情</a></td></tr>");
				}
			    rs.close();
	    	}
	    	else if(xs.equals("2"))
	    	{
	    		sql = "Select * From demandinfo where shenhexs = '2' and shenhebm ='0'";
	        	ResultSet rs = stmt1.executeQuery(sql);
			    while (rs.next()) 
			    {
			    	  int demandid = rs.getInt(1);
					  out.println("<tr><td>" + rs.getInt(1)+
							      "</td><td>" + rs.getString(3)+
						          "</td><td>" + rs.getString(9)+ 
					              "</td><td>" + rs.getString(13)+ 
					              "</td><td><a href='xqxq4.jsp?demandid=" + demandid 
					              + "'>详情</a></td></tr>");
				}
			    rs.close();
	    	}
	    	else
	    	{
	    	sql = "Select * From demandinfo where shenhexs = '"+ xs +"' and shenhebm ='"+ bm +"'";
	    	        	ResultSet rs = stmt1.executeQuery(sql);
	    			    while (rs.next()) 
	    			    {
	    			    	  int demandid = rs.getInt(1);
	    					  out.println("<tr><td>" + rs.getInt(1)+
	    							      "</td><td>" + rs.getString(3)+
	    						          "</td><td>" + rs.getString(9)+ 
	    					              "</td><td>" + rs.getString(13)+ 
	    					              "</td><td><a href='xqxq4.jsp?demandid=" + demandid 
	    					              + "'>详情</a></td></tr>");
	    				}
	    			    rs.close();
	    	}
	    }
	    else
	    {
	    	if(xs.equals("w"))
		    {
		    	if(bm.equals("w"))
			    {//两个意见都没有输入
		    		//按照机构信息查询，先到机构数据表中查到相关机构机构编号，再加到需求查询语句中查找相应需求
		    	    if(biaoyintiaojian.equals("institutionname")|| biaoyintiaojian.equals("guikouguanlibumen")||biaoyintiaojian.equals("suozaidiyu")||biaoyintiaojian.equals("farendaibiao")||biaoyintiaojian.equals("contact")||biaoyintiaojian.equals("jigoushuxing"))
		    	    {
		    	        String sql1 = "Select institutionnumber From institutioninfo where " + biaoyintiaojian + "='" + shuruzhi + "'";
		    	        
		    	        ResultSet rs1 = stmt.executeQuery(sql1);
		    	        while(rs1.next())
		    	        {
		    	        	sql = "Select * From demandinfo where institutionnumber ='" + rs1.getInt(1) + "'";
		    	        	ResultSet rs = stmt1.executeQuery(sql);
		    			    while (rs.next()) 
		    			    {
		    			    	  int demandid = rs.getInt(1);
		    					  out.println("<tr><td>" + rs.getInt(1)+
		    							      "</td><td>" + rs.getString(3)+
		    						          "</td><td>" + rs.getString(9)+ 
		    					              "</td><td>" + rs.getString(13)+ 
		    					              "</td><td><a href='xqxq4.jsp?demandid=" + demandid 
		    					              + "'>详情</a></td></tr>");
		    				}
		    			    rs.close();
		    	        }
		    		    rs1.close();
		    	    }
		    	    else
		    	    {
		    	    	sql = "Select * From demandinfo where " + biaoyintiaojian + "='" + shuruzhi + "'";
		    	    	ResultSet rs = stmt1.executeQuery(sql);
		    		    while (rs.next()) 
		    		    {
		    		    	  int demandid = rs.getInt(1);
		    				  out.println("<tr><td>" + rs.getInt(1)+
		    						      "</td><td>" + rs.getString(3)+
		    					          "</td><td>" + rs.getString(9)+ 
		    				              "</td><td>" + rs.getString(13)+ 
		    				              "</td><td><a href='xqxq4.jsp?demandid=" + demandid 
	    					              + "'>详情</a></td></tr>");
		    			}
		    	    }
			    }
			    else
			    {//只输入了部门意见
			    	//按照机构信息查询，先到机构数据表中查到相关机构机构编号，再加到需求查询语句中查找相应需求
				    if(biaoyintiaojian.equals("institutionname")|| biaoyintiaojian.equals("guikouguanlibumen")||biaoyintiaojian.equals("suozaidiyu")||biaoyintiaojian.equals("farendaibiao")||biaoyintiaojian.equals("contact")||biaoyintiaojian.equals("jigoushuxing"))
				    {
				        String sql1 = "Select institutionnumber From institutioninfo where " + biaoyintiaojian + "='" + shuruzhi + "'";
				        
				        ResultSet rs1 = stmt.executeQuery(sql1);
				        while(rs1.next())
				        {
				        	sql = "Select * From demandinfo where institutionnumber ='" + rs1.getInt(1) + "' and shenhebm='"+ bm +"'";
				        	ResultSet rs = stmt1.executeQuery(sql);
						    while (rs.next()) 
						    {
						    	  int demandid = rs.getInt(1);
								  out.println("<tr><td>" + rs.getInt(1)+
										      "</td><td>" + rs.getString(3)+
									          "</td><td>" + rs.getString(9)+ 
								              "</td><td>" + rs.getString(13)+ 
								              "</td><td><a href='xqxq4.jsp?demandid=" + demandid 
		    					              + "'>详情</a></td></tr>");
							}
						    rs.close();
				        }
					    rs1.close();
				    }
				    else
				    {
				    	sql = "Select * From demandinfo where " + biaoyintiaojian + "='" + shuruzhi + "' and shenhebm='"+ bm +"'";
				    	ResultSet rs = stmt1.executeQuery(sql);
					    while (rs.next()) 
					    {
					    	  int demandid = rs.getInt(1);
							  out.println("<tr><td>" + rs.getInt(1)+
									      "</td><td>" + rs.getString(3)+
								          "</td><td>" + rs.getString(9)+ 
							              "</td><td>" + rs.getString(13)+ 
							              "</td><td><a href='xqxq4.jsp?demandid=" + demandid 
	    					              + "'>详情</a></td></tr>");
						}
				    }
			    }
		    }
		    else
		    {
		    	if(bm.equals("w"))
			    {//只有形式审核意见
		    		if(biaoyintiaojian.equals("institutionname")|| biaoyintiaojian.equals("guikouguanlibumen")||biaoyintiaojian.equals("suozaidiyu")||biaoyintiaojian.equals("farendaibiao")||biaoyintiaojian.equals("contact")||biaoyintiaojian.equals("jigoushuxing"))
				    {
				        String sql1 = "Select institutionnumber From institutioninfo where " + biaoyintiaojian + "='" + shuruzhi + "'";
				        
				        ResultSet rs1 = stmt.executeQuery(sql1);
				        while(rs1.next())
				        {
				        	sql = "Select * From demandinfo where institutionnumber ='" + rs1.getInt(1) + "' and shenhexs='"+ xs +"'";
				        	ResultSet rs = stmt1.executeQuery(sql);
						    while (rs.next()) 
						    {
						    	  int demandid = rs.getInt(1);
								  out.println("<tr><td>" + rs.getInt(1)+
										      "</td><td>" + rs.getString(3)+
									          "</td><td>" + rs.getString(9)+ 
								              "</td><td>" + rs.getString(13)+ 
								              "</td><td><a href='xqxq4.jsp?demandid=" + demandid 
		    					              + "'>详情</a></td></tr>");
							}
						    rs.close();
				        }
					    rs1.close();
				    }
				    else
				    {
				    	sql = "Select * From demandinfo where " + biaoyintiaojian + "='" + shuruzhi + "' and shenhexs='"+ xs +"'";
				    	ResultSet rs = stmt1.executeQuery(sql);
					    while (rs.next()) 
					    {
					    	  int demandid = rs.getInt(1);
							  out.println("<tr><td>" + rs.getInt(1)+
									      "</td><td>" + rs.getString(3)+
								          "</td><td>" + rs.getString(9)+ 
							              "</td><td>" + rs.getString(13)+ 
							              "</td><td><a href='xqxq4.jsp?demandid=" + demandid 
	    					              + "'>详情</a></td></tr>");
						}
				    }
			    }
			    else
			    {//两种都有输入
			    	if(biaoyintiaojian.equals("institutionname")|| biaoyintiaojian.equals("guikouguanlibumen")||biaoyintiaojian.equals("suozaidiyu")||biaoyintiaojian.equals("farendaibiao")||biaoyintiaojian.equals("contact")||biaoyintiaojian.equals("jigoushuxing"))
				    {
				        String sql1 = "Select institutionnumber From institutioninfo where " + biaoyintiaojian + "='" + shuruzhi + "'";
				        
				        ResultSet rs1 = stmt.executeQuery(sql1);
				        while(rs1.next())
				        {
				        	sql = "Select * From demandinfo where institutionnumber ='" + rs1.getInt(1) + "' and shenhexs='"+ xs +"' and shenhebm='"+ bm +"'";
				        	System.out.println(sql);
				        	ResultSet rs = stmt1.executeQuery(sql);
						    while (rs.next()) 
						    {
						    	  int demandid = rs.getInt(1);
								  out.println("<tr><td>" + rs.getInt(1)+
										      "</td><td>" + rs.getString(3)+
									          "</td><td>" + rs.getString(9)+ 
								              "</td><td>" + rs.getString(13)+ 
								              "</td><td><a href='xqxq4.jsp?demandid=" + demandid 
		    					              + "'>详情</a></td></tr>");
							}
						    rs.close();
				        }
					    rs1.close();
				    }
				    else
				    {
				    	sql = "Select * From demandinfo where " + biaoyintiaojian + "='" + shuruzhi + "',shenhexs='"+ xs +"',shenhebm='"+ bm +"'";
				    	ResultSet rs = stmt1.executeQuery(sql);
					    while (rs.next()) 
					    {
					    	  int demandid = rs.getInt(1);
							  out.println("<tr><td>" + rs.getInt(1)+
									      "</td><td>" + rs.getString(3)+
								          "</td><td>" + rs.getString(9)+ 
							              "</td><td>" + rs.getString(13)+ 
							              "</td><td><a href='xqxq4.jsp?demandid=" + demandid 
	    					              + "'>详情</a></td></tr>");
						}
				    }
			    }	
		    }
	    }
	 %> 
	</table>
</body>
</html>