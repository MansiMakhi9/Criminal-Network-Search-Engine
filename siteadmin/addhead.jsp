<%@page import="java.sql.*" %>
<%

String ct=request.getParameter("city");
String msg="";
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/csedb","root","admin");
String msqlx="select * from loginmaster where userid=?";
PreparedStatement smtx=con.prepareStatement(msqlx);
smtx.setString(1,ct);
ResultSet rs=smtx.executeQuery();
if(rs.next())
	msg="Already Exists..";
else
	{
	String msql="insert into loginmaster values(?,?,?)";
	PreparedStatement smt=con.prepareStatement(msql);
	smt.setString(1,ct);
	smt.setString(2,ct);
	smt.setString(3,"head");
	smt.executeUpdate();
	msg="Department Head Added Successfully..";
	}
   
con.close();
%>
<html>
<link href=../mystyle.css type=text/css rel=stylesheet />
<body class=page >
<br>

<center>
<div class=mainbox >
<div class=pageheading style="text-align:right;font-size:30px;width:95%" >
Add Department Head
</div>
<hr color=#004d66 size=3px >
<%=msg%>
<hr color=#004d66 size=3px >	
</div>
</center>
</body>
</html>