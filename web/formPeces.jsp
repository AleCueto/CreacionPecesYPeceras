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
            }//Aquí comprobamos que numPecera existe, si no es así te manda de nuevo al inicio del programa

            String numPecera = (String) session.getAttribute("NumPecera");

            ResultSet miPecera = s.executeQuery("SELECT * FROM pecera WHERE codPecera = " + numPecera);
            ResultSet misPeces = u.executeQuery("SELECT * FROM pez WHERE codPecera = " + numPecera);

            String peceraNum = "";


        %>




        <div class="container">
            <div class="brand-logo"></div>
            <div class="brand-title">Añadir pez...</div>
            <form method="" action="creacionPeces.jsp"> <!-- formulario de bootstrap -->
                <div class="inputs">
                    <label>NOMBRE</label>
                    <input type="text" placeholder="Escribe el nombre del pez" required aria-describedby="NameHelp"  name="NomPez" required />
                    <label for="disabledSelect" class="form-label">TIPO PEZ</label>
                    <select id="disabledSelect" class="form-select" name="TipoPez">
                        <option>Mero</option>
                        <option>Atun</option><!-- comment -->
                        <option>Trucha</option><!-- comment -->
                        <option>Lubina</option><!-- comment -->
                        <option>Siluro</option><!-- comment -->
                        <option>Payaso</option><!-- comment -->
                        <option>Mariposa Narizona</option><!-- comment -->
                        <option>Cirujano Azul</option><!-- comment -->
                    </select>
                    <button type="submit">CREAR</button>
                </div>
            </form><!--fin de formulario de bootstrap-->
        </div>






        <!-- Javascript Bootstrap V5 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
