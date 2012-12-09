/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;
import java.sql.*;

/**
 *
 * @author Gabriel
 */
public class DBA {
    
    private String user;
    private String password;
    private Connection con;
    private String url = "jdbc:mysql://localhost:3306/cines";
    
    
    public DBA()
    {
        user = "root";
        password = "admin";
        
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con = DriverManager.getConnection(url,user,password);                        
        } catch (Exception ex) {
            
        }

    }
    
    public void close()
    {
        try 
        {
            con.close();
        } catch (Exception ex) 
        {
            
        }
    }
    
    public Connection getConnection()
    {
        return con;
    }
    
}
