<%-- 
    Document   : controladora_boletos
    Created on : Dec 9, 2012, 12:21:53 PM
    Author     : Gabriel
--%>

<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="org.jdom.output.XMLOutputter"%>
<%@page import="org.jdom.output.Format"%>
<%@page import="org.jdom.Element"%>
<%@page import="org.jdom.Document"%>
<%@page import="org.jdom.input.SAXBuilder"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Tanda"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="Clases.DBA"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%

    String conf = request.getParameter("conf");
    String cant = request.getParameter("cant");
    String tarjeta = request.getParameter("tar");

    String sillas[] = conf.split(";");
    int fila[] = new int[sillas.length];
    int col[] = new int[sillas.length];

    String cantidades[] = cant.split(",");
    int cantTotal = 0;

    for (int i = 0; i < cantidades.length; i++) {
        cantTotal += Integer.parseInt(cantidades[i]);
    }

    //SEGURIDAD
    if (cantTotal == sillas.length) {
        for (int i = 0; i < sillas.length; i++) {
            fila[i] = Integer.parseInt(sillas[i].split(",")[0]);
            col[i] = Integer.parseInt(sillas[i].split(",")[1]);
        }

        DBA dba = new DBA();

        final int idTanda = Integer.parseInt(request.getParameter("idTanda"));
        final String select = "select configuracionSillas, idPelicula from tanda where idTanda = ?";
        final String precios = "select * from Precio";
        int idPelicula = 0;

        Connection con = dba.getConnection();


        PreparedStatement query = con.prepareStatement(precios);
        ResultSet rs = query.executeQuery();

        ArrayList<String> tipos = new ArrayList<String>();
        ArrayList<Float> costos = new ArrayList<Float>();

        ArrayList<String> idPrecios = new ArrayList<String>();
        ArrayList<Integer> idCantidades = new ArrayList<Integer>();

        while (rs.next()) {
            tipos.add(rs.getString(1));
            costos.add(rs.getFloat(2));
        }

        float total = 0;
        for (int i = 0; i < cantidades.length; i++) {
            total += Integer.parseInt(cantidades[i]) * costos.get(i).floatValue();
            if (Integer.parseInt(cantidades[i]) != 0 && idPrecios.contains(tipos.get(i)) == false) 
            {
                idPrecios.add(tipos.get(i));
                idCantidades.add(Integer.parseInt(cantidades[i]));
            }
        }


        Boolean permiso = false;

        //WEBSERVICE
        try {
            tarjetas.WsTarjetas_Service service = new tarjetas.WsTarjetas_Service();
            tarjetas.WsTarjetas port = service.getWsTarjetasPort();
            // TODO initialize WS operation arguments here
            java.lang.String cuenta = tarjeta;
            float costo = total;
            // TODO process result here
            permiso = port.verificarSaldo(cuenta, costo);


        } catch (Exception ex) {
            //out.println(ex.toString());
        }

        //out.println("PERMISO " + permiso);

        if (permiso == true) {
            query = con.prepareStatement(select);
            query.setInt(1, idTanda);


            rs = query.executeQuery();
            rs.next();



            List filas = null;

            try {
                SAXBuilder builder = new SAXBuilder();
                Document bd_xml = builder.build(rs.getAsciiStream(1));
                Element raiz = bd_xml.getRootElement();
                filas = raiz.getChildren("fila");


                int z = 0;
                for (int i = 0; i < filas.size(); i++) {
                    List sillasTmp = ((Element) filas.get(i)).getChildren("silla");
                    for (int j = 0; j < sillasTmp.size(); j++) {
                        if (fila[z] == i && col[z] == j) {
                            ((Element) sillasTmp.get(j)).setAttribute("disponible", "false");
                            bd_xml.setContent(raiz);
                            z++;
                            if (z >= cantTotal) {
                                i = filas.size();
                                break;
                            }
                        }
                    }
                }

                XMLOutputter outputter = new XMLOutputter(Format.getRawFormat());
                String xmlString = outputter.outputString(bd_xml);

                query = con.prepareStatement("update tanda set configuracionSillas = ? where idTanda = ?");
                query.setString(1, xmlString);
                query.setInt(2, idTanda);
                query.executeUpdate();

                idPelicula = rs.getInt(2);


                //TICKETS
                for (int i = 0; i < idPrecios.size(); i++) 
                {
                    for (int j = 0; j < idCantidades.get(i); j++) 
                    {
                        query = con.prepareStatement("insert into ticket values(default, ?, ?, ?) ");
                        query.setInt(1, idPelicula);
                        query.setInt(2, idTanda);
                        query.setString(3, idPrecios.get(i));
                        query.executeUpdate();
                    }

                }

            } catch (Exception e) {
                out.print(e.toString());
            }
        }

        query.close();
        dba.close();

    }


%>        
<%@page contentType="text/html" pageEncoding="UTF-8"%>


