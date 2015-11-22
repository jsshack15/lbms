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

<%!
    Connection con;
    Statement st;
    ResultSet rs;
%>
<%try
    {
        Class.forName("oracle.jdbc.driver.OracleDriver");       
        con=DriverManager.getConnection("jdbc:oracle:thin:lbms/lbms@localhost");
        st=con.createStatement();
        //rs=st.executeQuery("select * from books");
       // rs.first();
        String numbers = request.getParameter("number") ;
         

String names =request.getParameter("name");
         String authors = request.getParameter("author");
         //out.println(numbers);
         String query= "insert into stud values('"+numbers+"','"+names+"','"+authors+"')";
          
         
         if(st.executeUpdate(query) >0 )
         {
             out.println("Data Succesully Inserted");
         }
         else
         {
             out.println("Error in Insering data.");
         }
    }
   catch(Exception e)
   { 
       System.out.println(e);
  

 }
    
    out.println("<br><a href=index.html>Back</a>");
    out.println("<br><a href=views.jsp>View Results</a>");
%>

</body>
</html>