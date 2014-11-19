<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk" import="java.sql.*,javax.sql.*,javax.naming.*,java.io.*,zhaopin.highend.services.*,zhaopin.highend.entities.log.*,zhaopin.highend.entities.*,zhaopin.highend.utilities.*,java.util.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Insert title here</title>
</head>
<body>
<% 
java.util.Date d =new java.util.Date();
out.println(d.toString());
%>

<div>
<%

LogService service=new LogService();

HashMap<java.util.Date,List<StatisticLog>> dic=service.GetStatisticLogList(DateTimeOper.GetDate(2014, 10,1),DateTimeOper.GetDate(2104, 11, 18), 6);


if(dic!=null&&dic.size()>0)
{
	out.println("<table>");
	for(Map.Entry<java.util.Date,List<StatisticLog>> entry:dic.entrySet())
	{
		
		out.println("<tr><td>"+DateTimeOper.ConverttoString(entry.getKey(),"yyyy-MM-dd")+"</td>");
		
		for(StatisticLog log :entry.getValue())
		{

			out.println("<td>"+log.DataCount.longValue()+"</td>");
		}
		
		
		out.println("</tr>");
	}
	out.println("</table>");
}
%>

</div>

</body>
</html>