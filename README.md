# Fleet Admin/Administrados de flotillas

La descripción de este proyecto se encuentra en el archivo test_description.md

* Versión de Ruby

      ruby '3.0.0'

* Dependencias

      PostgreSQL

* Configuración

  Instala __RVM__ (Ruby Version Manager)

      \curl -sSL https://get.rvm.io | bash
  
  Después instala Ruby 3.0.0

      rvm install  "ruby-3.3.0"
      rvm use 3.0.0

  Bundler

      cd fleet_admin

      gem install bundler

  Instala las gemas

      bundle install

* Creación de la base de datos

      rake db:create

* Inicio de la base de datos

      rake db:migrate

      rake db:seed

* Cómo correr la suite de prebas

      rspec

    Esto ejecutara todas las pruebas unitarias, las cuales se encuentran alojadas en la carpeta spec/

* Iniciar sistema

      rails s 

    Esto inicia el sistema, si entras a [localhost:3000](localhost:3000) estas son las vistas del backoffice,
    desde donde se pueden crear 'Ciudades', 'Rutas' y Vehículos.

    Si entras a [localhost:3000/api-docs](http://localhost:3000/api-docs) tendras disponible Swagger,
    que es una interfaz que muestra los endpoints disponibles y su definición.

    También está disponible el archivo __API V1.postman_collection.json__ que puede ser importado a Postman
    para hacer requests al sistema.

    Tanto 'Ciudades' como 'Rutas' y 'Vehículos' tienen disponibles operaciones CRUD que están
    documentadas en las opciones anteriormente mencionadas.

    Para asignar una ruta a un vehículo, es necesario hacer un request POST a ```/vehicles/{id}/send_to_route.json```,
    donde {id} es el id del vehículo, el payload debe de considerar el id de la ruta, como se muestra en el siguiente ejemplo:

    ``` json
    {
      "route_id": 0
    }
    ```

    Para simular que el vehículo terminó el trayecto que se le asignó, está disponible el endpoint
    ```/vehicles/{id}/finish_route.json``` donde al hacer un request POST con el id del vehículo del
    cuál se quiere terminar el trayecto, este será actualizado con el consumo de combustible y
    la distancia recorrida.

## TODO:
  * Algunas vistas del backoffice no quedaron terminadas.
  * Corregir las pruebas que no están pasando.