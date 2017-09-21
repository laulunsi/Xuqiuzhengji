<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../logo.ico" rel="shortcut icon">
<title>管理角色</title>
</head>
<style> 
body{ text-align:center} 
/* .div{ margin:0 auto; width:400px; height:100px; border:1px solid #F00}  */
/* css注释：为了观察效果设置宽度 边框 高度等样式 */ 
font {font-weight:bold;}
</style>
<h1 align=center>角色管理</h1>
<!-- 数字0 表示上下边距是0。可以按照需要设置成不同的值。 
后面的那个width也是个很重要的属性，因为按钮的宽度非常小，所以要设置一个合适的width值才可以让你的按钮居中显示 -->
<div style="margin:0 auto;width:100px;"> 
<input type="submit" name="button" id="button" value="新增角色" style="height:40px;width:100px;" />
</div>
<p>
<div style="margin:0 auto;width:90px;"> 
<select name="yingyonghangye1" size="1" id="yingyonghangye1">
        <option value="">请选择角色</option>
        <option value="管理员">管理员</option>
        <option value="形式审核员">形式审核员</option>
        <option value="内容审核员">内容审核员</option>
        <option value="单位用户">单位用户</option>
      </select>
</div>
<p>
<div style="text-align:center"> 
<table width="1100"  border="1">
   <tr>
    <td><font>权限名称</font></td>
    <td><font>权限内容</font></td>
    <td><font>权限编号</font></td>
    <td><font>是否赋予权限</font></td>
   </tr>
   <tr>
    <td>需求填报</td>
    <td>将需求信息进行填报</td>
    <td>item.xqtb</td>
    <td><input type="checkbox" name="button" id="button" value="需求填报"/>
    </td>
   </tr>
   <tr>
    <td>查看我的需求</td>
    <td>查看自己填报过的需求信息</td>
    <td>item.ckwdxq</td>
    <td><input type="checkbox" name="button" id="button" value="查看我的需求"/>
   </tr>
   <tr>
    <td>查看我的信息</td>
    <td>查看自己填报过的机构信息</td>
    <td>item.ckwdxx</td>
    <td><input type="checkbox" name="button" id="button" value="查看我的信息"/>
   </tr>
   <tr>
    <td>修改密码</td>
    <td>修改密码</td>
    <td>item.xgmm</td>
    <td><input type="checkbox" name="button" id="button" value="修改密码"/>
   </tr>
   <tr>
    <td>查看所有需求</td>
    <td>查看数据库中所有填报过的需求信息</td>
    <td>item.cksyxq</td>
    <td><input type="checkbox" name="button" id="button" value="查看所有需求"/>
   </tr>
   <tr>
    <td>形式审核</td>
    <td>对于所有需求的形式审核功能，为内容是否符合语境、是否合法</td>
    <td>item.xssh</td>
    <td><input type="checkbox" name="button" id="button" value="形式审核"/>
   </tr>
   <tr>
    <td>内容审核</td>
    <td>对于所有需求的内容审核功能，是否有价值、是否符合限制</td>
    <td>item.nrsh</td>
    <td><input type="checkbox" name="button" id="button" value="内容审核"/>
   </tr>
</table>
</div>
<body>

</body>
</html>