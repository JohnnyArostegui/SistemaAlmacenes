<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="CSS/estilo.css" rel="stylesheet" type="text/css">

    </head>
    <body>
        <div id="contenedor">
            <h1>Bienvenido</h1>
            <form method="post" action="login.jsp" id="form1">
                <input type="text"  name="user" placeholder="Usuario">
                <hr>
                <input type="password"  name="password" placeholder="Contraseña">
                <hr>
                <input type="submit"  name="login">
            </form>

        </div>
        <%
            Connection con = null;
            Statement st = null;
            Statement st1 = null;
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
                    st1 = con.createStatement();
                    rs = st.executeQuery(" SELECT * FROM `usuarios` where uCodUsuario='" + user + "' and uClave='" + password + "'; ");
                    rs1 = st1.executeQuery(" SELECT * FROM `usuarios` where uCodUsuario='" + user + "' and uClave='" + password + "' and uAdmin=1; ");

                    int total = 0;
                    while (rs1.next()) {
                        total++;
                    }
                    System.out.println("El total de registros es : " + total);

                    if (total == 0) {

                        while (rs.next()) {
                            sesion.setAttribute("logueado", "1");
                            sesion.setAttribute("user", rs.getString("uCodUsuario"));
                            sesion.setAttribute("id", rs.getString("uClave"));
                            response.sendRedirect("index.jsp");
                        }

                    } else {

                        while (rs.next()) {
                            sesion.setAttribute("logueado", "1");
                            sesion.setAttribute("user", rs.getString("uCodUsuario"));
                            sesion.setAttribute("id", rs.getString("uClave"));
                            response.sendRedirect("principal.jsp");
                        }

                    }

                    out.print(" <div class=\"alert alert-danger\" role=\"alert\"> Usuario no valido </div>");
                } catch (Exception e) {
                }
            } else {
                //  out.print("El usuario y/o contraseña ingresado fue incorrecto!");
            }
        %>

    </body>
</html>
