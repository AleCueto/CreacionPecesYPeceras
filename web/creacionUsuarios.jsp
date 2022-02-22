<%-- 
    Document   : creacionPeces
    Created on : 6 feb 2022, 10:40:49
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
        <title>CRUD-Peces y Peceras</title>
    </head>
    <body>

        <%request.setCharacterEncoding("UTF-8");%>

        <%

            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pecesypeceras?useSSL=false&allowPublicKeyRetrieval=true", "root", "");
            Statement s = conexion.createStatement();
            Statement w = conexion.createStatement();

            boolean repetido = false;

            ResultSet peces = w.executeQuery("SELECT * FROM pez"); //Miramos si existe un pez con el mismo nombre

            while (peces.next()) {
                if (request.getParameter("NomNuePez").toString().equals(peces.getString("nomPez"))) {
                    session.setAttribute("error", "pez");
                    repetido = true;
                }
            }

            ResultSet users = w.executeQuery("SELECT * FROM usuario"); //Miramos si existe un usuario con el mismo nombre

            while (users.next()) {
                if (request.getParameter("CadenaNueNombre").toString().equals(users.getString("nomUsuario"))) {
                    session.setAttribute("error", "usuario");
                    repetido = true;
                }
            }

            if (repetido) { //Si se repite algún usuario o pez, te devuelve a formUsuario con el nombre del error determinando que tipo de error es
                response.sendRedirect("formUsuario.jsp");
            } else {

                ResultSet listado = s.executeQuery("SELECT * FROM tipopez WHERE nomTipo = '" + request.getParameter("NueTipoPez") + "'");
                listado.next();

                int tipo = listado.getInt("CodTipo");

                //guardamos las direcciones de las imágenes en el proyecto en un array de string, que usará como índice el código del tipo de pez
                String[] imagenesPeces = {"null", "mero.png", "atun.png", "trucha.png", "lubina.png", "siluro.png", "pezPayaso.png", "mariposaNarizona.png", "cirujanoAzul.png"}; 
                String imagen = "./images/" + imagenesPeces[listado.getInt("CodTipo")]; //Pasamos la imagen a cadena de texto

                String insercionPecera = "INSERT INTO pecera(tipoAgua) VALUES('" + request.getParameter("NueTipoAgua") + "')";

                s.execute(insercionPecera); //CREA LA PECERA

                Statement u = conexion.createStatement();
                ResultSet ultimaPecera = u.executeQuery("SELECT * FROM pecera ORDER BY codPecera DESC LIMIT 1");
                ultimaPecera.next();

                String insercionPez = "INSERT INTO pez(nomPez, imgPez, codTipo, codPecera) VALUES('" + request.getParameter("NomNuePez")
                        + "', '" + imagen + "', " + tipo
                        + ", " + ultimaPecera.getInt("codPecera") + ")";

                Statement a = conexion.createStatement();
                String inserccionUsuario = "INSERT INTO usuario(nomUsuario, contrasena, codPecera) VALUES('" + request.getParameter("CadenaNueNombre") + "','"
                        + request.getParameter("CadenaNueContrasena") + "','"
                        + ultimaPecera.getInt("codPecera") + "')";

                u.execute(insercionPez); //CREA EL PEZ
                a.execute(inserccionUsuario);//CREA EL USUARIO

                //out.print(insercionPez);
                response.sendRedirect("index.jsp");

            }


        %>




    </body>
</html>
