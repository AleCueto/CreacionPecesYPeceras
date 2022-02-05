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
        <title>CRUD Peces y Peceras - Inicio</title>
    </head>
    <body>
        <div id="wrapper" class="container">
            <h1 class="p-5">Peces y peceras!</h1>

            <!-- INICIO FORMULARIO -->
            <form method="" action="pecera.jsp">
                <div class="mb-3">
                    <label for="exampleInputName" class="form-label">Nombre</label>
                    <input type="name" class="form-control" id="exampleInputEmail1" aria-describedby="nameHelp" name="CadenaNombre">
                    <div id="emailHelp" class="form-text">¡Introduce tu nombre y contraseña!</div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" name="CadenaContrasena">
                </div>
                <button type="submit" class="btn btn-primary">Entra</button>
                <button type="submit" class="btn btn-primary">Admin</button>
            </form>
            <!-- FIN FORMULARIO -->



        </div>

        <!-- Javascript Bootstrap V5 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
