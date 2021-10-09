<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/sistemadealmacenes?user=root&password=123456");
                st = con.createStatement();
                st.executeUpdate("delete FROM articulo where idarticulo='"+request.getParameter("idarticulo") +"';");
                request.getRequestDispatcher("articulos.jsp").forward(request, response);
            } catch (Exception e) {
                out.print(e);
            }
        %>

    </body>
</html>
