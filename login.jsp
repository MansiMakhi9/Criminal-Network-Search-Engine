<%@page import="java.sql.*" %>
<%
String uid=request.getParameter("userid");
String pwd=request.getParameter("pwd");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/csedb","root","admin");
String msql="select userrole from loginmaster where userid=? and pwd=?";
PreparedStatement smt=con.prepareStatement(msql);
smt.setString(1,uid);
smt.setString(2,pwd);
ResultSet rs=smt.executeQuery();
if(rs.next())
	{
	session.setAttribute("userid",uid);
	String urole=rs.getString(1);
	if(urole.equals("admin"))
		response.sendRedirect("siteadmin/main.jsp");
   	if(urole.equals("dept"))
		response.sendRedirect("dept/main.jsp");
	if(urole.equals("head"))
		response.sendRedirect("head/main.jsp");
	}
else
	{
	response.sendRedirect("index.jsp?login=0");
	}	
con.close();
%>