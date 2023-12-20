<%@page import="java.sql.*,java.util.*" %>
<html>
<link href=../mystyle.css type=text/css rel=stylesheet />
<body class=page >
<br>
<br>
<center>
<div class=mainbox >
<div class=pageheading style="text-align:right;font-size:30px;width:95%" >
Criminal Records

</div>
<hr color=#004d66 size=3px >
<table width=100% cellspacing=20px cellpadding=5px >
<tr>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/csedb","root","admin");
String msql="select * from criminalmaster where  deptcode=? and status<>'removed'";
PreparedStatement smt=con.prepareStatement(msql);
smt.setString(1,(String)session.getAttribute("userid"));
ResultSet rs=smt.executeQuery();
int i=0;
while(rs.next())
	{
	String id=rs.getString("id");
	String nm=rs.getString("name");
	String ad=rs.getString("address");
	String ph=rs.getString("photo");
	String wd=rs.getString("wanted");
	String wimg=wd.equals("yes")?"<img src=../images/starx.gif height=20 >":"";
	String wbtn=wd.equals("yes")?"<a class=btn href=wanted.jsp?id="+id+"&wanted=no >Remove Wanted Tag</a>":"<a class=btn href=wanted.jsp?id="+id+"&wanted=yes >Add Wanted Tag</a>";
%>
	<td class=item >
	<center>
	<a href=showdetails.jsp?id=<%=id%> >
	<img src=../criminals/<%=ph%> height=150px ><br>
	</a>
	<b><%=nm%></b><br>
	<%=ad%><hr color=#fdfdfd size=1px >
	<%=wimg%><%=wbtn%>
	</center>
	</td>
<%
	i++;
	if(i%4==0)
		out.println("</tr><tr>");
	}
con.close();
%>
</tr>
</table>
<hr color=#004d66 size=3px >
</div>
</center>
</body>
</html>