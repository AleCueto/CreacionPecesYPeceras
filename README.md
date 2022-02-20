# CreacionPecesYPeceras
Este repositorio contiene el código fuente y la base de datos (fichero .sql) que conforman una aplicación CRUD (Create, Read, Update, Delete) en la que se puede almacenar una serie de usuarios y peces asignados a estos.
## Apartados:
La aplicación se divide en los siguientes apartados:
-Ventana login. En esta podemos iniciar sesión, introduciendo un nombre de usuario y una contraseña, que se comprobarán en la base de datos.

![imagen](https://user-images.githubusercontent.com/91873580/154850265-bcae3875-771c-4a39-9a41-428606a597ab.png)

(Extracto de código con comprobación de login.jsp).
En esta parte simplemente se hace un bucle que pasa por todos los usuarios mirando si tienen el nombre y contraseña introducidos para mandarte a la pecera de tu usuario, de no ser así, te devuelve a la pantalla de login.

![imagen](https://user-images.githubusercontent.com/91873580/154850353-72e26d0f-28ee-4e5f-a6f7-5fc80dbb5585.png)

Si introducimos valores correctos, entraremos en nuestra pecera, en la que podemos ver a nuestros peces, los cuales tienen un nombre, un tipo (mero, atún, carpa...) y una imagen. Además, la tabla es completamente responsive y permite hacer un scroll para ver cuantos elementos se desee.

![imagen](https://user-images.githubusercontent.com/91873580/154850914-88586b33-08b3-47fb-b61f-a2c82ddd4d2d.png)

Como se puede observar, a la derecha de cada una de las tuplas, hay un icono que nos permite eliminar el pez de nuestra pecera, y editar el nombre del mismo.
Si pulsamos el icono de la papelera podemos ver como nos aparece una alerta que nos pregunta si queremos continuar, en caso de estar de acuerdo, pulsamos "aceptar y eliminará de la pecera el pez elegido".

![imagen](https://user-images.githubusercontent.com/91873580/154851060-c925cdb9-f8b1-44e5-9967-6635236666c4.png)

 Si deseamos editar el nombre del pez, damos clic en el icono del lápiz, que nos llevará a una página parecida a la de login, en la que podremos elegir el nuevo nombre para nuestro querido pez.
 
 ![imagen](https://user-images.githubusercontent.com/91873580/154851184-a8c82e20-56e0-4f75-905b-eb75a554e4b7.png)
