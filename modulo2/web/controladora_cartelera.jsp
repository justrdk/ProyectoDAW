<%-- 
    Document   : controladora_cartelera
    Created on : Dec 8, 2012, 5:58:15 PM
    Author     : Gabriel
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Tanda"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="Clases.DBA"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%

    if(request.getParameter("idCine") != null && request.getParameter("fecha") != null)
    {
        DBA dba = new DBA();
        Gson g = new Gson();
        ArrayList<Tanda> tandas = new ArrayList<Tanda>();
        
        final int idCine = Integer.parseInt(request.getParameter("idCine"));
        final String fecha = request.getParameter("fecha");
        
        final String select = "select T.idTanda, S.idSala, P.idPelicula, T.fecha, T.hora_inicial, T.hora_final, " +
                        "P.nombre, P.duracion, P.rating, P.sinopsis, " +
                        "P.director, P.trailer, P.year, P.genero, P.idioma, P.formato, P.imagenDescriptiva "+ 
                        "from tanda T inner join sala S " +
                        "on S.idSala = T.idSala inner join Pelicula P " +
                        "on T.idPelicula = P.idPelicula " +
                        "where S.idCine = ? and T.fecha = ?";
        
        Connection con = dba.getConnection();
        PreparedStatement query = con.prepareStatement(select);
        query.setInt(1, idCine);
        query.setDate(2, java.sql.Date.valueOf(fecha));
        
        ResultSet rs = query.executeQuery();
        
        while(rs.next())
        {
            tandas.add(new Tanda(rs.getInt(1),rs.getInt(2), rs.getInt(3), rs.getString(4), 
            rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
            rs.getString(10), rs.getString(11), rs.getString(12), rs.getInt(13), rs.getString(14),
            rs.getString(15), rs.getString(16), rs.getString(17)));            
        }
        
        out.print(g.toJson(tandas));
        
        query.close();
        dba.close();
    }
    
    
    
%>        
<%@page contentType="text/html" pageEncoding="UTF-8"%>
