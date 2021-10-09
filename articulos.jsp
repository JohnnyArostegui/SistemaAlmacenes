
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="main.css">
        <title>Artículos</title>
    </head>
    <body>

        <header>
            <nav class="navegacion">
                <ul class="menu">
                    <li> <a href="principal.jsp" >Inicio</a></li>
                    <li> <a href="articulos.jsp" >Artículos</a></li>
                    <li> <a href="entidades.jsp" >Entidades</a>
                        <ul class="submenu">
                            <li><a href="clientes.jsp">Clientes</a></li>
                            <li><a href="proveedores.jsp">Proveedores</a></li>
                        </ul>
                    </li>    
                    <li> <a href="registro.jsp" >Registro de Guías</a></li>
                    <li> <a href="mant_registro.jsp" >Mantenimiento</a></li>
                    <li> <a href="cons_stock.jsp" >Stock</a></li>
                    <li> <a href="reportes.jsp" >Reportes</a></li>
                    <li> <a href="login.jsp" >Salir</a></li>
                </ul>
            </nav>
        </header>

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
                                <th scope="col" colspan="8" class="text-center"><h3>Artículos</h3></th>
                                <th scope="col" >
                                    <a href="crear_articulo.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i></a>
                                </th>

                            </tr>
                            <tr>
                                <th scope="col">Código</th>
                                <th scope="col">Artículo</th>
                                <th scope="col">U.Med</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Marca</th>
                                <th scope="col">Modelo</th>
                                <th scope="col">Presentación</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost/sistemadealmacenes?user=root&password=123456");
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT * FROM `ARTICULO`;");
                                    while (rs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString("idarticulo")%></th>
                                <td><%= rs.getString("descripcion")%></td>
                                <td><%= rs.getString("unimed")%></td>
                                <td><%= rs.getString("precio")%></td>
                                <td><%= rs.getString("marca")%></td>
                                <td><%= rs.getString("modelo")%></td>
                                <td><%= rs.getString("presentacion")%></td>
                                <td><%= rs.getString("estado")%></td>
                                <td>

                                    <a href="editar_articulo.jsp?idarticulo=<%= rs.getString(1)%>&nombre=<%= rs.getString(2)%>&unimed=<%= rs.getString(3)%>&marca=<%= rs.getString(4)%>&modelo=<%= rs.getString(5)%>&presentacion=<%= rs.getString(6)%>&precio=<%= rs.getString(7)%>&estado=<%= rs.getString(8)%>"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                    <a href="borrar_articulo.jsp?idarticulo=<%= rs.getString(1)%>" class="ml-3"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                </td>
                            </tr>                                    
                            <%
                                    }
                                } catch (Exception e) {
                                    out.print("error mysql " + e);
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

