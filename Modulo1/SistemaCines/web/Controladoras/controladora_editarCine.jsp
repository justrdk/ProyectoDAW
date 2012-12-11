<%@page import="java.sql.*"%>
<%
    try {

        int accion = Integer.parseInt(request.getParameter("accion"));
        Connection con = null;
        String dbuser = "root";
        String dbpw = "admin";
        String url = "jdbc:mysql://localhost:3306/cines";
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, dbuser, dbpw);
        PreparedStatement query = null;
        String datosCine = "";
        int idCine = 0;
        String nombre = "";
        String ciudad = "";
        String vision = "";
        String mision = "";
        String logo = "";
        String latitud = "";
        String longitud = "";

        if (accion == 1) {
            idCine = Integer.parseInt(request.getParameter("idCine"));
            query = con.prepareStatement("select nombre,ciudad,logo,latitud,longitud,vision,mision from cine where idCine = ?");
            query.setInt(1, idCine);
            ResultSet rs = query.executeQuery();

            while (rs.next()) {
                datosCine += rs.getString(1) + "$" + rs.getString(2) + "$" + rs.getString(3) + "$" + rs.getString(4) + "$"
                        + rs.getString(5) + "$" + rs.getString(6) + "$" + rs.getString(7) + "#";
            }

            if (datosCine.length() > 0) {
                out.print(datosCine);
            } else {
                out.print("none");
            }

        } else if (accion == 2) {
            idCine = Integer.parseInt(request.getParameter("idCine"));
            nombre = request.getParameter("nombre");
            ciudad = request.getParameter("ciudad");
            vision = request.getParameter("vision");
            mision = request.getParameter("mision");
            logo = request.getParameter("logo");
            latitud = request.getParameter("latitud");
            longitud = request.getParameter("longitud");

            query = con.prepareStatement("update cine set nombre=?,ciudad=?,vision=?,mision=?,logo=?,latitud=?,longitud=? where idCine = ?");
            query.setString(1, nombre);
            query.setString(2, ciudad);
            query.setString(3, vision);
            query.setString(4, mision);
            query.setString(5, logo);
            query.setString(6, latitud);
            query.setString(7, longitud);
            query.setInt(8, idCine);

            int row = query.executeUpdate();

            if (row > 0) {
                out.print("true");
            } else {
                out.print("false");
            }

        } else if (accion == 3) 
        {
            
        }
        query.close();
        con.close();

    } catch (Exception e) {
        out.print("false");
    }
%>
