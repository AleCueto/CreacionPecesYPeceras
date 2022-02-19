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



        <div class="container text-center text-white">
            <div class="row pt-5">
                <div class="col-lg-8 mx-auto">
                    <h1 class="display-4">Bootstrap table fixed header</h1>
                    <p class="lead mb-0">Build a bootstrap table with a fixed header and scrollable body using Bootstrap 4.</p>
                    <p class="lead">Snippet by <a href="https://bootstrapious.com/snippets" class="text-white">
                            <u>Bootstrapious</u></a></p>
                </div>
            </div>
        </div><!-- End -->


        <div class="container py-5">
            <div class="row">
                <div class="col-lg-7 mx-auto bg-white rounded shadow">

                    <!-- Fixed header table-->
                    <div class="table-responsive">
                        <table class="table table-fixed  table-hover">
                            <thead>
                                <tr>
                                    <th scope="col" class="col-3">Nombre Pez</th>
                                    <th scope="col"class="col-2">Código Tipo</th>
                                    <th scope="col"class="col-2">Código Pecera</th>
                                    <th scope="col"class="col-5">Imagen Pez</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                        while (misPeces.next()) {
                                        out.println("<tr>");
                                        out.println("<td class=\"col-3 rowWithImage\">" + misPeces.getString("nomPez") + "</td>");
                                        out.println("<td class=\"col-2 rowWithImage\">" + misPeces.getString("codTipo") + "</td>" + "<td class=\"col-2 rowWithImage \">" + misPeces.getString("codPecera") + "</td> <td class=\"col-5\"> <img class=\"img-fluid imagesTable\" src=\"" + misPeces.getString("imgPez") + "\"imagenalt=\"alt=\"/>");
                                        out.println("</tr>");
                                        peceraNum = (String) session.getAttribute("NumPecera"); // ESTO LO DEBERÍA HACER SIEMPRE PERO SI NO TIENE NINGÚN PEZ NO LO HACE

                                    }


                                %>
                            </tbody>
                        </table>
                    </div><!-- End -->

                </div>
            </div>
        </div>





        <!-- Javascript Bootstrap V5 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
