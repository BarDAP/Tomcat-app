<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%> 
<%@ page import="java.io.*" %>
<%
String name=(String)request.getParameter("param1");
String file = application.getRealPath("/") + "test.txt";
FileWriter filewriter = new FileWriter(file, true);
filewriter.write("Email: " + name + "\n");
filewriter.close();
%>