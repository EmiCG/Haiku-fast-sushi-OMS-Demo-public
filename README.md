# Haiku-fast-sushi-OMS-Demo-public

Este repositorio ha sido configurado para albergar **los proyectos relacionados de un sistema, organizados de manera que cada proyecto reside en su propia rama independiente**. Esto permite mantener el historial y el desarrollo de cada aplicación de forma aislada, facilitando su gestión y despliegue.

## 💡 Contexto del proyecto

Este idea surge a raiz de la necesidad de un negocio local de comida japonesa en el que la gestion de los pedidos manual, al tratarse de productos con gran cantidad de ingredientes y variaciones se hace insostenible el manejo manual (como se realizaba originalmente).

Dentro de las necesidades que surgen, en esta demo estan presentes:

```markdown
1. Menu actualizados
2. creacion de productos
3. edicion de productos
4. eliminar productos
5. visualizar productos
6. visualizar pedidos
7. dashboard de administracion
```

Se realizan varias entrevistas con los dueños del negocio del que se extraen las distintas necesidades y requerimientos de la forma en que se gestionan los pedidos, se genera un documento "Descripcion de requerimientos" (Se mantiene confidencial a decision del negocio).
Es importante mencionar que esto solo se trata de una version demo que fue presentada a los dueños para mostrarles una idea general de como podria ser la version final del sistema y por lo tanto deja fuera muchas de las funcionalidades que serian relevantes en el sistema final, en consecuencia se dio una retroalimentacion al equipo de desarrollo sobre la que se trabajó la versión final (codigo fuente confidencial a decision de la empresa).

## 🎯 Objetivo del Repositorio

El objetivo principal de este repositorio es centralizar el código fuente de diferentes aplicaciones (backend y frontend) que forman parte de un ecosistema más grande. Al separar cada proyecto en su propia rama, se busca:

* **Claridad y Organización:** Evitar la mezcla de archivos de distintos proyectos en un único directorio de trabajo local.
* **Aislamiento del Desarrollo:** Permitir el desarrollo y las actualizaciones de un proyecto sin afectar directamente los archivos de otro. Cuando cambias de rama, tu directorio de trabajo se actualizará para mostrar solo los archivos del proyecto activo.
* **Gestión de Dependencias Separada:** Cada rama contiene un proyecto con su propio conjunto de dependencias y configuraciones específicas sin conflictos.
* **Despliegue Flexible:** Facilitar el despliegue de cada aplicación de forma independiente desde su respectiva rama.

## 📂 Estructura del Repositorio (por Rama)

Es importante entender que este repositorio **no contiene subcarpetas para cada proyecto en la rama `main`**. En su lugar, la estructura de archivos en tu directorio local **cambiará completamente** dependiendo de la rama en la que te encuentres.

### Rama `main` (o `master`)

* **Propósito:** Esta rama actúa como la base limpia del repositorio. Idealmente, contiene solo archivos de documentación (`README.md`, etc.) y configuraciones globales de Git, sin el código fuente de las aplicaciones.
* **Contenido:** Generalmente vacía de código de aplicación, o con un `README.md` como este.

### Rama `laravel`

* **Propósito:** Contiene todo el código fuente del proyecto Laravel (backend/API).
* **Contenido al hacer `git checkout laravel`:**
    ```
    tu_repositorio/
    ├── app/
    ├── bootstrap/
    ├── config/
    ├── database/
    ├── public/
    ├── resources/
    ├── routes/
    ├── storage/
    ├── tests/
    ├── vendor/
    ├── .env
    ├── .env.example
    ├── .gitattributes
    ├── .gitignore
    ├── artisan
    ├── composer.json
    ├── composer.lock
    ├── package.json
    ├── postcss.config.js
    ├── readme.md
    └── vite.config.js
    ```
    (Y cualquier otro archivo o directorio propio de tu aplicación Laravel).

### Rama `flutter`

* **Propósito:** Contiene todo el código fuente del proyecto Flutter (frontend/móvil/desktop/web).
* **Contenido al hacer `git checkout flutter`:**
    ```
    tu_repositorio/
    ├── android/
    ├── ios/
    ├── lib/
    ├── linux/
    ├── macos/
    ├── web/
    ├── windows/
    ├── test/
    ├── .gitignore
    ├── pubspec.yaml
    ├── pubspec.lock
    ├── analysis_options.yaml
    ├── README.md
    └── (y cualquier otro archivo/directorio propio de tu aplicación Flutter)
    ```

## 🚀 Cómo Navegar y Trabajar con los Proyectos

Para trabajar en cualquiera de los proyectos, necesitas **cambiar a la rama correspondiente**. Git se encargará de actualizar tu directorio de trabajo con los archivos de esa rama.

1.  **Clonar el Repositorio (si aún no lo has hecho):**
    ```bash
    git clone <https://github.com/EmiCG/Haiku-fast-sushi-OMS-Demo-public.git>

    cd Haiku-fast-sushi-OMS-Demo-public
    ```
    Por defecto, estarás en la rama `main`.

2.  **Cambiar a la Rama del Proyecto Deseado:**
    * Para trabajar en el **proyecto Laravel (backend)**:
        ```bash
        git checkout laravel
        ```
    * Para trabajar en el **proyecto Flutter (frontend)**:
        ```bash
        git checkout flutter
        ```
    * Para volver a la rama base (limpia):
        ```bash
        git checkout main
        ```

    **¡Importante!** Cada vez que cambies de rama, los archivos en tu directorio local (`Haiku-fast-sushi-OMS-Demo-public/`) se modificarán para reflejar el contenido de la rama activa. Asegúrate de tener un directorio de trabajo limpio (sin cambios pendientes) antes de cambiar de rama, o `stash` tus cambios si necesitas guardarlos temporalmente.

### 3. Configuración y Ejecución de cada Proyecto

Una vez que hayas cambiado a la rama del proyecto deseado, puedes proceder con su configuración y ejecución como lo harías normalmente para ese tipo de proyecto:

#### 3.1. Para el Proyecto Laravel (en la rama `laravel`)

```bash

#Asegúrate de estar en la rama 'laravel'
git checkout laravel

# Instalar dependencias de Composer
composer install

# Copiar el archivo .env y generar la clave de la aplicación
cp .env.example .env
php artisan key:generate

# Configurar la base de datos en el archivo .env
# (Asegúrate de que tus credenciales de DB sean correctas)

# Ejecutar migraciones y seeders (si los tienes)
php artisan migrate --seed

# Iniciar el servidor de desarrollo de Laravel
php artisan serve

```
#### 3.2. Para el Proyecto Flutter (en la rama `flutter`)

```bash
# Asegúrate de estar en la rama 'flutter'
git checkout flutter

# Obtener las dependencias de Flutter
flutter pub get

# Ejecutar el proyecto en un dispositivo o emulador (o navegador web)
# Asegúrate de tener un dispositivo/emulador conectado o configurado en caso de requerirlo.
flutter run
# Para desarrollo web:
# flutter run -d chrome

```

## 🚀 Aplicación funcionando

### Vistas de administrador

#### Dashboard

![alt text](src\admin_dashboard.png)

#### Pedidos

![alt text](src\admin_pedidos.png)

#### Editar producto

![alt text](src\admin_producto_editar.png)

#### Productos

![alt text](src\admin_productos.png)

### Vistas de clientes

#### Carrito de compras

![alt text](src\menu_carrito.png)

#### Menu de compras

![alt text](src\menu_mobile.png)
