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

![imagen](https://user-images.githubusercontent.com/91873580/155166282-fe5f288d-cef9-446f-aa49-11a02541a089.png)


Como se puede observar, a la derecha de cada una de las tuplas, hay un icono que nos permite eliminar el pez de nuestra pecera, y editar el nombre del mismo.
Si pulsamos el icono de la papelera podemos ver como nos aparece una alerta que nos pregunta si queremos continuar, en caso de estar de acuerdo, pulsamos "aceptar y eliminará de la pecera el pez elegido".

![imagen](https://user-images.githubusercontent.com/91873580/155166491-5a366885-3ef3-43b7-b1bf-44d0c1802a07.png)


 Si deseamos editar el nombre del pez, damos clic en el icono del lápiz, que nos llevará a una página parecida a la de login, en la que podremos elegir el nuevo nombre para nuestro querido pez.
 
 ![imagen](https://user-images.githubusercontent.com/91873580/154851184-a8c82e20-56e0-4f75-905b-eb75a554e4b7.png)

También tenemos arriba a la derecha de la tabla de la pecera, una etiqueta que nos permite añadir un nuevo pez, si le damos nos enviará a una página en la que podremos seleccionar el nombre de nuestro nuevo pez y el tipo de pez del que se trata.

![imagen](https://user-images.githubusercontent.com/91873580/154851316-b0a3e4f1-0319-4ee6-b315-c500266dbe44.png)

Por último, en el apartado de login, abajo a la derecha tenemos un icono en color amarillo, para contrastar con el resto de la aplicación y permitir que el usuario se de cuenta de él. Este icóno nos permite crear un nuevo usuario, si le damos clic nos llevará a una página en la que deberemos hacer el registro de nuestro nuevo usuario, para ello introducimos un nombre, una contraseña, un nombre para nuestro primero pez, además de su tipo y del tipo de agua que queremos para nuestra pecera (salada o dulce).

![imagen](https://user-images.githubusercontent.com/91873580/155166663-b2fc8f0f-a265-41b5-9136-a5106eb82cb5.png)

## Notas (importante)
El nombre del usuario principal es "AleCueto" y su contraseña es "contraseña", hay mas usuarios con datos, sus contraseñas y nombres se pueden consultar en la base de datos.
El nombre de la base de datos creada DEBE SER "pecesypeceras".

## Video explicación
En este video explico el flujo de los archivos del programa y muestro como funciona a grandes rasgos:

[![Watch the video](https://user-images.githubusercontent.com/91873580/154855783-9398b583-d211-4900-ade5-e0442e648b34.png)](https://youtu.be/KJmyOHkWw8U)
