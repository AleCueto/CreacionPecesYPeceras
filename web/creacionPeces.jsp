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

            ResultSet listado = s.executeQuery("SELECT * FROM tipopez WHERE nomTipo = '" + request.getParameter("TipoPez") + "'");
            listado.next();
            
            out.println(request.getParameter("NomPez"));
            out.println(request.getParameter("TipoPez"));
        %>

        <h1></h1>
        

        <%            
            String[] imagenesPeces = {"null", "mero.png", "atun.png", "trucha.png"}; //El pez llamará a la imagen que tenga como índice su numero de tipo de pez
            String imagen= "./images/" + imagenesPeces[listado.getInt("codTipo")]; //Pasamos la imagen a cadena de texto
            
            String insercion = "INSERT INTO pez(nomPez, imgPez, codTipo, codPecera) VALUES('" + request.getParameter("NomPez") + "', '" + imagen +"', " + listado.getInt("codTipo") + ", " + request.getParameter("NumPecera") + ")"; //Pinta una coma la final
        
            s.execute(insercion);
            out.print(insercion);
            //response.sendRedirect("pecera.jsp");
        %>
        <img src=<%=imagen%> alt="alt"/>
        
        
        
        
    </body>
</html>
