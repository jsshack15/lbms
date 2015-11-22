<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete</title>
</head>
<body bgcolor="black" text="cyan">


<%!
    Connection con;
    Statement st;
    ResultSet rs;
%>
<%
    try
    {
    	Class.forName("oracle.jdbc.driver.OracleDriver");       
        con=DriverManager.getConnection("jdbc:oracle:thin:lbms/lbms@localhost");
        st=con.createStatement();
        String d = request.getParameter("dnum");
        String query = "delete from books where bid='" + d +"'" ;
        if(st.executeUpdate(query)>0)
        {
            out.println("Deleted Succefully");
        }
        else
        {
            out.println("Error Deleting");
        }
    
} catch (ClassNotFoundException e) {
	  e.printStackTrace();
	  } catch (SQLException e) {
	  e.printStackTrace();
	  } finally {
	  try {
	  //rs.close();
	  //upd.close();
	  st.close();
	  con.close();
	  } catch (SQLException e) {
	  e.printStackTrace();
	  }
	  }  
    out.println("<br><a href=index.html>Back</a>");
 out.println("<br><a href=view.jsp>View Results</a>");
%>
<iframe src="view.jsp" width="100%" height="350"></iframe>
</body>
</html>