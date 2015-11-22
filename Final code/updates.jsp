<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shelf</title>
</head>
<body bgcolor="black" text="cyan">

<%
    Connection con;
    Statement st;
    ResultSet rs;
    try
    {
    	Class.forName("oracle.jdbc.driver.OracleDriver");       
        con=DriverManager.getConnection("jdbc:oracle:thin:lbms/lbms@localhost");
        st=con.createStatement();
        String bkno = request.getParameter("booknumber");
        String bkname = request.getParameter("bookname");
        String bkauthor = request.getParameter("bookauthor");
        String query = "update stud set sname ='"+ bkname +"',mob='"+ bkauthor +"' where sid ='"+ bkno +"'";
        if(st.executeUpdate(query)>0)
        {
            out.println("Updated Sucesfully");
        }
        else
        {
            out.println("Error Updating");
        }
       }
       catch(Exception e)
       { 
          System.out.println(e);
       }
       out.println("<br>");
       out.println("<a href=index.html>Back</a>");
        out.println("<br><a href=views.jsp>View Results</a>");
%>
<iframe src="view.jsp" width="100%" height="350"></iframe>
</body>
</html>