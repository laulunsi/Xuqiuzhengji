<%@ page import = "java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>需求详情</title>
</head>
<SCRIPT LANGUAGE="JavaScript">
	function tiaoZhuan1()
	{
		document.getElementById("shenhejieguo").value = "1";
		form2.submit();
	}
	function tiaoZhuan2()
	{ 
		document.getElementById("shenhejieguo").value = "2";
		form2.submit();
	}
 </SCRIPT>
<style type="text/css">
  /* table
  {
   style = "font-size: 24px"
  } */
 </style>
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
	        		
<form id="form2" name="form2" method="post" action="tongguoshenhe.jsp">       		
<table width="981" height="507" border="1">
  <tr>
    <td>形式审核情况</td>
    <td colspan="4">
    <%
    if(rs.getInt(17) == 1)
    {
    	out.println("已审核，结果为通过！");
    }
    else if(rs.getInt(17) == 2)
    {
    	out.println("已审核，结果为未通过！");
    }
    else
    {
    	out.println("未审核！");
    }
    %>
    </td>
  </tr>
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
    <td height="30" colspan="5">1、主要问题</td>
  </tr>
  <tr>
    <td height="70" colspan="5"><%=rs.getString(6)%></td>
 </tr>
    <tr>
    <td height="30" colspan="5">2、技术关键</td>
  </tr>
  <tr>
    <td height="70" colspan="5"><%=rs.getString(7)%></td>
  </tr>
    <tr>
    <td height="30" colspan="5">3、预期目标</td>
  </tr>
  <tr>
    <td height="70" colspan="5"><%=rs.getString(8)%></td>
  </tr>
  <tr>
    <td colspan="5">*关键字：<%=rs.getString(9)%></td>
  </tr>
  <tr>
  <td colspan="2">拟投入资金总额</td>
    <td colspan="3"><%=rs.getString(10)%>万元</td>
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
    <td colspan="2">学科分类</td>
    <td colspan="3"><%=rs.getString(14)%></td>
  </tr>
  <tr id="suoshulingyu"  style="display:none">
    <td colspan="2">需求技术所属领域</td>
    <td colspan="3"><%=rs.getString(15)%></td>
  </tr>
  <tr id="yingyonghangye">
    <td colspan="2">需求技术应用行业</td>
    <td colspan="3"><%=rs.getString(16)%></td>
  </tr>
  <tr>
  <td colspan="2">审核意见</td>
  <td colspan="3">
   <textarea name="shenheyijian" id="shenheyijian" style="width:750px;height:70px" required></textarea>
  </td>  
  </tr>
   <tr>
  <td colspan="2">提交部门</td>
  <td colspan="3">
   <select  size="1" id="tijiaobumen" name="tijiaobumen">
        <option value="办公室">办公室</option>
        <option value="人事处">人事处</option>
        <option value="机关党委">机关党委</option>
        <option value="政策法规处">政策法规处</option>
        <option value="计划财务处">计划财务处</option>
        <option value="平台与基础处">平台与基础处</option>
        <option value="国际合作处">国际合作处</option>
        <option value="高新技术处">高新技术处</option>
        <option value="农村科技处">农村科技处</option>
        <option value="社会发展处">社会发展处</option>
        <option value="成果与市场处">成果与市场处</option>
        <option value="监察室">监察室</option>
        <option value="离退休干部处">离退休干部处</option>
        <option value="半干旱中心">半干旱中心</option>
        <option value="山办">山办</option>
        <option value="机关服务中心">机关服务中心</option>
        <option value="科技研发中心">科技研发中心</option>
        <option value="科技情报研究院">科技情报研究院</option>
        <option value="器材公司">器材公司</option>
        <option value="基金办">基金办</option>
        <option value="档案馆">档案馆</option>
        <option value="科技管理信息中心">科技管理信息中心</option>
        <option value="科技投资中心">科技投资中心</option>
        <option value="成果转换中心">成果转换中心</option>
        <option value="中小企业创新资金管理中心">中小企业创新资金管理中心</option>
        <option value="对外交流中心">对外交流中心</option>
        <option value="知识产权局">知识产权局</option>
      </select>
  </td>  
  </tr>
  <tr>
  <td colspan="2">审核结果</td>
  <td colspan="3">
   <INPUT TYPE="hidden"  id = "demandid" name = "demandid" value="<%=rs.getString(1)%>">
   <INPUT TYPE="hidden"  id = "shenhejieguo" name = "shenhejieguo">
   <INPUT TYPE="button" value="通过" onclick="tiaoZhuan1()">
   <INPUT TYPE="button" value="不通过" onclick="tiaoZhuan2()">
  </td>  
  </tr>
</table>
  </form>

<% }%>
</body>
</html>