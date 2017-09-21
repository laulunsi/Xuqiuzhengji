<%@ page import = "java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查找符合条件的需求</title>
</head>
<body>
<form id="form2" name="form2" method="post" action="xianshi.jsp">
<table border="1" width="981">
<tr>
<th>请输入查询条件：<p>标引条件：
      <select  size="1" id="biaoyintiaojian" name="biaoyintiaojian">
        <option value="institutionname">机构全称</option>
        <option value="guikouguanlibumen">归口管理单位</option>
        <option value="suozaidiyu">所在地域</option>
        <option value="farendaibiao">法人代表</option>
        <option value="contact">联系人</option>
        <option value="jigoushuxing">机构属性</option>
        <option value="demandname">技术需求名称</option>
        <option value="guanjianzi">关键字</option>
        <option value="nitouruzijinzonge">拟投入资金总额</option>
        <option value="jishuxuqiujiejuefangfa">技术需求解决方式</option>
        <option value="kejihuodongleixing">科技活动类型</option>
        <option value="xuekefenlei">学科分类</option>
        <option value="xuqiujishusuoshulingyu">需求技术所属领域</option>
        <option value="xuqiujishuyingyonghangye">需求技术应用行业</option>
      </select>
      
      <input type="text" name="shuruzhi" id="shuruzhi" />
      
      <input type="submit" name="button" id="button" value="查询" />
</th>
</tr>
</table>
</form>
<p>
<%-- <table border="1" width="981" text-align:center>
	<tr>
			<th>需求编号</th>
			<th>需求名称</th>
			<th>关键字</th>
			<th>科技活动类型</th>
			<th>功能</th>
		</tr>
	<%
        String biaoyintiaojian = request.getParameter("biaoyintiaojian");
        String shuruzhi = request.getParameter("shuruzhi");
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
	    request.setCharacterEncoding("UTF-8");
	                
	    Statement stmt = conn.createStatement();
	    String sql = "";
	    if(biaoyintiaojian == "institutionname"||biaoyintiaojian == "guikouguanlibumen"||biaoyintiaojian == "suozaidiyu"||biaoyintiaojian == "farendaibiao"||biaoyintiaojian == "contact"||biaoyintiaojian == "jigoushuxing")
	    {
	        sql = "Select * From institutioninfo where " + biaoyintiaojian + " = " + shuruzhi;
	    }
	    else
	    {
	    	sql = "Select * From demandinfo where " + biaoyintiaojian + " = " + shuruzhi;
	    }
	    ResultSet rs = stmt.executeQuery(sql);
				    while (rs.next()) 
				    {
				    	  int demandid = rs.getInt(1);
						  out.println("<tr><td>" + rs.getInt(1)+
								      "</td><td>" + rs.getString(2)+
							          "</td><td>" + rs.getString(8)+ 
						              "</td><td>" + rs.getString(12)+ 
						              "</td><td><a href='retrievedemand.jsp?demandid=" + demandid 
						              + "'>修改</a>&nbsp;<a href='deldemand.jsp?demandid=" 
							          + demandid + "'>删除</a></td></tr>");
					}
	 %>
	</table> --%>
</body>
</html>