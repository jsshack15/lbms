<%-- 
    Document   : view
    Created on : Mar 19, 2014, 3:11:22 PM
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
        rs=st.executeQuery("select * from book");
        rs.first();
        out.println("<br>");
        out.println("<center>");
        out.println("<h2>Book Details In Database </h2>");
        out.println("<table border = 1 >");
        out.println("<th>");
        out.println("BookNumber");
        out.println("</th>");
        out.println("<th>");
        out.println("BookName");
        out.println("</th>");
        out.println("<th>");
        out.println("Author");
        out.println("</th>");
        do
        {
            out.println("<tr>");
            out.println("<td>");
            out.println(rs.getString(1));
            out.println("</td>");
            out.println("<td>");
            out.println(rs.getString(2));
            out.println("</td>");
            out.println("<td>");
            out.println(rs.getString(3));
            out.println("</td>");
        }while(rs.next());               
    //response.sendRedirect("display.jsp");
            out.println("</table>");
            out.println("<br> <a href=index.html>Back</a>");
            out.println("<center>");
    }
    catch(Exception e)
    { 
        System.out.println(e);
    }
    
%>

