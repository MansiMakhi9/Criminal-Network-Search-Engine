<html>
<link href=../mystyle.css type=text/css rel=stylesheet />
<body class=page >
<center>
<img src=../images/mplogo.png width=70% >
<hr>
<span class=subheading >Dept: <%=(String)session.getAttribute("userid")%> </span>
<hr>
<table width=95% cellspacing=10px >
<tr><td class=menubar ><img src=../images/bullet.png > <a href=searchrecfrm.jsp target=f2 class=menulink >Search Record</a></td></tr>
<tr><td class=menubar ><img src=../images/bullet.png > <a href=listrec.jsp target=f2 class=menulink >Criminal Records</a></td></tr>
<tr><td class=menubar ><img src=../images/bullet.png > <a href=../index.jsp target=_top class=menulink >Logout</a></td></tr>
</table>
</center>
</body>
</html>