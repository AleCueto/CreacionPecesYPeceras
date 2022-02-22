<%-- 
    Document   : index
    Created on : 5 feb 2022, 16:08:38
    Author     : Alejandro Cueto Jimenez
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
        <link rel="icon" type="image/x-icon" href="./images/logo.png">
        <title>CRUD Peces y Peceras - Inicio</title>
    </head>

    <body class="bg-blue">


        <%
            session.setAttribute("NumPecera", null); //establezco el valor de NumPecera a nulo para cerrar sesión e impedir el acceso a otras páginas sin login
            
            
            if (session.getAttribute("error") != null) { //compruebo si hay algún error

                if (session.getAttribute("error").equals("Lo siento, usuario o contraseña incorrectos")) { //compruebo el tipo de error
                    session.setAttribute("error", "null");
                    out.print("<script type=\"text/javascript\">alert(\"Lo siento, acceso denegado, usuario o contraseña incorrectos\");</script>"); //saco por pantalla el error en cuestion
                }
            }

        %>


        <div class="container">
            <div class="brand-logo"></div>
            <div class="brand-title">Peces Y Peceras</div>
            <form method="" action="login.jsp"> <!-- formulario de bootstrap -->
                <div class="inputs">
                    <label>NOMBRE</label>
                    <input type="text" placeholder="Escribe tu nombre" required aria-describedby="NameHelp"  name="CadenaNombre" required />
                    <label>CONTRASEÑA</label>
                    <input type="password" placeholder="No compartas tu contraseña"  id="Password"  name="CadenaContrasena" required />
                    <button type="submit">LOGIN</button>
                </div>
            </form><!--fin de formulario de bootstrap-->
            <a href="formUsuario.jsp">CREAR USUARIO</a>
        </div>





    </body>

</div>

<!-- Javascript Bootstrap V5 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
