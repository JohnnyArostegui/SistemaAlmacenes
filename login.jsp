<%-- 
    Document   : login
    Created on : 26 set. 2021, 17:23:14
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
        <title>Login</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form>
                        <form method="post" action="login.jsp" >
                            <div class="form-group">
                                <input type="text" class="form-control" name="user" placeholder="Usuario">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" name="password" placeholder="Contraseña">
                            </div>
                            <button type="submit" class="btn btn-primary" name="login" >Login</button>
                        </form>
                        <%
                            Connection con = null;
                            Statement st = null;
                            ResultSet rs = null;
                            ResultSet rs1 = null;
                            if (request.getParameter("login") != null) {
                                String user = request.getParameter("user");
                                String password = request.getParameter("password");
                                HttpSession sesion = request.getSession();
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost/sistemadealmacenes?user=root&password=123456");
                                    st = con.createStatement();
                                    rs = st.executeQuery(" SELECT * FROM `usuarios` where uCodUsuario='" + user + "' and uClave='" + password + "'; ");
                                    rs1 = st.executeQuery(" SELECT * FROM `usuarios` where uCodUsuario='" + user + "' and uClave='" + password + "' and uAdmin=1; ");

                                    if (rs1.getRow() == 0) {

                                        while (rs.next()) {
                                            sesion.setAttribute("logueado", "1");
                                            sesion.setAttribute("user", rs.getString("uCodUsuario"));
                                            sesion.setAttribute("id", rs.getString("uClave"));
                                            response.sendRedirect("ConsultaArt.jsp");
                                        }

                                    } else {
                                        
                                        while (rs.next()) {
                                            sesion.setAttribute("logueado", "1");
                                            sesion.setAttribute("user", rs.getString("uCodUsuario"));
                                            sesion.setAttribute("id", rs.getString("uClave"));
                                            response.sendRedirect("index.jsp");
                                        }

                                    }

                                    out.print(" <div class=\"alert alert-danger\" role=\"alert\"> Usuario no valido </div>");
                                } catch (Exception e) {
                                }
                            } else {
                                //  out.print("El usuario y/o contraseña ingresado fue incorrecto!");
                            }
                        %>
                </div>
            </div>
        </div>
    </body>
</html>
