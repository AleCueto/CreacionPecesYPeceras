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
        <title>JSP Page</title>
    </head>
    <body>

        <%request.setCharacterEncoding("UTF-8");%>

        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pecesypeceras?useSSL=false&allowPublicKeyRetrieval=true", "root", "");
            Statement s = conexion.createStatement();

            
            ResultSet listado = s.executeQuery("SELECT * FROM tipopez WHERE nomTipo = '" + request.getParameter("NueTipoPez") + "'");
            listado.next();
            
            int tipo = listado.getInt("CodTipo");
                                            
            String[] imagenesPeces = {"null", "mero.png", "atun.png", "trucha.png"}; //El pez llamará a la imagen que tenga como índice su numero de tipo de pez
            String imagen= "./images/" + imagenesPeces[listado.getInt("CodTipo")]; //Pasamos la imagen a cadena de texto
            
            String insercionPecera = "INSERT INTO pecera(tipoAgua) VALUES('" + request.getParameter("NueTipoAgua") + "')"; 
        
            s.execute(insercionPecera); //CREA LA PECERA
            

            
            Statement u = conexion.createStatement();
            ResultSet ultimaPecera = u.executeQuery("SELECT * FROM pecera ORDER BY codPecera DESC LIMIT 1");
            ultimaPecera.next();
            
            String insercionPez = "INSERT INTO pez(nomPez, imgPez, codTipo, codPecera) VALUES('" + request.getParameter("NomNuePez") + 
                                                                                          "', '" + imagen +"', " + tipo + 
                                                                                          ", " + ultimaPecera.getInt("codPecera") + ")"; 
             
            
            Statement a = conexion.createStatement();
            String inserccionUsuario = "INSERT INTO usuario(nomUsuario, contrasena, codPecera) VALUES('"+ request.getParameter("CadenaNueNombre") + "','" +
                                                                                                          request.getParameter("CadenaNueContrasena") + "','" +
                                                                                                          ultimaPecera.getInt("codPecera") + "')";
           
            u.execute(insercionPez); //CREA EL PEZ
            a.execute(inserccionUsuario);//CREA EL USUARIO
            
            //out.print(insercionPez);
            response.sendRedirect("index.jsp");
            
        %>

        
        
        
    </body>
</html>
