<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*" %>
<%@page import="com.sun.jna.Library"%>
<%@page import="com.sun.jna.Native"%>
<%@page import="com.sun.jna.*"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
    function s() {
    	/** Simple example of Windows native library declaration and usage. */
    	public class Read{
    	   public interface MasterRD extends Library {
    	       // FREQUENCY is expressed in hertz and ranges from 37 to 32767
    	       // DURATION is expressed in milliseconds
    	       public boolean dhba(int FREQUENCY, int DURATION);
    	       public void rfid(int DURATION);
    	   }
    	   public static void main(String[] args) {
    	    MasterRD lib = (Kernel32) Native.loadLibrary("MasterRD.dll", 
    	           MasterRD.class);
    	   }
    	}
    }
    public interface NativeExample{
    	 
    	  public int rf_init_com(String param1);
    	  public boolean rf_antenna_sta();
    	  public boolean rf_M1_read();
    	 
    	}
    if(
			NULL == rf_init_com           ||
			NULL == rf_antenna_sta    ||
			NULL == rf_request    ||
			NULL == rf_anticoll    ||
			NULL == rf_select    ||
			NULL == rf_halt    ||
			NULL == rf_M1_authentication2    ||
			NULL == rf_M1_read    ||
			NULL == rf_M1_write    ||
			NULL == rf_ClosePort 
		     ){			
			AfxMessageBox(_T("Load MasterRD.dll failed !"));
			return FALSE;
		}
	}
	else{
		AfxMessageBox(_T("Load MasterRD.dll failed !"));
		return FALSE;
	}
	void CMainDlg::OnButtonSearch() 
	{
		WORD icdev = 0x0000;
		unsigned char mode = 0x52;
		int status;
		unsigned short TagType;
		unsigned char bcnt = 0x04;
		unsigned char Snr[MAX_RF_BUFFER];
		unsigned char len;
		unsigned char Size;
		
		status = rf_request(icdev,mode,&TagType);
		if(status) {
			m_edit_serial.SetWindowText("");
			return ;
		}
		
		status = rf_anticoll(icdev,bcnt,Snr,&len);
		if(status || len != 4) { 
			m_edit_serial.SetWindowText("");
			return ;
		}
		
		status = rf_select(icdev,Snr,len,&Size);
		if(status) {
			m_edit_serial.SetWindowText("");
			return ;
		}
		
		m_edit_serial.SetWindowTextEx(Snr,len);	
	}
</script>
<meta charset="ISO-8859-1">
        <meta name="viewport" content="width=device-width">
        <style>
               
            [type="button"] 
            {  
               font-size:17px  ;
               width: 80px;
            }
            [type="submit"] 
            {  
               font-size:17px  ;
               width: 80px;
            }
        </style>
<title>Shelf</title>
</head>
<body bgcolor="black" text="cyan">
<form action="inserts.jsp" method="POST">
           <center>
               <br>
               <h2> Insert Into Student System</h2>
               <br>
           <table>
               <tr>
               <td> Student Number</td> 
               <td> <input type ="text" size="20" name="number" id="1" placeholder="Book Number"> </td>
               </tr>
               <tr>
               <td> Student Name</td>
               <td><input type ="text" size="20" name="name"   placeholder="Book Name"> </td>
               </tr>
               <tr>
               <td> Student Number</td>
               <td><input type ="text" size="20" name="author" placeholder="Book Author"> </td>
               </tr>
           </table>
           		<br>
               <input type="button" value = "Request" onclick="s()"></input>
               <br>
               <br>
               <input type="submit" value = "Insert"></input>
               <br>
               <br>
               <a href="index.html"><input type ="button" value = "Back"></a>
          </center>
          </form>
          <iframe src="views.jsp" width="100%" height="350"></iframe>
</body>
</html>