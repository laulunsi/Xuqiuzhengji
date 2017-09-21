<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 修改密码 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改密码</title>
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
<script type="text/javascript">
//两次密码输入是否相同*****************************************************************************
function  confirmPass()
{
	var newpassword = document.getElementById('newpassword').value;
	var confirmpassword = document.getElementById('confirmpassword').value;
	if(newpassword == confirmpassword)
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
//新旧密码是否相同*****************************************************************************
function  confirmNewpass()
{
	var newpassword = document.getElementById('newpassword').value;
	var oldpassword = document.getElementById('oldpassword').value;
	if(newpassword != oldpassword)
	{
		  document.getElementById("opsd").innerHTML="<font color='red'></font>";
	   	  return true;    
	}
   else    
	{    
	      document.getElementById("opsd").innerHTML="<font color='red'>新旧密码不能相同，请检查!</font>";	  
	      return false;    	 
    }	
}
 </script>
</head>
<body>
<form action = "modifyPasswordto.jsp" method = "post">
		<table border="1">
		    <tr>
				<th>原密码：</th>
				<td><input name = "oldpassword" id = "oldpassword" type = "password" style = "width:400px; height:25px;"></td>
			</tr>
			<tr>
				<th>新密码：</th>
				<td><input name = "newpassword" id = "newpassword" type = "password" onblur="confirmNewpass()" style = "width:400px; height:25px;"><label><div id="opsd" nowrap></div></label></td>
			</tr>
			<tr>
				<th>确认密码：</th>
				<td><input name = "confirmpassword" id = "confirmpassword" type = "password" onblur="confirmPass()" style = "width:400px; height:25px;"><label><div id="psd" nowrap></div></label></td>
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