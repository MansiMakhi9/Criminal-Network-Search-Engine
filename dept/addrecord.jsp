<%@page import="java.sql.*,java.util.*" %>
<%
String nm=request.getParameter("name");
String ad=request.getParameter("address");
String gd=request.getParameter("gender");
String ht=request.getParameter("height");
String sc=request.getParameter("skincolor");
String ec=request.getParameter("eyecolor");
String ag=request.getParameter("age");
String bt=request.getParameter("bodytype");
String bm=request.getParameter("bodymarks");
String st=request.getParameter("status");
String wt=request.getParameter("wanted");
String hs=request.getParameter("hairstyle");
String dt=request.getParameter("details");

Part photo=request.getPart("photo");
Random rnd=new Random();
int nfnm=Math.abs(rnd.nextInt());

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/csedb","root","admin");

String msql="insert into criminalmaster(name,deptcode,address,gender,height,skincolor,hairstyle,age,bodytype,bodymarks,eyecolor,status,wanted,crimedetails,photo) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
PreparedStatement smt=con.prepareStatement(msql);
smt.setString(1,nm);
smt.setString(2,(String)session.getAttribute("userid"));
smt.setString(3,ad);
smt.setString(4,gd);
smt.setString(5,ht);
smt.setString(6,sc);
smt.setString(7,hs);
smt.setString(8,ag);
smt.setString(9,bt);
smt.setString(10,bm);
smt.setString(11,ec);
smt.setString(12,st);
smt.setString(13,wt);
smt.setString(14,dt);
smt.setString(15,nfnm+".jpg");
smt.executeUpdate();

String ppath=application.getRealPath("criminals");

photo.write(ppath+"\\"+nfnm+".jpg");


   
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
Record added into database
<hr color=#004d66 size=3px >	
</div>
</center>
</body>
</html>