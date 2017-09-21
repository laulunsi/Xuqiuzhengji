<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>   
<%@page import="java.util.*" %> 
<%@page import="java.text.*" %> 
<%@page import="java.util.Date"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="sanji/sanji2.js"></script>
<script type="text/javascript" src="sanji/sanji1.js"></script>
<script type="text/javascript" src="js/jquery-1.4.js"></script>
<script type="text/javascript">
	function tiaoZhuan1()
	{
		document.getElementById("tijiaoxingshi").value = "1";
		form4.submit();
	}
	function tiaoZhuan2()
	{ 
		document.getElementById("tijiaoxingshi").value = "2";
		form4.submit();
	}
 </SCRIPT>
<script type="text/javascript">
 //基础还有非基础验证*********************************************************************************
function jichu()    
{    
	study.style.display="";
    yingyonghangye.style.display="none";
	suoshulingyu.style.display="none";
}
function feijichu()    
{    
	study.style.display="none";
    yingyonghangye.style.display="";
	suoshulingyu.style.display="";
}
 </script>
<script type="text/javascript">
 //邮箱验证*********************************************************************************
function verifyAddress()    
{    
 var email = document.getElementById('email').value;    
 var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;    
 flag = pattern.test(email);    
 if(flag)    
 {    
	 document.getElementById("mes").innerHTML="<font color='red'></font>"; 
   	 return true;
 }    
 else    
 {    
  document.getElementById("mes").innerHTML="<font color='red'>邮箱格式有误!</font>";
  return false;    
 }    
} 
//手机号码验证*****************************************************************************
  function CheckPhone(){ 
    var phone = document.getElementById('contactnumber').value;
	var pattern=/^1(3|4|5|7|8)\d{9}$/;//1 然后34578中的一位，然后没有限制，符合现实
	flag=pattern.test(phone);
	if(flag)
	{
		  document.getElementById("shouji").innerHTML="<font color='red'></font>";
	   	 return true;    
		}
   else    
	 {    
	  document.getElementById("shouji").innerHTML="<font color='red'>手机号码格式错误!</font>";
	  
	  return false;    
	 
    } 
}
//电话验证*******************************************************************************
/* function checkTel(){
	 var telphone = document.getElementById('Telephone').value;  
	 var pattern = /^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}$/;
	 flag = pattern.test(telphone);
	 
	 if(flag)    
	 {    
		 document.getElementById("dianhua").innerHTML="<font color='red'></font>";
	   	 return true;    
	 }    
	 else    
	 {    
	  document.getElementById("dianhua").innerHTML="<font color='red'>电话格式有误!</font>";
	  
	  return false;    
	 }  

} */
//邮编验证*********************************************************************************
function youbiantest()    
{ 
	 var youbian = document.getElementById('postcode').value;  
	 var pattern = /^[0-9]{6}$/;
	 flag = pattern.test(youbian);
	 
	 if(flag)    
	 {    
		 document.getElementById("yb").innerHTML="<font color='red'></font>";
	   	 return true;    
	 }    
	 else    
	 {    
	  document.getElementById("yb").innerHTML="<font color='red'>邮编格式有误!</font>";
	  
	  return false;    
	 }  
}
//需求时限验证***********************************************************************
function YearYanzheng()
{
	var a = document.getElementById('startyear').value; 
	var b = document.getElementById('endyear').value;
	if(a>b)
	{
	    document.getElementById("mesyear").innerHTML="<font color='red'>请确保第一个年份小于等于第二个!</font>";
         document.getElementById("StartYear").focus();
         return false;
	}
	else
	{
		
		   document.getElementById("mesyear").innerHTML="<font color='red'></font>";
   	     return true;
	}
}

//字数限制*************************************************************
 function textCounter(field, countfield, maxlimit) {
// 函数，3个参数，表单名字，表单域元素名，限制字符；
if (field.value.length > maxlimit)
//如果元素区字符数大于最大字符数，按照最大字符数截断；
field.value = field.value.substring(0, maxlimit);
else
//在记数区文本框内显示剩余的字符数；
countfield.value = maxlimit - field.value.length;
}
//数值验证*************************************************************
 function touzi()    
{    
 var plansum = document.getElementById('PlanSum').value;    
 var pattern =/^(([1-9]\d{0,9})|0)(\.\d{1,2})?$/;    
 flag = pattern.test(plansum);    
 if(flag)    
 {    
	 document.getElementById("money").innerHTML="<font color='red'></font>";
   	 return true;    
 }    
 else    
 {    
  document.getElementById("money").innerHTML="<font color='red'>请输入数值!</font>";
  
  return false;    
 }    
} 
//输入框依次输入***********************************************************
function yici(){
var input1=document.getElementById("guanjianzi1").value;
var input2=document.getElementById("guanjianzi2").value;
var input3=document.getElementById("guanjianzi3").value;
var input4=document.getElementById("guanjianzi4").value;
var input5=document.getElementById("guanjianzi5").value;//通过id获得
if(input1=="")
 {
	guanjianzi2.readOnly=true;
	guanjianzi3.readOnly=true;
	guanjianzi4.readOnly=true;
	guanjianzi5.readOnly=true;
       
	}
	else
	{
		guanjianzi2.readOnly=false;
		
	}

 if(input2=="")
{
	guanjianzi3.readOnly=true;
	guanjianzi4.readOnly=true;
	guanjianzi5.readOnly=true;
}
else
{ 
	guanjianzi3.readOnly=false;
}
if(input3=="")
{
	guanjianzi4.readOnly=true;
	guanjianzi5.readOnly=true;
}
else
{ 
	guanjianzi4.readOnly=false;
}
if(input4=="")
{
	guanjianzi5.readOnly=true;
}
else
{ 
	guanjianzi5.readOnly=false;
}
}
   </script>
<title>填报表格</title>
</head>
<body>
<form id="form4" name="form4" method="post" action="tableXiugaito.jsp">
<table width="981" height="507" border="1">
  <tr>
    <td>*机构全称</td>
    <td>
   <%  
           Connection conn4 = null;
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           conn4=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
           request.setCharacterEncoding("UTF-8");
           String demandid = request.getParameter("tijiaoxingshi");
           
           Statement stmt4 = conn4.createStatement();
           String sql4 = "Select institutionname From institutionreinfo where institutionnumber = " + session.getAttribute("user");
   		   ResultSet rs4 = stmt4.executeQuery(sql4);
		   while(rs4.next()){
		   %>
		 <input type="text"  name="institutionname" id="institutionname" value='<%=rs4.getString(1)%>'/>
						<%
   							 }
		       rs4.close();
						%>
    </td>
    <td width="173">归口管理部门</td>
    <td colspan="2">
      <select name="guikouguanlibumen" id="guikouguanlibumen">
           <%  
           Connection conn = null;
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
           request.setCharacterEncoding("UTF-8");
           
           Statement stmt = conn.createStatement();
           String sqla = "Select guikouguanlibumen From institutioninfo where institutionnumber = " + session.getAttribute("user");
   		   ResultSet rsa = stmt.executeQuery(sqla);
   		   while(rsa.next()){
 		   %>
 		 <option value=<%=rsa.getString(1)%>><%=rsa.getString(1)%></option>
 						<%
    							 }
   		   rsa.close();
   		   
   		   String sql = "Select * From Sheet1$";
		   ResultSet rs = stmt.executeQuery(sql);
		   while(rs.next()){
		   %>
		 <option value=<%=rs.getString(1)%>><%=rs.getString(1)%></option>
						<%
   							 }
		       rs.close();
						%>
        </select> 
    </td>
  </tr>
  <tr>
    <td width="109">*通讯地址</td>
    <td width="176">
    <%  
           Connection conn5 = null;
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           conn5=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
           request.setCharacterEncoding("UTF-8");
           
           Statement stmt5 = conn5.createStatement();
           String sql5= "Select address From institutioninfo where institutionnumber = " + session.getAttribute("user");
   		   ResultSet rs5 = stmt5.executeQuery(sql5);//
   		   if(rs5.next())
   		   {
		   %>
		 <input type="text"  name="address" id="address" value='<%=rs5.getString(1)%>'/>
						<%
   		   }
   		   else{  
   		   %>
   			<input type="text"  name="address" id="address" />
   		   <%
   		   }
   		   
		       rs5.close();
						%>
    </td>
    <td>*所在地域</td>
    <td colspan="2">
    <select name="suozaidiyu" id="suozaidiyu">
           <%   
           Connection conn1 = null;
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           conn1=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
           request.setCharacterEncoding("UTF-8");
           
           Statement stmt1 = conn1.createStatement();
           
           String sqlb = "Select suozaidiyu From institutioninfo where institutionnumber = " + session.getAttribute("user");
   		   ResultSet rsb = stmt1.executeQuery(sqlb);
   		   while(rsb.next()){
 		   %>
 		 <option value=<%=rsb.getString(1)%>><%=rsb.getString(1)%></option>
 						<%
    							 }
   		   rsb.close();
   		   
           String sql1 = "Select * From Sheet2$";
   		   ResultSet rs1 = stmt1.executeQuery(sql1);
		 while(rs1.next()){
		 %>
		 <option value=<%=rs1.getInt(1)%>><%=rs1.getString(2)%></option>
						<%
   							 }
		       rs1.close();
						%>
        </select>
    </td>
  </tr>
  <tr>
    <td>网址</td>
    <td>
    <%  
           Connection conn10 = null;
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           conn10=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
           request.setCharacterEncoding("UTF-8");
           
           Statement stmt10 = conn10.createStatement();
           String sql10= "Select URL From institutioninfo where institutionnumber = " + session.getAttribute("user");
   		   ResultSet rs10 = stmt10.executeQuery(sql10);//
   		   if(rs10.next())
   		   {
		   %>
		 <input type="text" name="URL" id="URL" value='<%=rs10.getString(1)%>'/>
						<%
   		   }
   		   else{ 
   		   %>
   			<input type="text" name="URL" id="URL" />
   		   <%
   		   }
   		   
		       rs10.close();
						%>
    </td>
    <td>*电子信箱</td>
    <td colspan="2">
    <%  
           Connection conn9 = null;
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           conn9=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
           request.setCharacterEncoding("UTF-8");
           
           Statement stmt9 = conn9.createStatement();
           String sql9 = "Select email From institutionreinfo where institutionnumber = " + session.getAttribute("user");
   		   ResultSet rs9 = stmt9.executeQuery(sql9);
		   while(rs9.next()){
		   %>
		 <input type="text" onblur="verifyAddress()" name="email" id="email" value='<%=rs9.getString(1)%>'/><label><div id="mes" nowrap></div></label>
						<%
   							 }
		       rs9.close();
						%>
    </td>
  </tr>
  <tr>
    <td>法人代表</td>
    <td>
    <%  
           Connection conn11 = null;
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           conn11=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
           request.setCharacterEncoding("UTF-8");
           
           Statement stmt11 = conn11.createStatement();
           String sql11= "Select farendaibiao From institutioninfo where institutionnumber = " + session.getAttribute("user");
   		   ResultSet rs11 = stmt11.executeQuery(sql11);//
   		   if(rs11.next())
   		   {
		   %>
		 <input type="text" name="farendaibiao" id="farendaibiao" value='<%=rs11.getString(1)%>'/>
						<%
   		   }
   		   else{ 
   		   %>
   			<input type="text" name="farendaibiao" id="farendaibiao" />
   		   <%
   		   }
   		   
		       rs11.close();
						%></td>
    <td>邮政编码</td>
    <td colspan="2">
    <%  
           Connection conn12 = null;
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           conn12=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
           request.setCharacterEncoding("UTF-8");
           
           Statement stmt12 = conn12.createStatement();
           String sql12= "Select youzhengbianma From institutioninfo where institutionnumber = " + session.getAttribute("user");
   		   ResultSet rs12 = stmt12.executeQuery(sql12);//
   		   if(rs12.next())
   		   {
		   %>
		 <input type="text" onblur="youbiantest()" name="postcode" id="postcode" value='<%=rs12.getString(1)%>'/><label><div id="yb" nowrap></div></label>
						<%
   		   }
   		   else{ 
   		   %>
   			<input type="text" onblur="youbiantest()" name="postcode" id="postcode" /><label><div id="yb" nowrap></div></label>
   		   <%
   		   }
   		   
		       rs12.close();
						%>
    </td>
  </tr>
  <tr>
    <td>*联系人</td>
    <td><%  
           Connection conn6 = null;
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           conn6=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
           request.setCharacterEncoding("UTF-8");
           
           Statement stmt6 = conn6.createStatement();
           String sql6 = "Select contact From institutionreinfo where institutionnumber = " + session.getAttribute("user");
   		   ResultSet rs6 = stmt6.executeQuery(sql6);
		   while(rs6.next()){
		   %>
		 <input type="text" name="contact" id="contact" value='<%=rs6.getString(1)%>'/>
						<%
   							 }
		       rs6.close();
						%>
    </td>
    
    <td>固定电话</td>
    <td colspan="2">
    <%  
           Connection conn13 = null;
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           conn13=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
           request.setCharacterEncoding("UTF-8");
           
           Statement stmt13 = conn13.createStatement();
           String sql13= "Select contactnumber2 From institutioninfo where institutionnumber = " + session.getAttribute("user");
   		   ResultSet rs13 = stmt13.executeQuery(sql13);//
   		   if(rs13.next())
   		   {
		   %>
		 <input type="text" name="contactnumber2" id="contactnumber2" value='<%=rs13.getString(1)%>'/><label><div id="yb" nowrap></div></label>
						<%
   		   }
   		   else{ 
   		   %>
   			<input type="text" name="contactnumber2" id="contactnumber2" /><label><div id="yb" nowrap></div></label>
   		   <%
   		   }
   		   
		       rs13.close();
						%>
    </td>
  </tr>
  <tr>
    <td width="242">手机</td>
     <td><%  
           Connection conn7 = null;
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           conn7=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
           request.setCharacterEncoding("UTF-8");
           
           Statement stmt7 = conn7.createStatement();
           String sql7 = "Select contactnumber From institutionreinfo where institutionnumber = " + session.getAttribute("user");
   		   ResultSet rs7 = stmt7.executeQuery(sql7);
		   while(rs7.next()){
		   %>
		 <input type="text" name="contactnumber"  onblur="CheckPhone()" id="contactnumber" value='<%=rs7.getString(1)%>'/><label><div id="shouji" nowrap></div></label>
						<%
   							 }
		       rs7.close();
						%>
     </td>
    <td>传真</td>
    <td colspan="2">
    <%  
           Connection conn14 = null;
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           conn14=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
           request.setCharacterEncoding("UTF-8");
           
           Statement stmt14 = conn14.createStatement();
           String sql14= "Select contactchuanzhen From institutioninfo where institutionnumber = " + session.getAttribute("user");
   		   ResultSet rs14 = stmt14.executeQuery(sql14);//
   		   if(rs14.next())
   		   {
		   %>
		 <input type="text" name="chuanzhen" id="chuanzhen" value='<%=rs14.getString(1)%>'/><label><div id="yb" nowrap></div></label>
						<%
   		   }
   		   else{ 
   		   %>
   			<input type="text" name="chuanzhen" id="chuanzhen" /><label><div id="yb" nowrap></div></label>
   		   <%
   		   }
   		   
		       rs14.close();
						%>
    </td>
  </tr>
  <tr>
    <td>*机构属性</td>
    <td colspan="4" nowrap="nowrap">
    <%  
           Connection conn15 = null;
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           conn15=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
           request.setCharacterEncoding("UTF-8");
           
           Statement stmt15 = conn15.createStatement();
           String sql15= "Select jigoushuxing From institutioninfo where institutionnumber = " + session.getAttribute("user");
   		   ResultSet rs15 = stmt15.executeQuery(sql15);//
   		   if(rs15.next())
   		   {
   			   if(rs15.getString(1).equals("企业"))
   			   {
		         %>
		          <label>
             <span id="RadioGroup1_0">
             <input type="radio" name="RadioGroup1" value="企业" id="RadioGroup1" checked/>
                                企业</span></label>
             <span id="RadioGroup1_0">
        	 <input type="radio" name="RadioGroup1" value="高等院校" id="RadioGroup1" />
        	  高等院校</span>
        	 <span id="RadioGroup1_0">
        	 <input type="radio" name="RadioGroup1" value="研究机构" id="RadioGroup1" />
        	   研究机构</span>
        	 <span id="RadioGroup1_0">
        	 <input type="radio" name="RadioGroup1" value="其他" id="RadioGroup1" />
        	  其他</span>
				 <%
   			   }
   			   else if(rs15.getString(1).equals("研究机构"))
			   {
		         %>
		           <label>
             <span id="RadioGroup1_0">
             <input type="radio" name="RadioGroup1" value="企业" id="RadioGroup1"/>
                                企业</span></label>
             <span id="RadioGroup1_0">
        	 <input type="radio" name="RadioGroup1" value="高等院校" id="RadioGroup1" />
        	  高等院校</span>
        	 <span id="RadioGroup1_0">
        	 <input type="radio" name="RadioGroup1" value="研究机构" id="RadioGroup1"  checked/>
        	   研究机构</span>
        	 <span id="RadioGroup1_0">
        	 <input type="radio" name="RadioGroup1" value="其他" id="RadioGroup1" />
        	  其他</span>
				 <%
			   }
   			   else if(rs15.getString(1).equals("高等院校"))
			   {
		         %>
		           <label>
             <span id="RadioGroup1_0">
             <input type="radio" name="RadioGroup1" value="企业" id="RadioGroup1"/>
                                企业</span></label>
             <span id="RadioGroup1_0">
        	 <input type="radio" name="RadioGroup1" value="高等院校" id="RadioGroup1"  checked/>
        	  高等院校</span>
        	 <span id="RadioGroup1_0">
        	 <input type="radio" name="RadioGroup1" value="研究机构" id="RadioGroup1" />
        	   研究机构</span>
        	 <span id="RadioGroup1_0">
        	 <input type="radio" name="RadioGroup1" value="其他" id="RadioGroup1" />
        	  其他</span>
				 <%
			   }
   			   else
			   {
		         %>
		             <label>
             <span id="RadioGroup1_0">
             <input type="radio" name="RadioGroup1" value="企业" id="RadioGroup1"/>
                                企业</span></label>
             <span id="RadioGroup1_0">
        	 <input type="radio" name="RadioGroup1" value="高等院校" id="RadioGroup1" />
        	  高等院校</span>
        	 <span id="RadioGroup1_0">
        	 <input type="radio" name="RadioGroup1" value="研究机构" id="RadioGroup1" />
        	   研究机构</span>
        	 <span id="RadioGroup1_0">
        	 <input type="radio" name="RadioGroup1" value="其他" id="RadioGroup1" checked/>
        	  其他</span>
				 <%
			   }
   		   }
   		   
		       rs15.close();
						%>
        
      </td>
  </tr>
  <tr>
    <td height="30" colspan="5">*机构简介（主要包括基本情况、现有研究基础等，限200字以内）</td>
  </tr>
  <tr>
    <td height="70" colspan="5">
    <%  
           Connection conn16 = null;
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           conn16=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
           request.setCharacterEncoding("UTF-8");
           
           Statement stmt16 = conn16.createStatement();
           String sql16= "Select jigoujianjie From institutioninfo where institutionnumber = " + session.getAttribute("user");
   		   ResultSet rs16 = stmt16.executeQuery(sql16);//
   		   if(rs16.next())
   		   {
		   %>
		 <textarea name="jianjie" id="jianjie"  style="width:1060px;height:70px" onKeyDown="textCounter(jianjie,remLen,500);" onKeyUp="textCounter(jianjie,remLen,500);" required><%=rs16.getString(1)%></textarea>
      您还可以输入:<input name="remLen" type="text" value="500" size="5" readonly>个汉字  
      <%
   		   }
   		   else{ 
   		   %>
   			<textarea name="jianjie" id="jianjie" style="width:1060px;height:70px" onKeyDown="textCounter(jianjie,remLen,500);" onKeyUp="textCounter(jianjie,remLen,500);" required></textarea>
      您还可以输入:<input name="remLen" type="text" value="500" size="5" readonly>个汉字  
   		   <%
   		   }
   		   
		       rs16.close();
						%>
     
    </td>
  </tr>
  <tr>
    <td>*技术需求名称</td>
    <td>
    <%
    Connection connz = null;
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    connz=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
    request.setCharacterEncoding("UTF-8");
    
    Statement stmtz = connz.createStatement();
    
           String sqlz= "Select demandname From demandinfo where demandnumber = " + demandid;
           System.out.println( sqlz);
   		   ResultSet rsz = stmtz.executeQuery(sqlz);//
   		   if(rsz.next())
   		   {
		   %>
		 <input type="text" name="jishuming" id="jishuming" value='<%=rsz.getString(1)%>'/>
						<%
   		   }
   		   else{ 
   		   %>
   			<input type="text" name="jishuming" id="jishuming" />
   		   <%
   		   }
   		   
		       rsz.close();
						%></td>
    <td>*需求时限</td>
    <td>开始年限
    <select name="startyear" id="startyear">
              <%  
               Connection connc = null;
               Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
               connc=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
               request.setCharacterEncoding("UTF-8");
              
               Statement stmtc = connc.createStatement();
               String sqlc = "Select startyear From demandinfo where demandnumber = " + demandid;
      		   ResultSet rsc = stmtc.executeQuery(sqlc);
      		   while(rsc.next()){
    		   %>
    		   <option value=<%=rsc.getString(1)%>><%=rsc.getString(1)%></option>
    						<%
       							 }
      		   rsc.close();
   		       
                     StringBuffer bufYear = new StringBuffer();  
                     //下拉列表的年数  
                     for(int l=0;l<100;l++){  
                     //最小年  
                     int iYear = 2016+l;  
                     bufYear.append("<option value = '"+iYear+"'");  
                     Date date = new Date();  
                     int sYear = date.getYear();  
                     //系统时间从1900年开始  
                     int sYearc = sYear+1900;  
                     if(iYear == sYearc){   
                      }  
                     bufYear.append(" >"+iYear+"</option>\n");  
                     }  
                     out.println(bufYear.toString());  
               %>  
      </select>
    </td>
    <td>到期年限
    <select name='endyear'id="endyear" onblur="YearYanzheng()"> 
              <%
              Connection connd = null;
              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
              connd=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
              request.setCharacterEncoding("UTF-8");
             
              Statement stmtd = connd.createStatement();
              String sqld = "Select endyear From demandinfo where demandnumber = " + demandid;
     		   ResultSet rsd = stmtd.executeQuery(sqld);
     		   while(rsd.next()){
   		   %>
   		   <option value=<%=rsd.getString(1)%>><%=rsd.getString(1)%></option>
   						<%
      							 }
     		   rsd.close();
                     StringBuffer bufYear2 = new StringBuffer();  
                     //下拉列表的年数  
                     for(int l=0;l<100;l++){  
                     //最小年  
                    
                     int iYear2 = 2016+l;  
                     bufYear2.append("<option value = '"+iYear2+"'");  
                     Date date = new Date();  
                     int sYear2 = date.getYear();  
                     //系统时间从1900年开始  
                     int sYearc2 = sYear2+1900;  
                      if(iYear2 == sYearc2){   
                      }  
                     bufYear2.append(" >"+iYear2+"</option>\n");  
                     }  
                     out.println(bufYear2.toString());  
               %>  
      </select>
    <label><div id="mesyear" nowrap></div></label>
    </td>
  </tr>
  <tr>
    <td colspan="5">*技术需求概述</td>
  </tr>
  <tr>
    <td height="30" colspan="5">1、主要问题（需要解决的重大技术问题，限500字以内）</td>
  </tr>
  <tr>
    <td height="70" colspan="5">
    <% 
           Statement stmte = conn16.createStatement();
           String sqle= "Select zhuyaowenti From demandinfo where demandnumber = " + demandid;
   		   ResultSet rse = stmte.executeQuery(sqle);//
   		   if(rse.next())
   		   {
		   %>  
      <textarea type="text" name="zhuyaowenti" id="zhuyaowenti" style="width:1060px;height:70px" onKeyDown="textCounter(zhuyaowenti,remLen1,500);" onKeyUp="textCounter(zhuyaowenti,remLen1,500);" required><%=rse.getString(1)%></textarea>
      您还可以输入:<input name="remLen1" type="text" value="500" size="5" readonly>个汉字</textarea> 
      <%
   		   }
   		   else{ 
   		   %>
   			<textarea type="text" name="zhuyaowenti" id="zhuyaowenti" style="width:1060px;height:70px" onKeyDown="textCounter(zhuyaowenti,remLen1,500);" onKeyUp="textCounter(zhuyaowenti,remLen1,500);" required></textarea>
      您还可以输入:<input name="remLen1" type="text" value="500" size="5" readonly>个汉字</textarea>  
   		   <%
   		   }
   		   
		       rse.close();
						%>
    </td>
 </tr>
    <tr>
    <td height="30" colspan="5">2、技术关键（所需的关键技术、主要指标，限500字以内）</td>
  </tr>
  <tr>
    <td height="70" colspan="5">
    <% 
           Statement stmtf = conn16.createStatement();
           String sqlf= "Select jishuguanjian From demandinfo where demandnumber = " + demandid;
   		   ResultSet rsf = stmtf.executeQuery(sqlf);//
   		   if(rsf.next())
   		   {
		   %>  
      <textarea type="text" name="jishuguanjian" id="jishuguanjian" style="width:1060px;height:70px" onKeyDown="textCounter(jishuguanjian,remLen2,500);" onKeyUp="textCounter(jishuguanjian,remLen2,500);" required><%=rsf.getString(1)%></textarea>
      您还可以输入:<input name="remLen2" type="text" value="500" size="5" readonly>个汉字</textarea>  
      <%
   		   }
   		   else{ 
   		   %>
   			<textarea type="text" name="jishuguanjian" id="jishuguanjian" style="width:1060px;height:70px" onKeyDown="textCounter(jishuguanjian,remLen2,500);" onKeyUp="textCounter(jishuguanjian,remLen2,500);" required></textarea>
      您还可以输入:<input name="remLen2" type="text" value="500" size="5" readonly>个汉字</textarea>  
   		   <%
   		   }
   		   
		       rsf.close();
						%>
    </td>
  </tr>
    <tr>
    <td height="30" colspan="5">3、预期目标（技术创新性、经济社会效益，限500字以内）</td>
  </tr>
  <tr>
    <td height="70" colspan="5">
    <% 
           Statement stmtg = conn16.createStatement();
           String sqlg= "Select yuqimubiao From demandinfo where demandnumber = " + demandid;
   		   ResultSet rsg = stmtg.executeQuery(sqlg);//
   		   if(rsg.next())
   		   {
		   %>  
      <textarea type="text" name="yuqimubiao" id="yuqimubiao" style="width:1060px;height:70px" onKeyDown="textCounter(yuqimubiao,remLen3,500);" onKeyUp="textCounter(yuqimubiao,remLen3,500);" required><%=rsg.getString(1)%></textarea>
      您还可以输入:<input name="remLen3" type="text" value="500" size="5" readonly>个汉字</textarea> 
      <%
   		   }
   		   else{ 
   		   %>
      <textarea type="text" name="yuqimubiao" id="yuqimubiao" style="width:1060px;height:70px" onKeyDown="textCounter(yuqimubiao,remLen3,500);" onKeyUp="textCounter(yuqimubiao,remLen3,500);" required></textarea>
      您还可以输入:<input name="remLen3" type="text" value="500" size="5" readonly>个汉字</textarea>  
   		   <%
   		   }
   		   
		       rsg.close();
						%>
    </td>
  </tr>
  <tr>
    <td colspan="5">*关键字（请依次输入，再次输入时关键字之间请用空格隔开）
    <% 
           Statement stmth = conn16.createStatement();
           String sqlh= "Select guanjianzi From demandinfo where demandnumber = " + demandid;
   		   ResultSet rsh = stmth.executeQuery(sqlh);//
   		   String guanjianzi = "";
   		   if(rsh.next())
   		   {
   			   guanjianzi = rsh.getString(1);
   		   }
   		   
		       rsh.close();
						%>
 <input type="text" name="guanjianzi" id="guanjianzi" style="width:1060px;" value='<%=guanjianzi%>'/>
  </tr>
  <tr>
  <td colspan="2">拟投入资金总额</td>
    <td colspan="3"> 
    <%
           String sqly= "Select nitouruzijinzonge From demandinfo where demandnumber = " + demandid;
           
   		   ResultSet rsy = stmt.executeQuery(sqly);//
   		   if(rsy.next())
   		   {
		   %>
		 <input type="text" name="nitouru" id="nitouru" value='<%=rsy.getString(1)%>'/>万元
						<%
   		   }
   		   else{ 
   		   %>
   			<input type="text" name="nitouru" id="nitouru" />万元
   		   <%
   		   }
   		   
		       rsy.close();
						%></td>
    </td>
  </tr>
  <tr>
    <td colspan="2" rowspan="2">*技术需求解决方法</td>
    <td colspan="3">
    <%
           String sqlx= "Select jishuxuqiujiejuefangfa From demandinfo where demandnumber = " + demandid;
           System.out.println(sqlx);
   		   ResultSet rsx = stmt.executeQuery(sqlx);//
   		   if(rsx.next())
   		   {
   			   if(rsx.getString(1).equals("独立研发"))
   			   {
		         %>
		          <label>
        <span id="RadioGroup3_0">
        <input type="radio" name="RadioGroup3" value="独立研发" id="RadioGroup31" checked/>独立研发</span></label>
        <span id="RadioGroup3_0">
        <input type="radio" name="RadioGroup3" value="委托研发" id="RadioGroup32" />委托研发</span>
        <span id="RadioGroup3_0">
        <input type="radio" name="RadioGroup3" value="合作研发" id="RadioGroup33" />合作研发</span>
        <span id="RadioGroup3_0">
        <input type="radio" name="RadioGroup3" value="其他" id="RadioGroup34" />其他</span>
				 <%
   			   }
   			   else if(rsx.getString(1).equals("委托研发"))
			   {
		         %>
		          <label>
        <span id="RadioGroup3_0">
        <input type="radio" name="RadioGroup3" value="独立研发" id="RadioGroup31"/>独立研发</span></label>
        <span id="RadioGroup3_0">
        <input type="radio" name="RadioGroup3" value="委托研发" id="RadioGroup32" checked/>委托研发</span>
        <span id="RadioGroup3_0">
        <input type="radio" name="RadioGroup3" value="合作研发" id="RadioGroup33" />合作研发</span>
        <span id="RadioGroup3_0">
        <input type="radio" name="RadioGroup3" value="其他" id="RadioGroup34" />其他</span>
				 <%
			   }
   			   else if(rsx.getString(1).equals("合作研发"))
			   {
		         %>
		          <label>
        <span id="RadioGroup3_0">
        <input type="radio" name="RadioGroup3" value="独立研发" id="RadioGroup31" />独立研发</span></label>
        <span id="RadioGroup3_0">
        <input type="radio" name="RadioGroup3" value="委托研发" id="RadioGroup32" />委托研发</span>
        <span id="RadioGroup3_0">
        <input type="radio" name="RadioGroup3" value="合作研发" id="RadioGroup33" checked/>合作研发</span>
        <span id="RadioGroup3_0">
        <input type="radio" name="RadioGroup3" value="其他" id="RadioGroup34" />其他</span>
				 <%
			   }
   			   else
			   {
		         %>
		          <label>
        <span id="RadioGroup3_0">
        <input type="radio" name="RadioGroup3" value="独立研发" id="RadioGroup31" />独立研发</span></label>
        <span id="RadioGroup3_0">
        <input type="radio" name="RadioGroup3" value="委托研发" id="RadioGroup32" />委托研发</span>
        <span id="RadioGroup3_0">
        <input type="radio" name="RadioGroup3" value="合作研发" id="RadioGroup33" />合作研发</span>
        <span id="RadioGroup3_0">
        <input type="radio" name="RadioGroup3" value="其他" id="RadioGroup34" checked/>其他</span>
				 <%
			   }
   		   }
   		   
		       rsx.close();
						%>
      
        </td>
  </tr>
  <tr>
    <td colspan="2">合作意向单位</td>
    
    <td>
    <%
           String sqlu= "Select hezuoyixiangdanwei From demandinfo where demandnumber = " + demandid;
           
   		   ResultSet rsu = stmt.executeQuery(sqlu);//
   		   if(rsu.next())
   		   {
		   %>
		 <input type="text" name="hezuoyixiangdanwei" id="hezuoyixiangdanwei" value='<%=rsu.getString(1)%>'/>
						<%
   		   }
   		   else{ 
   		   %>
   			<input type="text" name="hezuoyixiangdanwei" id="hezuoyixiangdanwei" />
   		   <%
   		   }
   		   
		       rsu.close();
						%>
  </tr>
  <tr>
    <td colspan="2">*科技活动类型(请直接修改) </td>
    <td colspan="3">
    <%
           String sqlt= "Select kejihuodongleixing From demandinfo where demandnumber = " + demandid;
           System.out.println( sqlt);
           String kejihuodongleixing =  "";
   		   ResultSet rst = stmt.executeQuery(sqlt);//
   		   if(rst.next())
   		   {
   			kejihuodongleixing = rst.getString(1);
		   %>
		 <input type="text" name="kejihuodongleixing" id="kejihuodongleixing" value='<%=rst.getString(1)%>'/>
						<%
   		   }
   		   else{ 
   		   %>
   			<input type="text" name="kejihuodongleixing" id="kejihuodongleixing" />
   		   <%
   		   }
   		   
		       rst.close();
						%>
    &nbsp;</td>
  </tr>
  <tr id = "study" >
    <td colspan="2">学科分类（限基础研究填写,请直接修改）</td>
    <td colspan="3">
    <%
           String sqls= "Select xuekefenlei From demandinfo where demandnumber = " + demandid;
           System.out.println( sqls);
   		   ResultSet rss = stmt.executeQuery(sqls);//
   		   if(rss.next())
   		   {
		   %>
		 <input type="text" name="xuekefenlei" id="xuekefenlei" value='<%=rss.getString(1)%>'/>
						<%
   		   }
   		   else{ 
   		   %>
   			<input type="text" name="xuekefenlei" id="xuekefenlei" />
   		   <%
   		   }
   		   
		       rss.close();
						%>
    </td>
  </tr>
  <tr id="suoshulingyu">
    <td colspan="2">需求技术所属领域（非基础研究填写）</td>
    <td colspan="3">
      <%
           String sqlr= "Select xuqiujishusuoshulingyu From demandinfo where demandnumber = " + demandid;
           System.out.println( sqlr);
   		   ResultSet rsr = stmt.executeQuery(sqlr);//
   		   if(rsr.next())
   		   {
		   %>
		 <input type="text" name="xuqiujishusuoshulingyu" id="xuqiujishusuoshulingyu" value='<%=rsr.getString(1)%>'/>
						<%
   		   }
   		   else{ 
   		   %>
   			<input type="text" name="xuqiujishusuoshulingyu" id="xuqiujishusuoshulingyu" />
   		   <%
   		   }
   		   
		       rsr.close();
						%>
          </td>
  </tr>
  <tr id="yingyonghangye">
    <td colspan="2">需求技术应用行业（非基础研究填写）</td>
    <td colspan="3">
     <%
           String sqlq= "Select xuqiujishuyingyonghangye From demandinfo where demandnumber = " + demandid;
           System.out.println( sqlq);
   		   ResultSet rsq = stmt.executeQuery(sqlq);//
   		   if(rsq.next())
   		   {
		   %>
		 <input type="text" name="xuqiujishuyingyonghangye" id="xuqiujishuyingyonghangye" value='<%=rsq.getString(1)%>'/>
						<%
   		   }
   		   else{ 
   		   %>
   			<input type="text" name="xuqiujishuyingyonghangye" id="xuqiujishuyingyonghangye" />
   		   <%
   		   }
   		   
		       rsq.close();
						%>
    &nbsp;</td>
  </tr>
  <tr>  
        <td height="34" colspan="5">
          <INPUT TYPE="hidden"  id = "bian" name = "bian" value='<%=kejihuodongleixing%>'> 
          <INPUT TYPE="hidden"  id = "xuqiubianhao" name = "xuqiubianhao" value='<%=demandid%>'>
          <INPUT TYPE="hidden"  id = "tijiaoxingshi" name = "tijiaoxingshi" >
          <input type="button" name="button" id="button" value="保存不提交" onclick="tiaoZhuan1()"/>
          <input type="button" name="button" id="button" value="提交" onclick="tiaoZhuan2()"/>
          <input type="reset" name="button2" id="button2" value="重置" /></td>
      </tr>
</table>
</form>
</body>
</html>