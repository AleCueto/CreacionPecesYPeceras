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
        <!--<link rel="stylesheet" href="./style.css"> !-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>

        <!-- INICIO PECERA -->

        <div id="pecera">  
            <div id="burbuja">
                <div class="burbuja1"></div>
                <div class="burbuja2"></div>
                <div class="burbuja3"></div>
                <div class="burbuja4"></div>
                <div class="burbuja5"></div>
                <div class="burbuja6"></div>
                <div class="burbuja7"></div>
                <div class="burbuja8"></div>
                <div class="burbuja9"></div>
                <div class="burbuja10"></div>
                <div class="burbuja11"></div>
                <div class="burbuja12"></div>
                <div class="burbuja13"></div>
                <div class="burbuja14"></div>
                <div class="burbuja15"></div>        
            </div>

            <div class="colores"></div>
            <div class="azules"></div>

        </div>

        <div id="container">

        </div>


        <!-- INICIO PECERA -->



        <%request.setCharacterEncoding("UTF-8");%>

        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pecesypeceras?useSSL=false&allowPublicKeyRetrieval=true", "root", "");
            Statement s = conexion.createStatement();
            Statement u = conexion.createStatement();

            ResultSet listado = s.executeQuery("SELECT * FROM usuario");

            String peceraNum = "";

        %>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Nombre Pez</th>
                    <th scope="col">Código Tipo</th>
                    <th scope="col">Código Pecera</th>
                    <th scope="col">Imagen Pez</th>
                </tr>
            </thead>
            <tbody>

                <%                    while (listado.next()) {

                        if (request.getParameter("CadenaNombre").toString().equals(listado.getString("nomUsuario")) && request.getParameter("CadenaContrasena").toString().equals(listado.getString("contrasena"))) {
                            String name = request.getParameter("CadenaNombre");
                            ResultSet miPecera = u.executeQuery("SELECT * FROM pez p JOIN usuario u WHERE u.codPecera = p.codPecera AND u.nomUsuario = '" + name + "'");

                            while (miPecera.next()) {
                                out.println("<tr>");
                                out.println("<td>" + miPecera.getString("nomPez") + "</td>" + "<td>" + miPecera.getString("codTipo") + "</td>" + "<td>" + miPecera.getString("codPecera") + "</td> <td> <img class=\"img-fluid\" src=\"" + miPecera.getString("imgPez") + "\"imagenalt=\"alt=\"/>" );
                                out.println("</tr>");
                                peceraNum = miPecera.getString("codPecera");
                            }

                        }
                    }
                %>

            <br><br><br>
            <form action="creacionPeces.jsp">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Nombre Pez</label>
                    <input type="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="NomPez">
                </div><!-- comment -->


                <div class="mb-3">
                    <label for="disabledSelect" class="form-label">Disabled select menu</label>
                    <select id="disabledSelect" class="form-select" name="TipoPez">
                        <option>Tipo Pez</option>
                        <option>Mero</option>
                        <option>Atun</option><!-- comment -->
                        <option>Trucha</option><!-- comment -->
                    </select>
                </div>

                <div class="mb-3">
                    <label for="disabledSelect" class="form-label visually-hidden"></label>
                    <select id="disabledSelect" class="form-select visually-hidden" name="NumPecera">
                        <option><% out.print(peceraNum);%></option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
                <br><br><br>
            </form>


            <!-- Javascript Bootstrap V5 -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
