# Práctica 6.2: Offline Madrid Shopping
## Juan A. Caballero
-----------------------------------------------

DESCRIPCIÓN DE LA PRÁCTICA
-----------------------------------------------
La práctica consiste en la implementación de una app llamada Madrid Shoping que muestra una lista de tiendas de Madrid con todos sus detalles de ubicación, descripción, etc. 

Al cargar la aplicación, aparece el logo de bienvenida y el botón **"Go!!"** que al pulsarlo inicia la descarga de todos los datos, incluidas todas las imágenes que son descargadas en segundo plano. Todos los datos descargados se guardan en la base de datos Core Data del dispositivo.

Una vez descargados todos los datos y cargados en Core Data, se muestra la pantalla principal con un listado de tiendas en dos formatos: en un plano de madrid mostrado en la mitad superior de la imagen y en un listado implementado en un Collection View con el nombre, logo e imagen de la tienda. 

Una vez descargados todos los datos y cargados en Core Data, se activa un flag que indica que los datos ya están descargados para no volver a descargarlos nunca más y poder así disfrutar de ellos en offline. 

Si pulsamos en las celdas del Collection View, nos muestra otra pantalla con la vista en detalle de la tienda seleccionada donde podemos ver el nombre y dirección de la tienda, una imagen con un plano de situación y una descripción en idioma español o inglés. 



DETALLES SOBRE LA IMPLEMENTACIÓN
-----------------------------------------------

VALIDACIÓN DE JSON

Se omiten los datos erróneos para no crashear la app, pues no podemos garantizar que todos los datos del Json estén bien. De hecho, hay datos que están mal. El código de validación se ha dejado comentado. Si tuviera más tiempo quizás podría revisar los datos con más detalle y ver si interesa validar algo más.


FUNCIONALIDADES NO IMPLEMENTADAS

No me ha dado tiempo a implementar la lista de tiendas en mapa con el detalle de las mismas al pulsar sobre el pin. En su defecto, he incluido un plano de Madrid para ver el efecto visual. 

Tampoco me ha dado tiempo a mostrar la barra de progresión del estado de la descarga. 

Resaltar también que no he conseguido que la parte de arriba de la Collection View llegue hasta la imagen, queda un hueco supongo que para poner un título o algo así, pero no he conseguido quitarlo. Como no es prioritario tampoco le he dedicado demasiado tiempo.


**PROBLEMAS DE ÚLTIMA HORA**
-----------------------------------------------

He notado que a veces al cambiar de dispositivo para ver que funciona bien no me carga bien los datos de Core Data. Me lo hizo hace un par de días y cambié algunas cosas y no me había vuelto a pasar hasta esta tarde. Incluoso a veces no carga ni la CollectionView.

Después de chequear todo el proyecto de arriba a abajo he observado que omitiendo el código de la descarga de la imagen de localización de la vista en detalle parece funcionar bien, así que lo dejo comentado porque no me da tiempo a chequear mucho más y al menos quiero que se pueda ver lo que sí funciona. 

Si diera algún problema y no mostrara la Collection View, siempre se pueden mirar algunos commits atrás que seguro se cargará al menos lo que había hecho hasta entonces con la Collection View. Disculpa las molestias si fuera necesario.

Para alguien que nunca antes de este máster ha programado nada me ha costado lo suyo llegar hasta aquí. No obstante, seguiré trabajando en los próximos días para acabar las funcionalidades pendientes. No sé si después de esta fecha habrá o no posibilidad de su corrección, pero en cualauier caso al menos quiero terminarla para aprender todo lo que conlleva.  





