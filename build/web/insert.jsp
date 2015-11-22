<%-- 
    Document   : insert
    Created on : Mar 19, 2014, 3:08:49 PM
    Author     : AparajitThirukonda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;" %>
<%!
    Connection con;
    Statement st;
    ResultSet rs;
%>
<!DOCTYPE html>
<%  
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookjsp","root","");
        st=con.createStatement();
        //rs=st.executeQuery("select * from login");
       // rs.first();
        String numbers = request.getParameter("number") ;
         String names =request.getParameter("name");
         String authors = request.getParameter("author");
         //out.println(numbers);
         String query= "insert into book values('"+numbers+"','"+names+"','"+authors+"')";
          
         
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
    out.println("<br><a href=view.jsp>View Results</a>");
%>
