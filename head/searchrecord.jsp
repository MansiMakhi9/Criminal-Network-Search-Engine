<%@page import="java.sql.*,java.util.*" %>
<%!
String add(String s,String cnd,String val)
	{
	if(val.equals(""))
		return s;
	if(s.equals(""))
		s=cnd;
	else
		s=s+" and "+cnd;
	return s;
	}
%>
<html>
<link href=../mystyle.css type=text/css rel=stylesheet />
<body class=page >
<br>

<center>
<div class=mainbox >
<div class=pageheading style="text-align:right;font-size:30px;width:95%" >
Search Criminal Record 
</div>
<hr color=#004d66 size=3px >
<table width=100%  cellpadding=10px cellspacing=10px >
<%
String nm=request.getParameter("name")!=null?request.getParameter("name"):"";
String ad=request.getParameter("address")!=null?request.getParameter("address"):"";
String gd=request.getParameter("gender")!=null?request.getParameter("gender"):"";
String ht=request.getParameter("height")!=null?request.getParameter("height"):"";
String sc=request.getParameter("skincolor")!=null?request.getParameter("skincolor"):"";
String ec=request.getParameter("eyecolor")!=null?request.getParameter("eyecolor"):"";
String ag=request.getParameter("age")!=null?request.getParameter("age"):"";
String bt=request.getParameter("bodytype")!=null?request.getParameter("bodytype"):"";
String bm=request.getParameter("bodymarks")!=null?request.getParameter("bodymarks"):"";
String st=request.getParameter("status")!=null?request.getParameter("status"):"";
String wt=request.getParameter("wanted")!=null?request.getParameter("wanted"):"";
String hs=request.getParameter("hairstyle")!=null?request.getParameter("hairstyle"):"";
String dt=request.getParameter("details")!=null?request.getParameter("details"):"";

String s="";
s=add(s,"name like '%"+nm+"%'",nm);
s=add(s,"address like '%"+ad+"%'",ad);
s=add(s,"gender='"+gd+"'",gd);
s=add(s,"height between "+ht+"-10 and "+ht+"+10",ht);
s=add(s,"skincolor='"+sc+"'",sc);
s=add(s,"eyecolor='"+ec+"'",ec);
s=add(s,"age between "+ag+"-5 and "+ag+"+5",ag);
s=add(s,"bodytype='"+bt+"'",bt);
s=add(s,"bodymarks like '%"+bm+"%'",bm);
s=add(s,"status='"+st+"'",st);
s=add(s,"wanted='"+wt+"'",wt);
s=add(s,"hairstyle='"+hs+"'",hs);
s=add(s,"crimedetails like '%"+dt+"%'",dt);

String msql="select * from criminalmaster where "+s;
System.out.println(msql);

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/csedb","root","admin");
PreparedStatement smt=con.prepareStatement(msql);
ResultSet rs=smt.executeQuery();
int i=0;
while(rs.next())
	{
	String nam=rs.getString("name");
	String add=rs.getString("address");
	String pho=rs.getString("photo");
	String age=rs.getString("age");
	String hgt=rs.getString("height");
	String sco=rs.getString("skincolor");
	String eco=rs.getString("eyecolor");
	String bmk=rs.getString("bodymarks");
	String hst=rs.getString("hairstyle");
	String btp=rs.getString("bodytype");
	String cdt=rs.getString("crimedetails");
	String sts=rs.getString("status");
	String wtd=rs.getString("wanted");
%>
	<tr>
	<td style="width:150px" >
		<img src=../criminals/<%=pho%> height=150px >
	</td>	
	<Td style="valign:top" >
		<b><%=nam%></b><br>
		<%=add%>
		<hr color=#f8f8f8 size=1px >
		Crime : <%=cdt%><br>
		<hr color=#f8f8f8 size=1px >
		Marks : <%=bmk%><br>

	</td>
	<td  style="valign:top" >
		Age :<%=age%><br>
		Height:<%=hgt%><br>
		Skin Color:<%=sco%><br>		
		Eye Color:<%=eco%><br>
		Hair Style:<%=hst%><br>
		Body Type:<%=btp%><br>
	</td>
	</tr>
<%
	}
con.close();
   
con.close();
%>
</table>
<hr color=#004d66 size=3px >	
</div>
</center>
</body>
</html>