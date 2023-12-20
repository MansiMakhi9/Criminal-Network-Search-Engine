<%@page import="java.sql.*" %>
<%
String dc=request.getParameter("deptcode");
String ct=request.getParameter("city");
String ar=request.getParameter("area");
String cn=request.getParameter("contactno");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/csedb","root","admin");

String msql="insert into dept values(?,?,?,?)";
PreparedStatement smt=con.prepareStatement(msql);
smt.setString(1,dc);
smt.setString(2,ct);
smt.setString(3,ar);
smt.setString(4,cn);
smt.executeUpdate();

msql="insert into loginmaster values(?,?,?)";
smt=con.prepareStatement(msql);
smt.setString(1,dc);
smt.setString(2,dc);
smt.setString(3,"dept");
smt.executeUpdate();

   
con.close();
%>
<html>
<link href=../mystyle.css type=text/css rel=stylesheet />
<body class=page >
<br>

<center>
<div class=mainbox >
<div class=pageheading style="text-align:right;font-size:30px;width:95%" >
Add Department 
</div>
<hr color=#004d66 size=3px >
Department added into database<br>
By default UserID and Password are same.<br>
department can change their password after login.
<hr color=#004d66 size=3px >	
</div>
</center>
</body>
</html>