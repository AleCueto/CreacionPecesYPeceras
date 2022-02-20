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
        <link href="css/registro.css" rel="stylesheet" type="text/css"/>
        <title>CRUD-Peces y Peceras</title>
    </head>
    <body>



        <%request.setCharacterEncoding("UTF-8");%>

        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pecesypeceras?useSSL=false&allowPublicKeyRetrieval=true", "root", "");
            Statement s = conexion.createStatement();
            Statement u = conexion.createStatement();

            String numPecera = (String) session.getAttribute("NumPecera");

            ResultSet miPecera = s.executeQuery("SELECT * FROM pecera WHERE codPecera = " + numPecera);
            ResultSet misPeces = u.executeQuery("SELECT * FROM pez WHERE codPecera = " + numPecera);

            String peceraNum = "";


        %>





    </form><!--fin de formulario de bootstrap-->
</div>

<div class="inputs">

    <div class="segment">
        <h1 class="pt-5 col-12 m-auto">Registro usuarios</h1>
    </div>

    <form action="creacionUsuarios.jsp">



        <label> NOMBRE
            <input type="text" placeholder="Nombre de usuario" required aria-describedby="NameHelp"  name="CadenaNueNombre" required />
        </label>
        <label> CONTRASEÑA
            <input type="password" placeholder="No compartas tu contraseña" id="Password"  name="CadenaNueContrasena" required/>
        </label>
        <label>NOMBRE PEZ
            <input type="text" placeholder="Escribe el nombre de tu primer pez" required aria-describedby="NameHelp"  name="NomNuePez" required />
        </label>
        <label for="disabledSelect" class="form-label">TIPO PEZ
            <select id="disabledSelect" class="form-select" name="NueTipoPez">
                <option>Mero</option>
                <option>Atun</option><!-- comment -->
                <option>Trucha</option><!-- comment -->
            </select>
        </label>
        <label for="disabledSelect" class="form-label">TIPO AGUA (DULCE O SALADA)
            <select id="disabledSelect" class="form-select" name="NueTipoAgua">
                <option>S</option>
                <option>D</option>
            </select>
        </label>
        <button class="red" type="submit"><i class="icon ion-md-lock"></i> Registrarse</button>

        <div class="segment">


        </div>


    </form>



    <!-- Javascript Bootstrap V5 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
