<%-- 
    Document   : update
    Created on : Mar 22, 2014, 11:16:53 PM
    Author     : AparajitThirukonda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;" %>
<!DOCTYPE html>
<%
    Connection con;
    Statement st;
    ResultSet rs;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookjsp","root","");
        st=con.createStatement();
        String bkno = request.getParameter("booknumber");
        String bkname = request.getParameter("bookname");
        String bkauthor = request.getParameter("bookauthor");
        String query = "update book set name ='"+ bkname +"',author='"+ bkauthor +"' where number ='"+ bkno +"'";
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
        out.println("<br><a href=view.jsp>View Results</a>");
%>
