<%-- 
    Document   : delete
    Created on : Mar 22, 2014, 11:14:49 PM
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
        String d = request.getParameter("dnum");
        String query = "Delete from book where number =" + d ;
        if(st.executeUpdate(query)>0)
        {
            out.println("Deleted Succefully");
        }
        else
        {
            out.println("Error Deleting");
        }
    }
    catch(Exception e)
    {
        System.out.println(e);
    }   
    out.println("<br><a href=index.html>Back</a>");
 out.println("<br><a href=view.jsp>View Results</a>");
%>
