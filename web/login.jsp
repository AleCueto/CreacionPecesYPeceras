<%-- 
    Document   : pecera
    Created on : 5 feb 2022, 17:11:04
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
        <link rel="stylesheet" href="./styles/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>CRUD-Peces y Peceras</title>
    </head>
    <body>


        <%request.setCharacterEncoding("UTF-8");%>

        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pecesypeceras?useSSL=false&allowPublicKeyRetrieval=true", "root", "");
            Statement s = conexion.createStatement();
            Statement u = conexion.createStatement();

            ResultSet listado = s.executeQuery("SELECT * FROM usuario");

            boolean correcto = false;

            while (listado.next()) {
                if (request.getParameter("CadenaNombre").toString().equals(listado.getString("nomUsuario")) && request.getParameter("CadenaContrasena").toString().equals(listado.getString("contrasena"))) {
                    //Compruebo que existe un usuario y una contraseña igual a las enviadas desde el formulario en index
                    correcto = true;
                    String name = request.getParameter("CadenaNombre");
                    ResultSet miPecera = u.executeQuery("SELECT * FROM pez p JOIN usuario u WHERE u.codPecera = p.codPecera AND u.nomUsuario = '" + name + "'");
                    miPecera.next();
                    session.setAttribute("NumPecera", miPecera.getString("codPecera"));
                    response.sendRedirect("pecera.jsp");
                }
            }

            if (!correcto) { // si la contraseña o el usuario son incorrectos, se establece un nuevo valor para la variable de sesion "error" y se abre de nuevo index
                session.setAttribute("error", "Lo siento, usuario o contraseña incorrectos");
                response.sendRedirect("index.jsp");
            }

        %>



        <!-- Javascript Bootstrap V5 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
