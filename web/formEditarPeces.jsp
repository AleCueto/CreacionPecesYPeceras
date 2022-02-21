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
        <link href="css/loginstyle.css" rel="stylesheet" type="text/css"/>
        <title>CRUD-Peces y Peceras</title>
    </head>
    <body>



        <%request.setCharacterEncoding("UTF-8");%>

        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pecesypeceras?useSSL=false&allowPublicKeyRetrieval=true", "root", "");
            Statement s = conexion.createStatement();
            Statement u = conexion.createStatement();

            if (session.getAttribute("NumPecera") == null) {
                response.sendRedirect("index.jsp");
            }//MIRAR QUE NUMPECERA NO ES NULL; SI ES NULL TE MANDA AL PRINCIPIO

            String identificador = request.getParameter("id");
            session.setAttribute("CodPezSesion", identificador);
            String numPecera = (String) session.getAttribute("NumPecera");

            ResultSet miPecera = s.executeQuery("SELECT * FROM pecera WHERE codPecera = " + numPecera);
            ResultSet misPeces = u.executeQuery("SELECT * FROM pez WHERE codPecera = " + numPecera);

            String peceraNum = "";


        %>




        <div class="container">
            <div class="brand-logo"></div>
            <div class="brand-title">Editar pez...</div>
            <form method="" action="edit.jsp"> <!-- formulario de bootstrap -->
                <div class="inputs">
                    <label>NUEVO NOMBRE</label>
                    <input type="text" placeholder="Escribe el nuevo nombre del pez" required aria-describedby="NameHelp"  name="NomPez" required />
                    <button type="submit">EDITAR</button>
                </div>
            </form><!--fin de formulario de bootstrap-->
        </div>






        <!-- Javascript Bootstrap V5 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
