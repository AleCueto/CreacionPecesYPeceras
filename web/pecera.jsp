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
        <title>JSP Page</title>
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

                <%                    
                    while (misPeces.next()) {
                        out.println("<tr>");
                        out.println("<td>" + misPeces.getString("nomPez") + "</td>" + "<td>" + misPeces.getString("codTipo") + "</td>" + "<td>" + misPeces.getString("codPecera") + "</td> <td> <img class=\"img-fluid imagesTable\" src=\"" + misPeces.getString("imgPez") + "\"imagenalt=\"alt=\"/>");
                        out.println("</tr>");
                        peceraNum = misPeces.getString("codPecera"); // ESTO LO DEBERÍA HACER SIEMPRE PERO SI NO TIENE NINGÚN PEZ NO LO HACE
                    }


                %>

            </tbody>



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

                <button type="submit" class="btn btn-primary">Submit</button>
                <br><br><br>
            </form>


            <!-- Javascript Bootstrap V5 -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
