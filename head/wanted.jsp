<%@page import="java.sql.*,java.util.*" %>
<%

String id=request.getParameter("id");
String wt=request.getParameter("wanted");


Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/csedb","root","admin");

String msql="update criminalmaster set wanted=? where id=?";
PreparedStatement smt=con.prepareStatement(msql);
smt.setString(1,wt);
smt.setString(2,id);
smt.executeUpdate();

   
con.close();
response.sendRedirect("listrec.jsp");
%>
