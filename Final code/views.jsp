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
        rs=st.executeQuery("select * from stud");
//         rs.first();
//         out.println("<br>");
//         out.println("<center>");
        out.println("<h2>Book Details In Database </h2>");%>
        <TABLE width="50%" height="20%">
<center><TR>
                    <TH>SID</TH>
                    <TH>SName</TH>
                    <TH>Number</TH>
                </TR>
                </center>
<%
while(rs.next()) {%>


<TR>
    <TD> <%=rs.getString(1)%> </TD>
    <TD> <%=rs.getString(2) %> </TD>
    <TD> <%=rs.getString(3) %> </TD>
</TR>


<% 
} %>
</TABLE>
<br> <a href=/index.html>Back</a> <%      
    //response.sendRedirect("display.jsp");
            //out.println("</table>");
            //out.println("<br> <a href=index.html>Back</a>");
            //out.println("<center>");
    }
    catch(Exception e)
    { 
        System.out.println(e);
    }
    
%>


</body>
</html>