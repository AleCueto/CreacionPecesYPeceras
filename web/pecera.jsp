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
    </head>
    <body>



        <%request.setCharacterEncoding("UTF-8");%>

        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pecesypeceras?useSSL=false&allowPublicKeyRetrieval=true", "root", "");
            Statement s = conexion.createStatement();
            Statement u = conexion.createStatement();

            String buscar = "";

            if (request.getParameter("nombreBusqueda") != null) {
                buscar += " AND nomPez LIKE '%" + request.getParameter("nombreBusqueda").toString() + "%'";

            }

            String numPecera = (String) session.getAttribute("NumPecera");

            ResultSet miPecera = s.executeQuery("SELECT * FROM pecera WHERE codPecera = " + numPecera);
            ResultSet misPeces = u.executeQuery("SELECT * FROM pez WHERE codPecera = " + numPecera + buscar);

            String peceraNum = "";

            if (session.getAttribute("NumPecera") == null) {
                response.sendRedirect("index.jsp");
            }//MIRAR QUE NUMPECERA NO ES NULL; SI ES NULL TE MANDA AL PRINCIPIO

            if (session.getAttribute("error") != null) {
                if (session.getAttribute("error").equals("pez")) { //ESTO FALLA!!!
                    session.setAttribute("error", "null");
                    out.print("<script type=\"text/javascript\">alert(\"Lo siento, el nombre del pez ya existe\");</script>");
                }
            }


        %>


        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand p-3" href="#">Peces y peceras</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto p-1">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Pecera <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>

                </ul>
                <form class="form-inline my-2 my-lg-0" action="pecera.jsp">
                    <input  type="text" placeholder="Búsqueda" name="nombreBusqueda" aria-label="Search" >
                    <button class="btn" type="submit">Search</button>
                </form>
            </div>
        </nav>



        <div class="container text-center text-white">
            <div class="row pt-5">
                <div class="col-lg-8 mx-auto">
                    <h1 class="display-4">¡Bienvenido a tu pecera!</h1>
                    <p class="lead mb-0">Aquí podrás ver a tus queridos peces.</p>
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
                                    <th scope="col"class="col-4">Imagen Pez</th>
                                    <th scope="col"class="col-1">Editar </th>
                                    <th scope="col"class="col-1">Borrar</th>

                                </tr>
                            </thead>
                            <tbody>
                                <%                                    while (misPeces.next()) {%>

                                <tr>
                                    <td class="col-3 rowWithImage"> <%= misPeces.getString("nomPez")%></td>
                                    <td class="col-2 rowWithImage"> <%= misPeces.getString("codTipo")%></td> 
                                    <td class="col-5"> <img class="img-fluid imagesTable" src= "<%= misPeces.getString("imgPez")%>" alt=""></td>
                                    <td><a href="formEditarPeces.jsp?id=<%=misPeces.getString("codPez")%>" class="col-1 bi bi-pencil-square rowWithImage"></a></td> 
                                    <td><a href="delete.jsp?id=<%=misPeces.getString("codPez")%>" class="col-1 bi bi-trash3-fill rowWithImage" onclick="confirm('Estás seguro de querer borrar el registro?')"></a></td>
                                </tr>


                                <%
                                        peceraNum = (String) session.getAttribute("NumPecera"); // ESTO LO DEBERÍA HACER SIEMPRE PERO SI NO TIENE NINGÚN PEZ NO LO HACE

                                    }
                                %>
                            </tbody>
                            <a class="button" href='formPeces.jsp'>Añade un nuevo pez</a>   
                        </table>


                    </div><!-- End -->
                </div>

            </div>

        </div>

        <!-- Javascript Bootstrap V5 -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
