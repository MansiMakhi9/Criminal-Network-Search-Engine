<%@page import="java.sql.*,java.util.*" %>
<%

String id=request.getParameter("id");



Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/csedb","root","admin");

String msql="delete from criminalmaster where id=?";
PreparedStatement smt=con.prepareStatement(msql);
smt.setString(1,id);
smt.executeUpdate();

   
con.close();
response.sendRedirect("listrec.jsp");
%>
