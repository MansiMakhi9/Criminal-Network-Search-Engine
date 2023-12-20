<%!
String getddl(String name,String defaultval,String...list)
	{
	String s="<select name="+name+" required >";
	s=s+"<option value='' >Select</option>";
	for(String item:list)
		{
		if(item.equals(defaultval))
			s=s+"<option selected >"+item+"</option>";
		else
			s=s+"<option>"+item+"</option>";
		}
	s=s+"</select>";
	return s;
	}
%>
<html>
<link href=../mystyle.css type=text/css rel=stylesheet />
<body class=page >
<br>

<center>
<div class=mainbox >
<div class=pageheading style="text-align:right;font-size:30px;width:95%" >
Add Criminal Record
</div>
<hr color=#004d66 size=3px >
<form action=addrecord.jsp method=post enctype="multipart/form-data" >
<table class=frmgrid >
<tr><td>Name : </td><td><input type=text name=name size=50 required ></td></tr>
<tr><td>Address : </td><td><input type=text name=address size=20 required ></td></tr>
<tr><td>Gender : </td><td><input type=radio name=gender size=20 value=Male >Male <input type=radio name=gender size=20 value=Female >Female </td></tr>
<tr><td>Age : </td><td><input type=text name=age size=5 required pattern="\d{2}" ></td></tr>
<tr><td>Height : </td><td><input type=text name=height size=5 required >cm</td></tr>
<tr><td>BodyType : </td><td><%=getddl("bodytype","","slim","fat","medium","strong")%></td></tr>
<tr><td>SkinColor : </td><td><%=getddl("skincolor","","black","fair","medium")%></td></tr>
<tr><td>EyeColor : </td><td><%=getddl("eyecolor","","black","brown","blue","green")%></td></tr>
<tr><td>HairStyle: </td><td><%=getddl("hairstyle","","plain","curly","blad","partialblad")%></td></tr>
<tr><td>BodyMarks : </td><td><input type=text name=bodymarks size=50 required ></td></tr>
<tr><td>CrimeDetails : </td><td><textarea name=details rows=5 cols=50 ></textarea></td></tr>
<tr><td>Status : </td><td><%=getddl("status","","jail","tadipar","out")%></td></tr>
<tr><td>Wanted : </td><td><%=getddl("wanted","","yes","no")%></td></tr>
<tr><td>Photo : </td><td><input type=file name=photo accept="image/*" ></td></tr>
<tr><td></td><td><input type=submit value=Add ></td></tr>
</table>
</form>
<hr color=#004d66 size=3px >	
</div>
<br><br>
</center>
</body>
</html>