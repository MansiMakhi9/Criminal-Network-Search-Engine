<%@page import="java.sql.*" %>
<html>
<link href=../mystyle.css type=text/css rel=stylesheet />
<body class=page >
<br>
<br>
<center>
<div class=mainbox >
<div class=pageheading style="text-align:right;font-size:30px;width:95%" >
Criminals Graph
</div>
<hr color=#004d66 size=3px >
<table width=100% border=1 cellspacing=5px cellpadding=5px class=grid >
<tr><th>Dept.Code</th><th>Criminals</th></tr>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/csedb","root","admin");
String msql="select deptcode,count(*) from criminalmaster group by deptcode;";
Statement smt=con.createStatement();
ResultSet rs=smt.executeQuery(msql);
while(rs.next())
   {
   String dc=rs.getString("deptcode");
   int cnt=rs.getInt(2);
%>
    <tr><Td><%=dc%></Td><Td  ><div><hr width=<%=cnt%> size=15 color=orange align="left" ></div></Td></tr>
<%
   }
%>
</table>
<hr color=#004d66 size=3px >
</div>
</center>
</body>
</html>