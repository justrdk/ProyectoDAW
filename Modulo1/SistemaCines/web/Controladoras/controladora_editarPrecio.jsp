<%@page import="java.sql.*"%>
<%
    try {


        Connection con = null;
        String dbuser = "root";
        String dbpw = "admin";
        String url = "jdbc:mysql://localhost:3306/cines";
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url, dbuser, dbpw);

        int accion = Integer.parseInt(request.getParameter("accion"));
        String nuevoNombre = "";
        double precioNuevo = 0;
        String datosPrecio = "";
        String idPrecio = "";

        PreparedStatement query = null;
        ResultSet rs = null;

        if (accion == 1) {
            query = con.prepareStatement("select idPrecio,precio from precio");
            rs = query.executeQuery();

            while (rs.next()) {
                datosPrecio += rs.getString(1) + "$" + rs.getDouble(2) + "#";
            }

            if (datosPrecio.length() > 0) {
                out.print(datosPrecio);
            } else {
                out.print("none");
            }
        } else if (accion == 2) {
            nuevoNombre = request.getParameter("idNuevo");
            idPrecio = request.getParameter("idPrecio");
            precioNuevo = Double.parseDouble(request.getParameter("precioNuevo"));

            query = con.prepareStatement("update precio set idPrecio = ?,precio=? where idPrecio =?");
            query.setString(1,nuevoNombre);
            query.setDouble(2,precioNuevo);
            query.setString(3,idPrecio);
            int row = query.executeUpdate();

            if (row > 0) {

                out.print("true");
            } else {
                out.print("false");
            }
        }



        query.close();
        con.close();

    } catch (Exception e) {
        out.println(e.toString());
    }
%>
