## Proyecto Flutter - Sección B

Este repositorio contiene la implementación en Flutter de la interfaz de usuario para la **Sección B** (Gestión de Productos y Perfil).

---

## Elementos Adicionales Implementados (No vistos en clase)

Para completar los requerimientos visuales y la interactividad de los bocetos de la Sección B, se integraron los siguientes widgets y conceptos del framework:

### 1. `TextField` e `InputDecoration`
* **¿Qué es?**: Componentes fundamentales del catálogo de Material Design en Flutter para la entrada interactiva de texto y su estilización visual.
* **¿Por qué se usó?**: Se emplearon para renderizar los campos de entrada de credenciales en la pantalla de **Login**, el campo de búsqueda en **Listar Productos** y el formulario de ingreso de datos (nombre, descripción, precio y stock) en **Registrar Producto**.

### 2. `StatefulWidget` y `setState`
* **¿Qué es?**: Estructura de widget reactivo que conserva un estado mutable a lo largo del tiempo, junto con el método `setState()`, el cual notifica al framework que el estado interno ha cambiado para ejecutar un redibujado (*rebuild*) de la interfaz.
* **¿Por qué se usó?**: Utilizado en la pantalla de **Login** para alternar de forma dinámica el estado booleano de la propiedad `obscureText`, permitiendo al usuario mostrar u ocultar la contraseña al presionar el icono del ojo.

### 3. `Stack` y `Positioned`
* **¿Qué es?**: `Stack` es un widget de maquetación que superpone a sus hijos unos sobre otros en capas (eje Z). `Positioned` es un widget contenedor exclusivo de `Stack` que controla las coordenadas exactas (`top`, `bottom`, `left`, `right`) de su hijo.
* **¿Por qué se usó?**: Se aplicó en la pantalla de **Perfil** para posicionar el botón circular azul con el icono de edición sobre la esquina inferior derecha del `CircleAvatar` de la foto de usuario.

### 4. `SingleChildScrollView`
* **¿Qué es?**: Un contenedor que permite el desplazamiento (*scroll*) vertical u horizontal de un único widget hijo.
* **¿Por qué se usó?**: Envuelve la estructura principal de las pantallas de **Login**, **Registrar Producto** y **Perfil** para evitar el error visual de desbordamiento de píxeles (*yellow and black striped overflow banner*) cuando el teclado en pantalla del dispositivo móvil se despliega.