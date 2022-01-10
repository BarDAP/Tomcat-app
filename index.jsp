<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	function take_values(){
		ValidateEmail()
		var n=document.forms["myform"]["name"].value;
		if (n==null || n=="") {
	        alert("Please enter User Name");
	        return false;
	    }else{
	    	 var http = new XMLHttpRequest();
	    	    http.open("POST", "http://localhost:8080/sasha_bar/input.jsp", false);
	    	    http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	    	    var params = "param1=" + n; // probably use document.getElementById(...).value
	    	    http.send(params);
	    	    http.onload = function() {
	    	        alert(http.responseText);
	    	    }

	    }    
	}
function emailcheck(str) {

var at="@"
var dot="."
var lat=str.indexOf(at)
var lstr=str.length
var ldot=str.indexOf(dot)
if (str.indexOf(at)==-1){

return false
}

if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){

return false
}

if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){

return false
}

if (str.indexOf(at,(lat+1))!=-1){

return false
}

if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){

return false
}

if (str.indexOf(dot,(lat+2))==-1){
return false
}

if (str.indexOf(" ")!=-1){

return false
}

return true 
}

function ValidateEmail(){
	var invemail = document.getElementById("invEM");
	var valemail = document.getElementById("valEM");
	var emailID=document.forms["myform"]["name"].value;

if ((emailID==null)||(emailID=="")){
invemail.setAttribute("style","display:block")
valemail.setAttribute("style","display:none")

}
if (emailcheck(emailID)==false){
invemail.setAttribute("style","display:block")
valemail.setAttribute("style","display:none")

}
if(emailcheck(emailID)==true){

invemail.style.display="none"
valemail.setAttribute("style","display:block")
}
}	
</script>
</head>
<body>
<center>
<form name="myform" >
	EMAIL <input type="text" name="name">
<br>
<input type="button" value="Submit" onclick="return take_values()">
<div style="display: none" id="invEM" name="postId"><p >Invalid E-mail</p></div>
<div style="display: none" id="valEM" name="valEM"><p >Valid E-mail</p></div>
</form>
</center>
</body>
</html>