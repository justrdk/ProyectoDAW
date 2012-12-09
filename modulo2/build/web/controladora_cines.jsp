<%-- 
    Document   : controladora_cartelera
    Created on : Dec 8, 2012, 5:58:15 PM
    Author     : Gabriel
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Cine"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="Clases.DBA"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%

    
        DBA dba = new DBA();
        Gson g = new Gson();
        ArrayList<Cine> cines = new ArrayList<Cine>();
        
        final String select = "select idCine, nombre, ciudad from cine;";
        
        Connection con = dba.getConnection();
        PreparedStatement query = con.prepareStatement(select);        
        
        ResultSet rs = query.executeQuery();
        
        while(rs.next())
        {
            cines.add(new Cine(rs.getInt(1), rs.getString(2), rs.getString(3)));            
        }
        
        out.print(g.toJson(cines));
        
        query.close();
        dba.close();
    
    
    
    
%>        
<%@page contentType="text/html" pageEncoding="UTF-8"%>
