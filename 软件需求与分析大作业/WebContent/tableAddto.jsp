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
		String RadioGroup2 = request.getParameter("RadioGroup2");//10科技活动类型
		String xuekefenlei;
        if(request.getParameter("OrgSubject3")==null)//如果第三个字符为空，有那种只到第二分类级的学科。就读取第二个
        {
        	xuekefenlei = request.getParameter("OrgSubject2");//11学科分类
        }
        else
        {
        	xuekefenlei = request.getParameter("OrgSubject3");//11学科分类
        }
		
		//12一个多选框，需求技术所属领域
		String inew = "";
		if(!RadioGroup2.equals("基础研究"))
		{
            String[] i=new String[12];
		    i = request.getParameterValues("CheckboxGroup1");
	        for(int j=0;j<i.length;j++)
	        {
                inew+=i[j] + " ";
	        }
		}
		//13一个关键字
		String guan1 = "";
		guan1 = request.getParameter("guanjianzi1");
		String guan2 = "";
		guan2 = request.getParameter("guanjianzi2");
		String guan3 = "";
		guan3 = request.getParameter("guanjianzi3");
		String guan4 = "";
		guan4 = request.getParameter("guanjianzi4");
		String guan5 = "";
		guan5 = request.getParameter("guanjianzi5");
		String guannew = "";
        guannew = guan1 + " " + guan2 + " " + guan3 + " " + guan4 + " " + guan5;
        
        String yingyonghangye;
        
        if(request.getParameter("OrgTechWork3")==null)//如果第三个字符为空，有那种只到第二分类级的行业。就读取第二个
        {
        	yingyonghangye = request.getParameter("OrgTechWork2");//14需求技术应用行业
        }
        else
        {
        	yingyonghangye = request.getParameter("OrgTechWork3");//14需求技术应用行业
        }
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
			} 
		// institutionnumber              institutionname,            email,            address         contact,          contactnumber,          contactnumber2,            guikouguanlibumen,          suozaidiyu,            URL,        farendaibiao,       youzhengbianma,    contactchuanzhen,  jigoushuxing,         jigoujianjie                                                                                     
		String InsertSQL = "";
		if(flag == 0)
		{
		    InsertSQL = "Insert Into institutioninfo(institutionnumber,institutionname,email,address,contact,contactnumber,contactnumber2,guikouguanlibumen,suozaidiyu,URL,farendaibiao,youzhengbianma,contactchuanzhen,jigoushuxing,jigoujianjie) Values('" + session.getAttribute("user") + "','" + institutionname + "','" + email  + "','" + address + "','" + contact + "','" + contactnumber2 + "','" + contactnumber + "','" + guikouguanlibumen + "','" + suozaidiyu + "','" + URL + "','" +  farendaibiao + "','" + postcode + "','" + chuanzhen + "','" + RadioGroup1 + "','" + jianjie + "')";
		    
		}
		//**********************************************************************	
		String InsertSQL1 = "";
		
		String tijiaoxingshi = request.getParameter("tijiaoxingshi");//1机构名称
		if(tijiaoxingshi.equals("1"))//仅保存
		{
			if(RadioGroup2.equals("基础研究"))//基础类上传数据库
			{                                                                                                                                                                                                                         
			    InsertSQL1 = "Insert Into demandinfo(demandname,institutionnumber,startyear,endyear,zhuyaowenti,jishuguanjian,yuqimubiao,nitouruzijinzonge,jishuxuqiujiejuefangfa,hezuoyixiangdanwei,kejihuodongleixing,xuekefenlei,xuqiujishusuoshulingyu,guanjianzi,xuqiujishuyingyonghangye,shenhexs,shenhebm,guishubumen,xsshenheyijian,bmshenheyijian) Values('" + jishuming + "','" + session.getAttribute("user") + "','" + startyear  + "','" + endyear + "','" + zhuyaowenti + "','" + jishuguanjian + "','" + yuqimubiao + "','" + nitouru + "','" + RadioGroup3 + "','" + hezuoyixiangdanwei + "','" + RadioGroup2 + "','" + xuekefenlei + "','" + "无" + "','" + guannew + "','" + "无" + "','3','3','无','无','无')";
			}
			else//非基础类                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               										   demandname,               institutionnumber                 startyear,           endyear,          zhuyaowenti,           jishuguanjian,         yuqimubiao,        nitouruzijinzonge, jishuxuqiujiejuefangfa,hezuoyixiangdanwei,        kejihuodongleixing,    xuekefenlei,   xuqiujishusuoshulingyu,guanjianzi, yingyonghangye
			{
			    InsertSQL1 = "Insert Into demandinfo(demandname,institutionnumber,startyear,endyear,zhuyaowenti,jishuguanjian,yuqimubiao,nitouruzijinzonge,jishuxuqiujiejuefangfa,hezuoyixiangdanwei,kejihuodongleixing,xuekefenlei,xuqiujishusuoshulingyu,guanjianzi,xuqiujishuyingyonghangye,shenhexs,shenhebm,guishubumen,xsshenheyijian,bmshenheyijian) Values('" + jishuming + "','" + session.getAttribute("user") + "','" + startyear  + "','" + endyear + "','" + zhuyaowenti + "','" + jishuguanjian + "','" + yuqimubiao + "','" + nitouru + "','" + RadioGroup3 + "','" + hezuoyixiangdanwei + "','" + RadioGroup2 + "','" + "无" + "','" + inew + "','" + guannew + "','" + yingyonghangye + "','3','3','无','无','无')";
			}
		}
		else if(tijiaoxingshi.equals("2"))//提交
		{
			if(RadioGroup2.equals("基础研究"))//基础类上传数据库
			{                                                                                                                                                                                                                         
			    InsertSQL1 = "Insert Into demandinfo(demandname,institutionnumber,startyear,endyear,zhuyaowenti,jishuguanjian,yuqimubiao,nitouruzijinzonge,jishuxuqiujiejuefangfa,hezuoyixiangdanwei,kejihuodongleixing,xuekefenlei,xuqiujishusuoshulingyu,guanjianzi,xuqiujishuyingyonghangye,shenhexs,shenhebm,guishubumen,xsshenheyijian,bmshenheyijian) Values('" + jishuming + "','" + session.getAttribute("user") + "','" + startyear  + "','" + endyear + "','" + zhuyaowenti + "','" + jishuguanjian + "','" + yuqimubiao + "','" + nitouru + "','" + RadioGroup3 + "','" + hezuoyixiangdanwei + "','" + RadioGroup2 + "','" + xuekefenlei + "','" + "无" + "','" + guannew + "','" + "无" + "','0','0','无','无','无')";
			}
			else//非基础类                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               										   demandname,               institutionnumber                 startyear,           endyear,          zhuyaowenti,           jishuguanjian,         yuqimubiao,        nitouruzijinzonge, jishuxuqiujiejuefangfa,hezuoyixiangdanwei,        kejihuodongleixing,    xuekefenlei,   xuqiujishusuoshulingyu,guanjianzi, yingyonghangye
			{
			    InsertSQL1 = "Insert Into demandinfo(demandname,institutionnumber,startyear,endyear,zhuyaowenti,jishuguanjian,yuqimubiao,nitouruzijinzonge,jishuxuqiujiejuefangfa,hezuoyixiangdanwei,kejihuodongleixing,xuekefenlei,xuqiujishusuoshulingyu,guanjianzi,xuqiujishuyingyonghangye,shenhexs,shenhebm,guishubumen,xsshenheyijian,bmshenheyijian) Values('" + jishuming + "','" + session.getAttribute("user") + "','" + startyear  + "','" + endyear + "','" + zhuyaowenti + "','" + jishuguanjian + "','" + yuqimubiao + "','" + nitouru + "','" + RadioGroup3 + "','" + hezuoyixiangdanwei + "','" + RadioGroup2 + "','" + "无" + "','" + inew + "','" + guannew + "','" + yingyonghangye + "','0','0','无','无','无')";
			}	
		}
		System.out.print(InsertSQL1);
		int j = 0;
		try
		{
			 stmt.executeUpdate(InsertSQL);
		     j = stmt.executeUpdate(InsertSQL1);
		}
		catch(Exception e)
		{
			out.println("<script language='javaScript'> alert('添加信息失败，请重新添加!');</script>");
			response.setHeader("refresh", "1;url=tableAdd.jsp");
		}
		
		if (j == 1)
		{
			out.println("<script language='javaScript'> alert('添加信息成功!');</script>");
			response.setHeader("refresh", "1;url=tableAdd.jsp");
		}
	%>
</body>
</html>