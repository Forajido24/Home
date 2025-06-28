# hestek_v01
<h2> Primera fase</h2>
A new Flutter project.
El proyecto a 27/Junio/2025 termino la primera fase, donde integra el inicio de sesión y la creación de cuenta para poder acceder al sistema, así como de la primera versión de la pantalla home.
<h1>Estructura modumar del proyecto </h1>
También conocido como arquitectura limpia, contiene la siguiente distribución por el momento 

lib/
│
├── main.dart
├── routes/
│   └── app_routes.dart
│
├── screens/
│   ├── login_page.dart
│   ├── home_page.dart
│   └── register_page.dart
│
├── widgets/
│   └── custom_button.dart
│
├── services/
│   └── auth_service.dart
│
├── models/
│   └── user_model.dart

El main contiene la primera ruta de las pantallas que en este caso sería el login, y al igual esta el inicio seguro de Firebase para que no exista ningún problema

<h3>routes</h3>
Contiene todas las direcciones/rutas de las ubicaciones de las pantallas, esto nos beneficia porque solo tenemos que usar la clase AppRoutes, que contiene el archivo para lograr desplazarnos entre pantallas sin necesidad de colocar toda la dirección del archivo

<h3>screens </h3>
Contiene todos los archivos de las pantallas a usar del proyecto,  en esta mantenemos que no haya backend,  solo la parte visual para el usuario 

<h3>widgets</h3>
En muchas ocasiones hay botones o elementos de la pantalla que contiene el mismo diseño,  por lo qje guardar todas las configuraciones de diseño de los widgets, en un solo archivo,  ayuda a reutilizar código sin repetir las instrucciones 

<h3>services</h3>
Esta carpeta alberga el manejo de datos del login y del registro 

