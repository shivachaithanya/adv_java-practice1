/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package hpora;

import java.sql.Connection;
import java.sql.DriverManager;



/**
 *
 * @author 31969740
 */
public class ConnectOra {
     Connection con = null;
		 
		  
		/**
		 * Connect constructor comment.
		 */

		 public Connection conn() throws Exception 
		{
			 
             String dbURL = "jdbc:oracle:thin:@oradevdb.hpcl.co.in:1551:oradevdb";
			 String dbDriver = "oracle.jdbc.driver.OracleDriver";		 					 
			 Class.forName(dbDriver);		
             con = DriverManager.getConnection(dbURL,"dev_user","dev_321");                         
                       
			 return con; 
		} 
}
