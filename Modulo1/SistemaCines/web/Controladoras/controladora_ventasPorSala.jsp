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
        int cantidadTickets = 0;

        if (accion == 1) {

            int idSala = Integer.parseInt(request.getParameter("idSala"));
            query = con.prepareStatement("select count(*) from ticket where idTanda = ANY (select idTanda from (sala as S inner join tanda as T on S.idSala = T.idSala)"
            + " where S.idSala = ?)");
            query.setInt(1, idSala);

            ResultSet rs = query.executeQuery();
            
            while(rs.next()){
                cantidadTickets = rs.getInt(1);
            }
            
            out.print(cantidadTickets);

        }
        query.close();
        con.close();

    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>
