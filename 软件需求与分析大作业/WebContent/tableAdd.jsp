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
<style type="text/css">
 table{
border-color: #e9e6e7;
background:white;
margin: auto;
}
 
 table tr:nth-child(odd){
background:white;
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
<script type="text/javascript">
$(document).ready(function(){
	getFirst_xq('OrgTechWork1');
	getFirst_xk('OrgSubject1');
});
	function tiaoZhuan1()
	{
		document.getElementById("tijiaoxingshi").value = "1";
		form1.submit();
	}
	function tiaoZhuan2()
	{ 
		document.getElementById("tijiaoxingshi").value = "2";
		form1.submit();
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
//通信地址为空验证*********************************************************************************
function checktong() 
{
 var address = document.getElementById('address').value;
 if(address.replace(/(^s*)|(s*$)/g, "").length !=0)
 {
	 document.getElementById("addressmes").innerHTML="<font color='red'></font>"; 
   	 return true;
 }
 else    
 {    
      document.getElementById("addressmes").innerHTML="<font color='red'>通信地址不能为空!</font>";
      return false;    
 } 
}
 </script>
 
 <script type="text/javascript">
//技术需求名称为空验证*********************************************************************************
function checkji() 
{
 var jishuming = document.getElementById('jishuming').value;
 if(jishuming.replace(/(^s*)|(s*$)/g, "").length !=0)
 {
	 document.getElementById("jishumingmes").innerHTML="<font color='red'></font>"; 
   	 return true;
 }
 else    
 {    
      document.getElementById("jishumingmes").innerHTML="<font color='red'>通信地址不能为空!</font>";
      return false;    
 } 
}
 </script>

  <script type="text/javascript">
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
    var phone = document.getElementById('contactnumber2').value;
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
<form id="form1" name="form1" method="post" action="tableAddto.jsp">
<table width="981" height="507" border="1">
  <tr>
    <td>*机构全称</td>
    <td>
   <%  
           Connection conn4 = null;
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
           conn4=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
           request.setCharacterEncoding("UTF-8");
           
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
           
           String sqla1 = "Select guikouguanlibumen From institutioninfo where institutionnumber = " + session.getAttribute("user");
   		   ResultSet rsa1 = stmt.executeQuery(sqla1);
   		   if(rsa1.next()){
 		   %>
 		 <option value=<%=rsa1.getString(1)%>><%=rsa1.getString(1)%></option>
 						<%
    							 }
   		   
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
		 <input type="text"  name="address"  onblur="checktong()" id="address" value='<%=rs5.getString(1)%>'/><label><div id="addressmes" nowrap></div></label>
						<%
   		   }
   		   else{  
   		   %>
   			<input type="text"  name="address" onblur="checktong()" id="address" /><label><div id="addressmes" nowrap></div></label>
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
           
           String sqla2 = "Select suozaidiyu From institutioninfo where institutionnumber = " + session.getAttribute("user");
   		   ResultSet rsa2 = stmt.executeQuery(sqla2);
   		   if(rsa2.next()){
 		   %>
 		 <option value=<%=rsa2.getString(1)%>><%=rsa2.getString(1)%></option>
 						<%
    							 }
   		   
           String sql1 = "Select * From Sheet2$";
   		   ResultSet rs1 = stmt1.executeQuery(sql1);
		 while(rs1.next()){
		 %>
		 <option value=<%=rs1.getString(2)%>><%=rs1.getString(2)%></option>
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
           
           Statement stmt11 = conn10.createStatement();
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
		 <input type="text" name="contactnumber" id="contactnumber" value='<%=rs13.getString(1)%>'/><label><div id="yb" nowrap></div></label>
						<%
   		   }
   		   else{ 
   		   %>
   			<input type="text" name="contactnumber" id="contactnumber" /><label><div id="yb" nowrap></div></label>
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
		 <input type="text" name="contactnumber2"  onblur="CheckPhone()" id="contactnumber2" value='<%=rs7.getString(1)%>'/><label><div id="shouji" nowrap></div></label>
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
   		   else{ 
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
   		   
		       rs15.close();
						%>
        
      </td>
  </tr>
  <tr>
    <td height="30" colspan="5">*机构简介（主要包括基本情况、现有研究基础等，限500字以内）</td>
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
    <td><input type="text" name="jishuming" id="jishuming"  /></td><label><div id="jishumingmes" nowrap></div></label>
    <td>*需求时限</td>
    <td>开始年限
    <select name="startyear" id="startyear">
    <option value="">--- 请选择 ---</option>
              <%  
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
                          bufYear.append(" selected");  
                      }  
                     bufYear.append(" >"+iYear+"</option>\n");  
                     }  
                     out.println(bufYear.toString());  
               %>  
      </select>
    </td>
    <td>到期年限
    <select name='endyear'id="endyear" onblur="YearYanzheng()">  
       <option value="">--- 请选择 ---</option>
              <%
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
                          bufYear2.append(" selected");  
                      }  
                     bufYear2.append(" >"+iYear2+"</option>\n");  
                     }  
                     out.println(bufYear2.toString());  
               %>  
      </select>
    <label><div id="mesyear" nowrap></div></label></td>
  </tr>
  <tr>
    <td colspan="5">*技术需求概述</td>
  </tr>
  <tr>
    <td height="30" colspan="5">1、主要问题（需要解决的重大技术问题，限500字以内）</td>
  </tr>
  <tr>
    <td height="70" colspan="5">
    <textarea type="text" name="zhuyaowenti" id="zhuyaowenti" style="width:1060px;height:70px" onKeyDown="textCounter(zhuyaowenti,remLen1,500);" onKeyUp="textCounter(zhuyaowenti,remLen1,500);" required></textarea>
      您还可以输入:<input name="remLen1" type="text" value="500" size="5" readonly>个汉字</textarea>
    </td>
 </tr>
    <tr>
    <td height="30" colspan="5">2、技术关键（所需的关键技术、主要指标，限500字以内）</td>
  </tr>
  <tr>
    <td height="70" colspan="5">
      <textarea type="text" name="jishuguanjian" id="jishuguanjian" style="width:1060px;height:70px" onKeyDown="textCounter(jishuguanjian,remLen2,500);" onKeyUp="textCounter(jishuguanjian,remLen2,500);" required></textarea>
      您还可以输入:<input name="remLen2" type="text" value="500" size="5" readonly>个汉字</textarea>
    </td>
  </tr>
    <tr>
    <td height="30" colspan="5">3、预期目标（技术创新性、经济社会效益，限500字以内）</td>
  </tr>
  <tr>
    <td height="70" colspan="5">
      <textarea type="text" name="yuqimubiao" id="yuqimubiao" style="width:1060px;height:70px" onKeyDown="textCounter(yuqimubiao,remLen3,500);" onKeyUp="textCounter(yuqimubiao,remLen3,500);" required></textarea>
      您还可以输入:<input name="remLen3" type="text" value="500" size="5" readonly>个汉字</textarea>
    </td>
  </tr>
  <tr>
    <td colspan="5">*关键字（请依次输入）
    <input type="text" name="guanjianzi1" id="guanjianzi1" onblur="yici()" />
    <input type="text" name="guanjianzi2" id="guanjianzi2" readOnly=true  onblur="yici()"/>
    <input type="text" name="guanjianzi3" id="guanjianzi3" readOnly=true  onblur="yici()"/>
    <input type="text" name="guanjianzi4" id="guanjianzi4" readOnly=true  onblur="yici()"/>
    <input type="text" name="guanjianzi5" id="guanjianzi5" readOnly=true  onblur="yici()"/></td>
  </tr>
  <tr>
  <td colspan="2">拟投入资金总额</td>
    <td colspan="3">   <input type="text" name="nitouru" id="nitouru" style = "width:600px; height:20px;" />万元
    </td>
  </tr>
  <tr>
    <td colspan="2" rowspan="2">*技术需求解决方法</td>
    <td colspan="3">
      <label>
        <span id="RadioGroup3_0">
        <input type="radio" name="RadioGroup3" value="独立研发" id="RadioGroup31" checked/>独立研发</span></label>
        <span id="RadioGroup3_0">
        <input type="radio" name="RadioGroup3" value="委托研发" id="RadioGroup32" />委托研发</span>
        <span id="RadioGroup3_0">
        <input type="radio" name="RadioGroup3" value="合作研发" id="RadioGroup33" />合作研发</span>
        <span id="RadioGroup3_0">
        <input type="radio" name="RadioGroup3" value="其他" id="RadioGroup34" />其他</span>
        </td>
  </tr>
  <tr>
    <td colspan="2">合作意向单位</td>
    <td><input type="text" name="hezuoyixiangdanwei" id="hezuoyixiangdanwei" /></td>
  </tr>
  <tr>
    <td colspan="2">*科技活动类型 </td>
    <td colspan="3">
    <label>
        <span id="RadioGroup2_1">
        <input type="radio" name="RadioGroup2" value="基础研究"  onclick="jichu()" id="RadioGroup21" checked/> 基础研究</span></label>
        <span id="RadioGroup2_2">
        <input type="radio" name="RadioGroup2" value="应用研究" onclick="feijichu()" id="RadioGroup22" />应用研究</span>
        <span id="RadioGroup2_3">
        <input type="radio" name="RadioGroup2" value="试验发展" onclick="feijichu()" id="RadioGroup23" />试验发展</span>
        <span id="RadioGroup2_4">
        <input type="radio" name="RadioGroup2" value="研究与试验发展成果应用" onclick="feijichu()" id="RadioGroup24" />研究与试验发展成果应用</span>
        <span id="RadioGroup2_5">
        <input type="radio" name="RadioGroup2" value="技术推广与科技服务" onclick="feijichu()" id="RadioGroup25" />技术推广与科技服务</span>
        <span id="RadioGroup2_6">
        <input type="radio" name="RadioGroup2" value="生产性活动" onclick="feijichu()" id="RadioGroup26" />生产性活动</span>
        <label><div id="me" nowrap></div></label>
    &nbsp;</td>
  </tr>
  <tr id = "study" >
    <td colspan="2">学科分类（限基础研究填写）</td>
    <td colspan="3">
    <select name="OrgSubject1" id="OrgSubject1" onchange="changefirst_xk()"><option value=""></option> </select>
	<select name="OrgSubject2" id="OrgSubject2" onchange="changesecond_xk()"></select>
	<select name="OrgSubject3" id="OrgSubject3"></select>
    </td>
  </tr>
  <tr id="suoshulingyu"  style="display:none">
    <td colspan="2">需求技术所属领域（非基础研究填写,可多选)）</td>
    <td colspan="3">
      <p>
        <label>
          <input type="checkbox" name="CheckboxGroup1" value="电子信息" id="CheckboxGroup1_1" />
          电子信息</label>
        <label>
          <input type="checkbox" name="CheckboxGroup1" value="光机电一体化" id="CheckboxGroup1_2" />
          光机电一体化</label>
          <label>
          <input type="checkbox" name="CheckboxGroup1" value="生物技术与制药" id="CheckboxGroup1_3" />
          生物技术与制药</label>
          <label>
          <input type="checkbox" name="CheckboxGroup1" value="新材料及应用" id="CheckboxGroup1_4" />
          新材料及应用</label>
          <label>
          <input type="checkbox" name="CheckboxGroup1" value="现代农业" id="CheckboxGroup1_5" />
          现代农业</label>
          <p>
          <label>
          <input type="checkbox" name="CheckboxGroup1" value="新能源与高效节能" id="CheckboxGroup1_6" />
          新能源与高效节能</label>
          <label>
          <input type="checkbox" name="CheckboxGroup1" value="资源与环境" id="CheckboxGroup1_7" />
         资源与环境</label>
          <label>
          <input type="checkbox" name="CheckboxGroup1" value="高科技服务业" id="CheckboxGroup1_8" />
          高科技服务业</label>
          <label>
          <input type="checkbox" name="CheckboxGroup1" value="海洋" id="CheckboxGroup1_9" />
          海洋</label>
          <label>
          <input type="checkbox" name="CheckboxGroup1" value="社会公共事业" id="CheckboxGroup1_10" />
          社会公共事业</label>
          <label>
          <input type="checkbox" name="CheckboxGroup1" value="医疗卫生" id="CheckboxGroup1_11" />
          医疗卫生</label>
          <label>
          <input type="checkbox" name="CheckboxGroup1" value="其他" id="CheckboxGroup1_12" />
         其他</label>
          </td>
  </tr>
  <tr id="yingyonghangye" style="display:none">
    <td colspan="2">需求技术应用行业（非基础研究填写）</td>
    <td colspan="3">
     <select name="OrgTechWork1" id="OrgTechWork1" onchange="changefirst_xq()"><option value=""></option></select>
     <select name="OrgTechWork2" id="OrgTechWork2" onchange="changesecond_xq()"></select>
     <select name="OrgTechWork3" id="OrgTechWork3"></select>
    &nbsp;</td>
  </tr>
  <tr>  
        <td height="34" colspan="5"> 
          <INPUT TYPE="hidden"  id = "tijiaoxingshi" name = "tijiaoxingshi">
          <input type="button" name="button" id="button" value="保存不提交" onclick="tiaoZhuan1()"/>
          <input type="button" name="button" id="button" value="提交" onclick="tiaoZhuan2()"/>
          <input type="reset" name="button2" id="button2" value="重置" /></td>
      </tr>
</table>
</form>
</body>
</html>