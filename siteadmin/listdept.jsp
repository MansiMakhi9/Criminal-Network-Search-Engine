<%@page import="java.sql.*" %>
<html>
<link href=../mystyle.css type=text/css rel=stylesheet />
<style>
    tr:hover
    {
        background-color: #f8f8f8;
    }
</style>
<body class=page >
<br>
<br>
<center>
<div class=mainbox >
<div class=pageheading style="text-align:right;font-size:30px;width:95%" >
Department  List
</div>
<hr color=#004d66 size=3px >
<table width=100% border=1 cellspacing=5px cellpadding=5px class=grid >
<tr><th>Dept.Code</th><th>City</th><th>Area</th><th>ContactNo</th></tr>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/csedb","root","admin");
String msql="select * from dept order by city,area";
Statement smt=con.createStatement();
ResultSet rs=smt.executeQuery(msql);
while(rs.next())
   {
   String dc=rs.getString("deptcode");
   String ct=rs.getString("city");
   String ar=rs.getString("area");
   String cn=rs.getString("contactno");
%>
    <tr><Td><%=dc%></Td><Td><%=ct%></Td><Td><%=ar%></Td><Td><%=cn%></Td></tr>
<%
   }
%>
</table>
<hr color=#004d66 size=3px >
</div>
</center>
</body>
</html>