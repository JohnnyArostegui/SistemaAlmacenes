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
        <title>Editar Artículo</title>
    </head>
    <body>
        
        <%
            String idarticulo = request.getParameter("idarticulo");    
            String nombre = request.getParameter("nombre");
            String unimed = request.getParameter("unimed");
            String marca = request.getParameter("marca");
            String modelo = request.getParameter("modelo");
            String presentacion = request.getParameter("presentacion");
            String precio = request.getParameter("precio");
            String estado = request.getParameter("estado");
        %>
        
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
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="editar_articulo.jsp" method="get">
                        <table class="table table-striped">

                            <thead>
                            <tr>
                            <center><h3>Edición de Artículo</h3></center>
                            </tr>
                            </thead>
                            <tbody>

                            <tr>
                            <input type="text" class="form-control" id="nombre"  value="<%= nombre%>" name="nombre" placeholder="Artículo">
                            </tr>
                            <p>
                            <tr>
                            <input type="text" class="form-control" id="unimed"  value="<%= unimed%>" name="unimed" placeholder="Unidad de medida">
                            </tr>
                            <p>
                            <tr>
                            <input type="text" class="form-control" id="marca"  value="<%= marca%>" name="marca" placeholder="Marca">
                            </tr>
                            <p>
                            <tr>
                            <input type="text" class="form-control" id="modelo"  value="<%= modelo%>" name="modelo" placeholder="Modelo">
                            </tr>
                            <p>
                            <tr>
                            <input type="text" class="form-control" id="presentacion"  value="<%= presentacion%>" name="presentacion" placeholder="Presentación">
                            </tr>
                            <p>
                            <tr> 
                            <input type="text" class="form-control" id="precio"  value="<%= precio%>" name="precio" placeholder="Precio">
                            </tr>
                            <p>
                            <tr> 
                            <input type="text" class="form-control" id="estado"  value="<%= estado%>" name="estado" placeholder="estado">
                            </tr>
                            <p>
                            <tr>
                            
                            <center><button type="submit" name="enviar" class="btn btn-primary">Guardar<i class="fa fa-floppy-o" aria-hidden="true"></i></button><a href="articulos.jsp" class="btn btn-danger">Cancelar <i class="fa fa-ban" aria-hidden="true"></i></a></center>
                            <input type="hidden" name="idarticulo" value="<%= idarticulo%>" >
                            </tr>
                            

                            </tbody>
                        </table> 
                    </form>

                </div>
            </div>
        </div>
        
         <%
            if (request.getParameter("enviar") != null) {
                
                try {
                    Connection con=null;
                    Statement st=null;
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/sistemadealmacenes?user=root&password=123456");
                    st=con.createStatement();
                    st.executeUpdate("update articulo set descripcion='" + nombre + "',unimed='" + unimed + "',marca='" + marca + "',modelo='" + modelo + "',presentacion='" + presentacion + "',precio='" + precio + "',estado='" + estado + "' where idarticulo='"+idarticulo+"';");
                    request.getRequestDispatcher("articulos.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
        
    </body>
</html>
