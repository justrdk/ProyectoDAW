/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tarjetas;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Gabriel
 */
@WebService(serviceName = "wsTarjetas")
public class wsTarjetas {

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "hello")
    public String hello(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }
    
    @WebMethod(operationName="verificarSaldo")
    public Boolean verificarSaldo(@WebParam(name="cuenta") String cuenta, @WebParam(name="costo") float costo)
    {
        DBA dba = new DBA();
        float saldo = 0;        
        String error = "";
        
        Connection con = dba.getConnection();
        
        PreparedStatement query;
        try 
        {
            query = con.prepareStatement("select saldo from Cuenta where cuenta = ?");
            query.setString(1, cuenta);
            ResultSet rs = query.executeQuery();
            rs.next();            
            saldo = rs.getFloat(1);             
            
            
            if(costo <= saldo)
            {
                query = con.prepareStatement("update cuenta set saldo = ? where cuenta = ?");
                query.setFloat(1, saldo-costo);
                query.setString(2, cuenta);
                query.executeUpdate();                
            }
            
        } catch (Exception  ex) 
        {
            error += ex.toString();
        }
        
        return (costo <= saldo);
    }
}
