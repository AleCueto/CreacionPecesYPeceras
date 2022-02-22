<%-- 
    Document   : creacionPeces
    Created on : 6 feb 2022, 10:40:49
    Author     : Estudios
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRUD-Peces y Peceras</title>
    </head>
    <body>

        <%request.setCharacterEncoding("UTF-8");%>

        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pecesypeceras?useSSL=false&allowPublicKeyRetrieval=true", "root", "");
            Statement s = conexion.createStatement();

            Statement w = conexion.createStatement();

            boolean repetido = false;

            ResultSet peces = w.executeQuery("SELECT * FROM pez"); //Miramos si existe un pez con el mismo nombre

            while (peces.next()) {
                if (request.getParameter("NomPez").toString().equals(peces.getString("nomPez"))) {
                    repetido = true;
                }
            }

            if (repetido) {
                session.setAttribute("error", "pez");
                response.sendRedirect("pecera.jsp");
            } else {

                ResultSet listado = s.executeQuery("SELECT * FROM tipopez WHERE nomTipo = '" + request.getParameter("TipoPez") + "'");
                listado.next();

                out.println(request.getParameter("NomPez"));
                out.println(request.getParameter("TipoPez"));

                String[] imagenesPeces = {"null", "mero.png", "atun.png", "trucha.png", "lubina.png", "siluro.png", "pezPayaso.png", "mariposaNarizona.png", "cirujanoAzul.png"}; //El pez llamará a la imagen que tenga como índice su numero de tipo de pez
                String imagen = "./images/" + imagenesPeces[listado.getInt("codTipo")]; //Pasamos la imagen a cadena de texto

                String insercion = "INSERT INTO pez(nomPez, imgPez, codTipo, codPecera) VALUES('" + request.getParameter("NomPez")
                        + "', '" + imagen + "', " + listado.getInt("codTipo")
                        + ", " + (String) session.getAttribute("NumPecera") + ")";

                s.execute(insercion);
                out.print(insercion);
                response.sendRedirect("pecera.jsp");
            }

        %>




    </body>
</html>
