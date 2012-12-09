<%-- 
    Document   : index
    Created on : Dec 8, 2012, 1:30:59 PM
    Author     : Gabriel
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Clases.DBA"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.jdom.Document"%>
<%@page import="org.jdom.Element"%>
<%@page import="org.jdom.input.SAXBuilder"%>
<%    
    
    
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
        
    } catch (Exception e) {
        out.print(e.toString());
    }
    
    query = con.prepareStatement(precios);
    rs = query.executeQuery();
    
    ArrayList<String> tipos = new ArrayList<String>();
    ArrayList<Float> costos = new ArrayList<Float>();
    
    while(rs.next())
    {
        tipos.add(rs.getString(1));
        costos.add(rs.getFloat(2));
    }
    
    query.close();
    dba.close();
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html lang="en-US" xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
    <head>
        <title>Boletos</title>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/redmond/jquery-ui-1.9.1.custom.min.css" type="text/css" media="all" />
        <!--[if IE 6]>
                <link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" />
        <![endif]-->
        <script type="text/javascript" src="js/jquery-1.8.2.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.9.1.custom.min.js"></script>
        <script type="text/javascript" src="js/boletos.js"></script>

    </head>
    <body>
        <!-- Shell -->
        <div id="shell">
            <!-- Header -->
            <div id="header">
                <h1 id="logo"><a href="#">Cartelera</a></h1>


                <!-- Navigation -->
                <div id="navigation">
                    <ul>
                        <li><a class="active" href="#">HOME</a></li>
                        <li><a href="#">NEWS</a></li>
                        <li><a href="#">IN THEATERS</a></li>
                        <li><a href="#">COMING SOON</a></li>
                        <li><a href="#">CONTACT</a></li>
                        <li><a href="#">ADVERTISE</a></li>
                    </ul>
                </div>
                <!-- end Navigation -->


                <!-- Sub-menu -->
                <div id="sub-navigation">

                </div>
                <!-- end Sub-Menu -->


            </div>
            <!-- end Header -->

            <!-- Main -->
            <div id="main">
                <!-- Content -->
                <div id="content">

                    <div class="box">
                        <div class="head">
                            <h2>Compra de Boletos</h2>                            
                        </div>

                        <!-- Movie -->
                        <div class="movie">
                            <table id="cantidades">
                                <thead>
                                    <tr>
                                        <th>Tipo</th><th>Cantidad</th><th>Costo</th><th>Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (int i = 0; i < tipos.size(); i++) 
                                        {
                                        %>
                                    <tr>
                                        <td><%=tipos.get(i)%></td> <td><input type="text" /></td><td>L. <%=costos.get(i)%></td><td>L. 0.00</td>
                                    </tr>
                                        <% }
                                    %>
                                </tbody>
                            </table>


                            <br /> <br />

                            <table id="sillas">                                
                                
                                    
                                        <%
                                        for (int i = 0; i < filas.size(); i++) 
                                        {
                                        %>
                                        <tr>
                                            <%
                                                Element fila = ((Element) filas.get(i));
                                                List sillas = fila.getChildren("silla");
                                                for(int j = 0; j < sillas.size(); j++)
                                                {
                                                    Element silla = ((Element) sillas.get(j));
                                                    if(silla.getAttribute("disponible").getBooleanValue() == true)
                                                    {
                                                        %>
                                                        <td class="free"><img src="css/images/vacio.gif"></td>
                                                        <%
                                                    }
                                                    else
                                                    {
                                                        %>
                                                        <td class="ocupado"><img src="css/images/ocupado.gif"></td>
                                                        <%
                                                    }
                                                }
                                                
                                            %>
                                        </tr>
                                            
                                        
                                        <%
                                        }
                                        %>
                                        
                                    </tr>
                               
                            </table>

                        </div>
                    </div>
                </div>
                <!-- end Content -->


                <div class="cl">&nbsp;</div>
            </div>
            <!-- end Main -->

            <!-- Footer -->
            <div id="footer">
                <p>
                    <a href="#">HOME</a> <span>|</span>
                    <a href="#">NEWS</a> <span>|</span>
                    <a href="#">IN THEATERS</a> <span>|</span>
                    <a href="#">COMING SOON </a> <span>|</span>
                    <a href="#">LATERS TRAILERS</a> <span>|</span>
                    <a href="#">TOP RATED TRAILERS</a> <span>|</span>
                    <a href="#">MOST COMMENTED TRAILERS</a> <span>|</span>
                    <a href="#">ADVERTISE</a> <span>|</span>
                    <a href="#">CONTACT </a>
                </p>
                <p> &copy; 2009 Movie Hunter, LLC. All Rights Reserved.  Designed by <a href="http://chocotemplates.com" target="_blank" title="The Sweetest CSS Templates WorldWide">ChocoTemplates.com</a></p>
            </div>
            <!-- end Footer -->
        </div>
        <!-- end Shell -->
    </body>
</html>