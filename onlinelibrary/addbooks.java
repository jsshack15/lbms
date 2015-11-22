//STEP 1. Import required packages
import java.sql.*;
import java.applet.*;
import java.awt.*;


public class addbooks extends Applet {
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   String DB_URL = "jdbc:mysql://localhost/abhy";

   //  Database credentials
   String USER = "root";
   String PASS = "fuckoff";
   
   Connection conn = null;
   Statement stmt = null;
   // JDBC driver name and database URL
   public void init()
   {
   String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   String DB_URL = "jdbc:mysql://localhost/abhy";

   //  Database credentials
   String USER = "root";
   String PASS = "fuckoff";
   
   Connection conn = null;
   Statement stmt = null;
   }//init
  
   public void start()
   {
       try
   {
      //STEP 2: Register JDBC driver
      Class.forName("com.mysql.jdbc.Driver");

      //STEP 3: Open a connection
      System.out.println("Connecting to a selected database...");
      conn = DriverManager.getConnection(DB_URL, USER, PASS);
      System.out.println("Connected database successfully...");
      
      //STEP 4: Execute a query
      System.out.println("Inserting records into the table...");
      stmt = conn.createStatement();
      
      String sql = "INSERT INTO addbooks " +
                   "VALUES ('ISIS wale', 'Zara', 'Ali', '18','ne','love','jihad','failaya')";
      stmt.executeUpdate(sql);
      /*sql = "INSERT INTO Registration " +
                   "VALUES (101, 'Mahnaz', 'Fatma', 25)";
      stmt.executeUpdate(sql);
      sql = "INSERT INTO Registration " +
                   "VALUES (102, 'Zaid', 'Khan', 30)";
      stmt.executeUpdate(sql);
      sql = "INSERT INTO Registration " +
                   "VALUES(103, 'Sumit', 'Mittal', 28)";
      stmt.executeUpdate(sql);*/
      System.out.println("Inserted records into the table...");
   }catch(SQLException se){
      //Handle errors for JDBC
      se.printStackTrace();
   }catch(Exception e){
      //Handle errors for Class.forName
      e.printStackTrace();
   }
finally{
      //finally block used to close resources
      try{
         if(stmt!=null)
            conn.close();
      }catch(SQLException se){
      }// do nothing
      try{
         if(conn!=null)
            conn.close();
      }catch(SQLException se){
         se.printStackTrace();
      }//end finally try
   }//end try
   System.out.println("Goodbye!");
}//start
}//end addbooks