<%-- 
    Document   : ConsultaArt
    Created on : 28 set. 2021, 12:49:58
    Author     : johnny
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Consulta de Artículos</title>
    </head>
        <body>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Código</th>
                                <th scope="col">Artículo</th>
                                <th scope="col">U.Med</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Marca</th>
                                <th scope="col">Modelo</th>
                                <th scope="col">Presentación</th>
                                <th scope="col">Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost/sistemadealmacenes?user=root&password=123456");
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT * FROM `ARTICULOS`;");
                                    while (rs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString("artcodigo")%></th>
                                <td><%= rs.getString("artdescripcion")%></td>
                                <td><%= rs.getString("artunidmed")%></td>
                                <td><%= rs.getString("artprecio")%></td>
                                <td><%= rs.getString("artmarca")%></td>
                                <td><%= rs.getString("artmodelo")%></td>
                                <td><%= rs.getString("artpresentacion")%></td>
                                <td><%= rs.getString("artestado")%></td>
                            </tr>                                    
                            <%
                                    }
                                } 
                                catch (Exception e) {
                                    out.print("error mysql "+e);
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

