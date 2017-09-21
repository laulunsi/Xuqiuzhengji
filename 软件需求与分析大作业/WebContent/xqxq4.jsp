<%@ page import = "java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>需求详情</title>
</head>
<style type="text/css">
  /* table
  {
   style = "font-size: 24px"
  } */
  </style>
<body>
                   <%
                    Connection conn = null;
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
	                request.setCharacterEncoding("UTF-8");
	                
	                String demandid1 = request.getParameter("demandid");
	                int demandid = Integer.parseInt(demandid1);
	                Statement stmt = conn.createStatement();
	                String sql = "Select * From demandinfo where demandnumber=" + demandid;
	        		ResultSet rs = stmt.executeQuery(sql);
	        		while(rs.next())
	        		{
	        		%>
	        		
<table width="981" height="507" border="1">
  <tr>
    <td>*技术需求名称</td>
    <td><%=rs.getString(3)%></td>
    <td>*需求时限</td>
    <td>开始年限：<%=rs.getString(4)%></td>
    <td>到期年限：<%=rs.getString(5)%></td>
  </tr>
  <tr>
    <td colspan="5">*技术需求概述（分为三部分）</td>
  </tr>
  <tr>
    <td height="30" colspan="5">1、主要问题（需要解决的重大技术问题，限500字以内）</td>
  </tr>
  <tr>
    <td height="70" colspan="5"><%=rs.getString(6)%></td>
 </tr>
    <tr>
    <td height="30" colspan="5">2、技术关键（所需的关键技术、主要指标，限500字以内）</td>
  </tr>
  <tr>
    <td height="70" colspan="5"><%=rs.getString(7)%></td>
  </tr>
    <tr>
    <td height="30" colspan="5">3、预期目标（技术创新性、经济社会效益，限500字以内）</td>
  </tr>
  <tr>
    <td height="70" colspan="5"><%=rs.getString(8)%></td>
  </tr>
  <tr>
    <td colspan="5">*关键字：<%=rs.getString(9)%></td>
  </tr>
  <tr>
  <td colspan="2">拟投入资金总额</td>
    <td colspan="3"><%=rs.getString(10)%></td>
  </tr>
  <tr>
    <td colspan="2" rowspan="2">*技术需求解决方法</td>
    <td colspan="3"><%=rs.getString(11)%></td>
  </tr>
  <tr>
    <td colspan="2">合作意向单位</td>
    <td><%=rs.getString(12)%></td>
  </tr>
  <tr>
    <td colspan="2">*科技活动类型 </td>
    <td colspan="3"><%=rs.getString(13)%></td>
  </tr>
  <tr id = "study" >
    <td colspan="2">学科分类（限基础研究填写）</td>
    <td colspan="3"><%=rs.getString(14)%></td>
  </tr>
  <tr id="suoshulingyu"  style="display:none">
    <td colspan="2">需求技术所属领域（非基础研究填写）</td>
    <td colspan="3"><%=rs.getString(15)%></td>
  </tr>
  <tr id="yingyonghangye">
    <td colspan="2">需求技术应用行业（非基础研究填写）</td>
    <td colspan="3"><%=rs.getString(16)%></td>
  </tr>
  <tr>
  </tr>
</table>
<% }%>
</body>
</html>