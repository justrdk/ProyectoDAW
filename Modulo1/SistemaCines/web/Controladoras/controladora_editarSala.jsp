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
        String datosSala = "";
        int idSala = 0;
        int idNuevoCine = 0;
        String nuevoNombre = "";
        ResultSet rs = null;

        switch (accion) {
            case 1: {
                query = con.prepareStatement("select idSala,nombre from sala");
                rs = query.executeQuery();

                while (rs.next()) {
                    datosSala += rs.getInt(1) + "$" + rs.getString(2) + "#";
                }

                if (datosSala.length() > 0) {
                    out.print(datosSala);
                } else {
                    out.print("none");
                }
                break;
            }
            case 2: {
                idSala = Integer.parseInt(request.getParameter("idSala"));
                query = con.prepareStatement("select nombre from sala where idSala = ?");
                query.setInt(1, idSala);
                rs = query.executeQuery();

                while (rs.next()) {
                    datosSala = rs.getString(1) + "$";
                }

                query = con.prepareStatement("select c.nombre from cine as C inner join sala as S on C.idCine = S.idCine and S.idSala = ?");
                query.setInt(1, idSala);
                rs = query.executeQuery();

                while (rs.next()) {
                    datosSala += rs.getString(1);
                }

                if (datosSala.length() > 0) {
                    out.print(datosSala);
                } else {
                    out.print("none");
                }
                break;
            }
            case 3: {
                idSala = Integer.parseInt(request.getParameter("idSala"));
                nuevoNombre = request.getParameter("nuevoNombre");
                idNuevoCine = Integer.parseInt(request.getParameter("idNuevoCine"));
                query = con.prepareStatement("update sala set idCine = ?,nombre = ? where idSala = ?");
                query.setInt(1, idNuevoCine);
                query.setString(2, nuevoNombre);
                query.setInt(3, idSala);

                int row = query.executeUpdate();

                if (row > 0) {
                    out.print("true");
                } else {
                    out.print("false");
                }

                break;
            }
            case 4: {
                idSala = Integer.parseInt(request.getParameter("idSala"));
                nuevoNombre = request.getParameter("nuevoNombre");
                query = con.prepareStatement("update sala set nombre = ? where idSala = ?");
                query.setString(1, nuevoNombre);
                query.setInt(2, idSala);

                int row = query.executeUpdate();

                if (row > 0) {
                    out.print("true");
                } else {
                    out.print("false");
                }

                break;
            }

        }

        query.close();
        con.close();

    } catch (Exception e) {
        out.print("false");
    }
%>
