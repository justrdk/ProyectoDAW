<%@page import="java.sql.*"%>
<%@page import="org.jdom.Document"%>
<%@page import="org.jdom.input.SAXBuilder"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="org.jdom.output.XMLOutputter"%>
<%@page import="org.jdom.Element"%>
<%
    try {

        Connection con = null;
        String dbuser = "root";
        String dbpw = "admin";
        String url = "jdbc:mysql://localhost:3306/cines";
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, dbuser, dbpw);
        PreparedStatement query = null;
        ResultSet rs = null;

        int accion = Integer.parseInt(request.getParameter("accion"));
        String datos = "";

        if (accion == 1) {

            query = con.prepareStatement("select idPelicula,nombre from pelicula");
            rs = query.executeQuery();

            while (rs.next()) {
                datos += rs.getInt(1) + "$" + rs.getString(2) + "#";
            }

            if (datos.length() > 0) {
                out.print(datos);
            } else {
                out.print("none");
            }

        } else if (accion == 2) {

            Element pelicula = new Element("pelicula");
            int idPelicula = Integer.parseInt(request.getParameter("idPelicula"));
            String nombrePelicula = "";
            String duracion = "";
            String rating = "";
            String sinopsis = "";
            String director = "";
            String trailer = "";
            int year = 0;
            String genero = "";
            String idioma = "";
            String formato = "";
            String imagen = "";

            query = con.prepareStatement("select nombre,duracion,rating,sinopsis,director,trailer,year,genero,idioma,formato,imagenDescriptiva from pelicula where idPelicula = ?");
            query.setInt(1, idPelicula);

            rs = query.executeQuery();

            while (rs.next()) {
                nombrePelicula = rs.getString(1);
                duracion = rs.getString(2);
                rating = rs.getString(3);
                sinopsis = rs.getString(4);
                director = rs.getString(5);
                trailer = rs.getString(6);
                year = rs.getInt(7);
                genero = rs.getString(8);
                idioma = rs.getString(9);
                formato = rs.getString(10);
                imagen = rs.getString(11);
            }

            pelicula.setAttribute("nombre", nombrePelicula);
            pelicula.setAttribute("duracion",duracion);
            pelicula.setAttribute("rating",rating);
            pelicula.setAttribute("sinopsis",sinopsis);
            pelicula.setAttribute("director",director);
            pelicula.setAttribute("trailer",trailer);
            pelicula.setAttribute("year",String.valueOf(year));
            pelicula.setAttribute("genero",genero);
            pelicula.setAttribute("idioma",idioma);
            pelicula.setAttribute("formato",formato);
            pelicula.setAttribute("imagen",imagen);

            XMLOutputter salida = new XMLOutputter();
            File fichero = new File(application.getRealPath("\\") + "configPelicula" + idPelicula + ".xml");
            if (!fichero.exists()) {
                FileOutputStream FOS = new FileOutputStream(getServletContext().getRealPath("/") + "configPelicula" + idPelicula + ".xml");
                salida.output(pelicula, FOS);
                FOS.close();
            }

            out.print("true");
        }


        query.close();
        con.close();

    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>
