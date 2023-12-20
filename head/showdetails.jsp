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
<%
String id=request.getParameter("id");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/csedb","root","admin");
String msql="select * from criminalmaster where id=?";
PreparedStatement smt=con.prepareStatement(msql);
smt.setString(1,id);
ResultSet rs=smt.executeQuery();
rs.next();
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
	String dlink="<a href=delrec.jsp?id="+id+" class=btn >Delete Record</a>";
%>
<table class=frmgrid cellspacing=10px cellpadding=20px >
	<tr style="vertical-align:top" >
	<td style="width:150px" rowspan=2 >
		<img src=../criminals/<%=pho%> height=400px >
	</td>	
	<Td style="valign:top;line-height:40px" >
		<b><%=nam%></b><br>
		<%=add%>
		<hr color=#f8f8f8 size=1px >
		Crime : <%=cdt%><br>
		<hr color=#f8f8f8 size=1px >
		Marks : <%=bmk%><br>

	</td>
	<td  style="valign:top;line-height:40px" >
		Age :<%=age%><br>
		Height:<%=hgt%><br>
		Skin Color:<%=sco%><br>		
		Eye Color:<%=eco%><br>
		Hair Style:<%=hst%><br>
		Body Type:<%=btp%><br>
	</td>
	</tr>
	<tr><td colspan=2 align=right ><%=dlink%></td></tr>
</table>

<hr color=#004d66 size=3px >
</div>
</center>
</body>
</html>