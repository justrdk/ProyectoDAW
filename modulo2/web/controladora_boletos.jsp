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
        final String select = "select configuracionSillas from tanda where idTanda = ?";
        final String precios = "select * from Precio";

        Connection con = dba.getConnection();
        PreparedStatement query = con.prepareStatement(select);
        query.setInt(1, idTanda);


        ResultSet rs = query.executeQuery();
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

        } catch (Exception e) {
            out.print(e.toString());
        }

        /*query = con.prepareStatement(precios);
         rs = query.executeQuery();

         ArrayList<String> tipos = new ArrayList<String>();
         ArrayList<Float> costos = new ArrayList<Float>();

         while (rs.next()) {
         tipos.add(rs.getString(1));
         costos.add(rs.getFloat(2));
         }*/

        query.close();
        dba.close();

        try {
            tarjetas.WsTarjetas_Service service = new tarjetas.WsTarjetas_Service();
            tarjetas.WsTarjetas port = service.getWsTarjetasPort();
            // TODO initialize WS operation arguments here
            java.lang.String cuenta = "1032034034";
            // TODO process result here
            java.lang.Integer result = port.verificarSaldo(cuenta);
            out.println("Result = " + result);
        } catch (Exception ex) {
            // TODO handle custom exceptions here
        }


    }


%>        
<%@page contentType="text/html" pageEncoding="UTF-8"%>



