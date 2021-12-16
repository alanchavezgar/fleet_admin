----------------
# Administrador de flota
Se desea conocer la ubicación de una flota de vehículos en 3 ciudades distintas.

Para ello se plantea realizar una aplicación en Django donde se pueda visualizar una pantalla donde se vean las ciudades en cuestión y los vehículos que se encuentran en ellas.

A la par, se plantea tener una api rest en la aplicación donde se pueden administrar los vehículos. De esta manera:
- Se puede crear, editar o eliminar los vehículos de la flota.
- Se puede listar los vehículos y su estado actual
- Se puede dar la instrucción de que un vehículo viaje a una ciudad determinada

Un vehículo tiene la siguiente información
- ID de Vehículo
- Ubicación actual
- Consumo de combustible (km/lt)
- Distancia recorrida
- Combustible consumido

Las ciudades tienen la siguiente distancia entre sí:

           Ciudad A,  Ciudad B,  Ciudad C
Ciudad A       0,         1,       2
Ciudad B        ,         0,       4
Ciudad C        ,          ,       0

Al dar la instrucción de que un vehículo viaje a una ciudad se debe de actualizar su información. En particular sus atributos de distancia recorrida y combustible consumido.

La interacción/diseño y coordinación entre front/back/BD es propuesta por el desarrollador.
El flujo de desarrollo, documentación y pruebas de los diferentes componentes se deja al criterio del desarrollador.

La aplicación puede ser desarrollada en python en Django/DRF o bien en Ruby/Rails.

El uso adicional de otra herramienta es libre. Se entregará en un repositorio público en control de versiones, con instrucciones de instalación y levantamiento.

----------------
