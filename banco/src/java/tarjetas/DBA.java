/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tarjetas;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Gabriel
 */
public class DBA {
    
    private String user;
    private String password;
    private Connection con;
    private String url = "jdbc:mysql://localhost:3306/banco";
    //private String url = "jdbc:mysql://192.168.0.13:3306/banco";
    
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
