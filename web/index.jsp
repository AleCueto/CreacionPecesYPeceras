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
        <title>CRUD Peces y Peceras - Inicio</title>
    </head>

    <body class="bg-blue">



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
        </div>




    </body>

</div>

<!-- Javascript Bootstrap V5 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
