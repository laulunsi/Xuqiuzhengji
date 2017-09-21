<%@ page import = "java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
 table{
border-color: #e9e6e7;
margin: auto;
}
 
 table tr:nth-child(odd){
background: #e9e6e7;
	height: 30px;
}
table tr:nth-child(even){
background:#e9e6e7;
	height: 30px;
}
th {
	height: 30px;
}
div{
}
 </style>
<script type="text/javascript">
//邮箱验证********************************************************************************
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
  function CheckPhone()
  { 
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
//两次密码输入是否相同*****************************************************************************
function  confirmPass()
{
	var password = document.getElementById('password').value;
	var confirmPassword = document.getElementById('confirmPassword').value;
	if(password == confirmPassword)
	{
		  document.getElementById("psd").innerHTML="<font color='red'></font>";
	   	  return true;    
	}
   else    
	{    
	      document.getElementById("psd").innerHTML="<font color='red'>两次密码输入不同，请检查!</font>";	  
	      return false;    	 
    }	
}
 </script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
</head>
<style type = "text/css">
</style>
<body>
<form action = "registerto.jsp" method = "post">
		<table frame = void>
			<tr>
				<th>机构名称：</th>
				<td><input name = "institutionname"  type = "text" style = "width:300px; height:25px;">
				<span id="span1"></span></td>
				
			</tr>
			<tr>
				<th>密码：</th>
				<td><input name = "password" id = "password" type = "password" style = "width:300px; height:25px;"></td>
			</tr>
			<tr>
				<th>确认密码：</th>
				<td><input name = "confirmPassword" id = "confirmPassword" type = "password" onblur="confirmPass()" style = "width:300px; height:25px;"><label><div id="psd" nowrap></div></label></td>
			    <td>&nbsp;&nbsp;<%="请确保两次密码填写相同"%></td>
			</tr>
			<tr>
				<th>电子信箱：</th>
				<td><input name = "email" id = "email" type = "text"  onblur="verifyAddress()" style = "width:300px; height:25px;"></td>
				<td>&nbsp;&nbsp;格式为*@*.* 例如:1151015744@qq.com&nbsp;&nbsp;</td>
				<td width="200"><label><div id="mes" nowrap></div></label></td>
			</tr>
			<tr>
				<th>联系人：</th>
				<td><input name = "contact"   type = "text" style = "width:300px; height:25px;"></td>
			</tr>
			<tr>
				<th>联系人手机号码：</th>
				<td><input name = "contactnumber" id = "contactnumber" type = "text"  onblur="CheckPhone()"  style = "width:300px; height:25px;"></td>
				<td>&nbsp;&nbsp;请输入十一位的手机号 例如:15227805374&nbsp;&nbsp;</td>
				<td width="200"><label><div id="shouji" nowrap></div></label></td>
			</tr>
			<tr>
				<th colspan = "2">
					<input type = "submit" value = "确认信息">
					<input type = "button" onclick = "window.location.href='login.html'" value = "  返回  ">
			</tr>
		</table>
	</form>
</body>
</html>