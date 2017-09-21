<%@ page  import = "java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>填报连接数据库</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");
        //获取页面内容
        String institutionname = request.getParameter("institutionname");//1机构名称 
		String guikouguanlibumen = request.getParameter("guikouguanlibumen");//2归口管理部门
		String address = request.getParameter("address");//3通讯地址
		String suozaidiyu = request.getParameter("suozaidiyu");//4所在地域
		String URL = request.getParameter("URL");//5网址
	    String email = request.getParameter("email");//6电子信箱 */
		String farendaibiao = request.getParameter("farendaibiao");//7法人代表
		String postcode = request.getParameter("postcode");//8邮政编码
		String contact = request.getParameter("contact");//9联系人 */
		String contactnumber2 = request.getParameter("contactnumber2");//10联系人移动电话 */
		String contactnumber = request.getParameter("contactnumber");//11联系人固定电话
		String chuanzhen = request.getParameter("chuanzhen");//12传真
		String RadioGroup1 = request.getParameter("RadioGroup1");//13机构属性
		String jianjie = request.getParameter("jianjie");//14机构简介
		String jishuming = request.getParameter("jishuming");//1技术需求名称
		String startyear = request.getParameter("startyear");//2开始年限
		String endyear = request.getParameter("endyear");//3结束年限
		String zhuyaowenti = request.getParameter("zhuyaowenti");//4技术简介：主要问题
		String jishuguanjian = request.getParameter("jishuguanjian");//5技术简介：技术关键
		String yuqimubiao = request.getParameter("yuqimubiao");//6技术简介：预期目标
		String nitouru = request.getParameter("nitouru");//7拟投入资金总额
		String RadioGroup3 = request.getParameter("RadioGroup3");//8技术需求解决方法
		String hezuoyixiangdanwei = request.getParameter("hezuoyixiangdanwei");//9合作意向单位
		String kejihuodongleixing = request.getParameter("kejihuodongleixing");//10科技活动类型
		String xuekefenlei = request.getParameter("xuekefenlei");//11学科分类
		
		//12一个多选框，需求技术所属领域
		String xuqiujishusuoshulingyu = request.getParameter("xuqiujishusuoshulingyu");
		//13一个关键字
		String guannew = request.getParameter("guanjianzi");
        String xuqiujishuyingyonghangye = request.getParameter("xuqiujishuyingyonghangye");//14需求技术应用行业
		//判断是否已经填报过机构信息***************************************
		Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=test","sa","123456");
	    request.setCharacterEncoding("UTF-8");
	    Statement stmt = conn.createStatement();
        String sql = "Select institutionnumber From institutioninfo";
		ResultSet rs = stmt.executeQuery(sql);
		int flag = 0;
		while(rs.next())//如果已经存在就不再存入单位信息
			{
			    if( rs.getInt(1)== Integer.parseInt(session.getAttribute("user").toString()))
			    {
			    	flag = 1;
			    	break;
			    }
			}                                                                                                                // institutionnumber              institutionname,            email,            address         contact,          contactnumber,          contactnumber2,            guikouguanlibumen,          suozaidiyu,            URL,        farendaibiao,       youzhengbianma,    contactchuanzhen,  jigoushuxing,         jigoujianjie                                                                                     
		if(flag == 0)
		{
		    String InsertSQL = "Insert Into institutioninfo(institutionnumber,institutionname,email,address,contact,contactnumber,contactnumber2,guikouguanlibumen,suozaidiyu,URL,farendaibiao,youzhengbianma,contactchuanzhen,jigoushuxing,jigoujianjie) Values('" + session.getAttribute("user") + "','" + institutionname + "','" + email  + "','" + address + "','" + contact + "','" + contactnumber + "','" + contactnumber2 + "','" + guikouguanlibumen + "','" + suozaidiyu + "','" + URL + "','" +  farendaibiao + "','" + postcode + "','" + chuanzhen + "','" + RadioGroup1 + "','" + jianjie + "')";
		    stmt.executeUpdate(InsertSQL);
		}
		//**********************************************************************	
		String InsertSQL1 = "";
		
		String tijiaoxingshi = request.getParameter("tijiaoxingshi");
		String xuqiubianhao = request.getParameter("xuqiubianhao");
		if(tijiaoxingshi.equals("1"))//仅保存
		{
			if(request.getParameter("bian").equals("基础研究"))//基础类上传数据库
			{                                                                                                                                                                                                                         
			    InsertSQL1 = "update demandinfo set demandname = '"+ jishuming +"',institutionnumber = '"+ session.getAttribute("user") +"',startyear = '"+ startyear +"',endyear = '"+ endyear +"',zhuyaowenti = '"+ zhuyaowenti +"',jishuguanjian = '"+ jishuguanjian +"',yuqimubiao = '"+ yuqimubiao +"',nitouruzijinzonge = '"+ nitouru +"',jishuxuqiujiejuefangfa = '"+ RadioGroup3 +"',hezuoyixiangdanwei = '"+ hezuoyixiangdanwei +"',kejihuodongleixing = '"+ kejihuodongleixing +"',xuekefenlei = '"+ xuekefenlei +"',guanjianzi = '"+ guannew +"' where demandnumber ='" + xuqiubianhao+"'";
			}
			else//非基础类                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               										   demandname,               institutionnumber                 startyear,           endyear,          zhuyaowenti,           jishuguanjian,         yuqimubiao,        nitouruzijinzonge, jishuxuqiujiejuefangfa,hezuoyixiangdanwei,        kejihuodongleixing,    xuekefenlei,   xuqiujishusuoshulingyu,guanjianzi, yingyonghangye
			{
			    InsertSQL1 = "update demandinfo set demandname = '"+ jishuming +"',institutionnumber = '"+ session.getAttribute("user") +"',startyear = '"+ startyear +"',endyear = '"+ endyear +"',zhuyaowenti = '"+ zhuyaowenti +"',jishuguanjian = '"+ jishuguanjian +"',yuqimubiao = '"+ yuqimubiao +"',nitouruzijinzonge = '"+ nitouru +"',jishuxuqiujiejuefangfa = '"+ RadioGroup3 +"',hezuoyixiangdanwei = '"+ hezuoyixiangdanwei +"',kejihuodongleixing = '"+ kejihuodongleixing +"',xuqiujishusuoshulingyu = '"+ xuqiujishusuoshulingyu +"',guanjianzi = '"+ guannew +"',xuqiujishuyingyonghangye = '"+ xuqiujishuyingyonghangye +"' where demandnumber ='" + xuqiubianhao+"'";
			}
		}
		else if(tijiaoxingshi.equals("2"))//提交
		{
			if(request.getParameter("bian").equals("基础研究"))//基础类上传数据库
			{                                                                                                                                                                                                                         
			    InsertSQL1 = "update demandinfo set demandname = '"+ jishuming +"',institutionnumber = '"+ session.getAttribute("user") +"',startyear = '"+ startyear +"',endyear = '"+ endyear +"',zhuyaowenti = '"+ zhuyaowenti +"',jishuguanjian = '"+ jishuguanjian +"',yuqimubiao = '"+ yuqimubiao +"',nitouruzijinzonge = '"+ nitouru +"',jishuxuqiujiejuefangfa = '"+ RadioGroup3 +"',hezuoyixiangdanwei = '"+ hezuoyixiangdanwei +"',kejihuodongleixing = '"+ kejihuodongleixing +"',xuekefenlei = '"+ xuekefenlei +"',guanjianzi = '"+ guannew +"',shenhexs = '0',shenhebm = '0' where demandnumber ='" + xuqiubianhao+"'";
			}
			else//非基础类                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               										   demandname,               institutionnumber                 startyear,           endyear,          zhuyaowenti,           jishuguanjian,         yuqimubiao,        nitouruzijinzonge, jishuxuqiujiejuefangfa,hezuoyixiangdanwei,        kejihuodongleixing,    xuekefenlei,   xuqiujishusuoshulingyu,guanjianzi, yingyonghangye
			{
			    InsertSQL1 = "update demandinfo set demandname = '"+ jishuming +"',institutionnumber = '"+ session.getAttribute("user") +"',startyear = '"+ startyear +"',endyear = '"+ endyear +"',zhuyaowenti = '"+ zhuyaowenti +"',jishuguanjian = '"+ jishuguanjian +"',yuqimubiao = '"+ yuqimubiao +"',nitouruzijinzonge = '"+ nitouru +"',jishuxuqiujiejuefangfa = '"+ RadioGroup3 +"',hezuoyixiangdanwei = '"+ hezuoyixiangdanwei +"',kejihuodongleixing = '"+ kejihuodongleixing +"',xuqiujishusuoshulingyu = '"+ xuqiujishusuoshulingyu +"',guanjianzi = '"+ guannew +"',xuqiujishuyingyonghangye = '"+ xuqiujishuyingyonghangye +"',shenhexs = '0',shenhebm = '0' where demandnumber ='" + xuqiubianhao+"'";}	
		    }
		System.out.print(InsertSQL1);
		int j = stmt.executeUpdate(InsertSQL1);
		if (j == 1)
		{
			out.println("<script language='javaScript'> alert('修改信息成功!');</script>");
			response.setHeader("refresh", "1;url=open.html");
		}
	%>
</body>
</html>