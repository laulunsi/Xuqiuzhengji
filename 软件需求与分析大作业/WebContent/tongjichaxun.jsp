<%@ page import = "java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
 //基础还有非基础验证*********************************************************************************
function jiancha()    
{
	 var shuruzhi = document.getElementById('shuruzhi').value;
	 if(shuruzhi != null)
	 {
		 document.getElementById("mes").innerHTML="<font color='red'></font>"; 
	   	 return true;
	 }
	 else    
	 {    
	      document.getElementById("mes").innerHTML="<font color='red'>请输入标引条件对应字段!</font>";
	      return false;    
	 }
}
 </script>
<title>查找统计条件的需求</title>
</head>
<body>
<form id="form2" name="form2" method="post" action="xianshi2.jsp">
<table border="1" width="981">
<tr>
<th>请输入查询条件
      <p>是否通过形式审核：
      <select  size="1" id="xs" name="xs">
        <option value="1">通过形式审核</option>
        <option value="2">未通过形式审核</option>
        <option value="0">未进行形式审核</option>
      </select>&nbsp;&nbsp;&nbsp;&nbsp;
      <p>是否通过部门审核：
      <select  size="1" id="bm" name="bm">
        <option value="1">通过部门审核</option>
        <option value="2">未通过部门审核</option>
        <option value="0">未进行部门审核</option>
      </select>&nbsp;&nbsp;&nbsp;&nbsp;
      <p><input type="submit" name="button" id="button" onblur="jiancha()" value="查询" />
</th>
</tr>
</table>
</form>
<p>
</body>
</html>