<%@page import="java.sql.*,java.util.*" %>
<%
String loginmsg="";
if(request.getParameter("login")!=null)
	loginmsg="Invalid UserID/Pwd";
%>
<html>
<link href=mystyle.css type=text/css rel=stylesheet />
<body class=page >
<div style="text-align:center;background-color:black;" >
<span class=heading >Criminal Network Search Engine</span>
</div>
<table width=100% cellspacing=40px cellpadding=20px >
<tr style="vertical-align:top" >

<td  class=mainbox  >
<center>
<img src=images/starx.gif height=30px >
<span  style="color:red;font-family:impact;letter-spacing:5px;font-size:25px" >Wanted</span>
<img src=images/starx.gif height=30px >
<hr>
<table  cellspacing=20px cellpadding=10px >
<tr>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/csedb","root","admin");
String msql="select * from criminalmaster where wanted='yes'";
PreparedStatement smt=con.prepareStatement(msql);
ResultSet rs=smt.executeQuery();
int i=0;
while(rs.next())
	{
	String id=rs.getString("id");
	String nm=rs.getString("name");
	String ad=rs.getString("address");
	String ph=rs.getString("photo");
	String wd=rs.getString("wanted");
%>
	<td class=item >
	<center>
	
	<img src=criminals/<%=ph%> height=150px ><br>
	
	<b><%=nm%></b><br>
	<%=ad%><hr color=#fdfdfd size=1px >
	
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
</center>
</td>
	<td style="width:300px" >
		<center>
		<img src=images/logo.png width=150px >
		</center>
		<form action=login.jsp method=post >
		<table class='smallbox grid' >
		<tr><td>UserID</td><td><input type=text name=userid required size=10 ></td></tr>
		<tr><td>Password</td><td><input type=password name=pwd required size=10 ></td></tr>
		<tr><td></td><td><input type=submit value=Login ></td></tr>
		<tr><td colspan=2 class=errmsg style="text-align:center" ><%=loginmsg%></td></tr>
		</table>
		</form>
	</td>
</tr>
</table>

</body>
</html>