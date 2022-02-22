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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="css/peceraStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <title>CRUD-Peces y Peceras</title>
        <link rel="icon" type="image/x-icon" href="./images/logo.png">
    </head>
    <body>


        <%request.setCharacterEncoding("UTF-8");%>

        <%

            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pecesypeceras?useSSL=false&allowPublicKeyRetrieval=true", "root", "");
            Statement s = conexion.createStatement();

            String identificador = (String) session.getAttribute("CodPezSesion");

            Statement w = conexion.createStatement();

            boolean repetido = false;

            ResultSet peces = w.executeQuery("SELECT * FROM pez"); //Miramos si existe un pez con el mismo nombre

            while (peces.next()) { //miramos los peces que hay y comprobamos que no existe ninguno con el mismo nombre, si se repite, pasamos un error con nombre pez a pecera
                if (request.getParameter("NomPez").toString().equals(peces.getString("nomPez"))) {
                    repetido = true;
                }
            }

            if (repetido) { //pasamos error con nombre pez a pecera
                session.setAttribute("error", "pez");
                response.sendRedirect("pecera.jsp");
            } else {// si el nombre es nuevo, hacemos un update y le cambiamos el nombre al pez

                String editado = "UPDATE pez SET nomPez = '" + request.getParameter("NomPez") + "' WHERE codPez = " + identificador;
                s.execute(editado);
                out.print(editado);
                response.sendRedirect("pecera.jsp");

            }


        %>


        <!-- Javascript Bootstrap V5 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
