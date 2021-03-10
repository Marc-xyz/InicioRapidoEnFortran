```Fortran
# InicioRapidoEnFortran
Traducción de
https://fortran-lang.org/learn/quickstart
, porqué sí,
sin más,
es agradable hacerlo.
```
## Tutorial de inicio rápido en Fortran (índice)
* Introducción
* Hola Mundo
    -  Configuración del compilador
    -  _Hola Mundo_

## Introducción
El siguiente tutorial de inicio rápido ofrece una descripción general del lenguaje de programación Fortran, así de como su sintaxis para estructuras de programación típicas como: tipos (_types_), variables (_variables_), arreglos o vectores (_arrays_), flujo de control (_control flow_) y funciones (_functions_).

El contenido de este tutorial se muestra en la barra de navegación, que en un principio, quedara a su izquierda, la sección en la que se halle quedará resaltada en negrita (**Esto esta en negrita**)

Use el botón _Siguiente_, en la parte inferior (imagíneselo), para comenzar el tutorial con el típico ejemplo  _Hola Mundo_ esta vez en Fortran !

## Hola Mundo
En esta parte del tutorial, vamos a escribir nuestro primer programa en Fortran: el omnipresente ejemplo de _Hola Mundo_.

Sin embargo antes de poder escribir (~para luego compilar y después ejecutar~) nuestro programa, debemos asegurarnos de tener configurado un compilador de Fortran.

> **Nota para quien navega**: Fortran es un lenguaje compilado, lo que quiere decir, que una vez escrito, antes de ser ejecutado por una máquina, debe ser compilado para producir un archivo que si que sea ejecutable por una máquina.

### Configuración del compilador
En este tutorial vamos a trabajar con [_GNU Fortran compiler (gfortran)_](https://gcc.gnu.org/fortran/), el cual es parte del conocido [_GNU Compiler Colection_(GCC)](https://gcc.gnu.org/), (~gcc para los amigos~).

Para instalar `gfortran` en _Linux_, use su administrador de paquetes del Sistema. En _macOs_, puede instalar `gfortran` usando [_Homebrew_](https://brew.sh/) o bien [_MacPorts_](https://www.macports.org/). En _Windows_, usted puede descargar los archivos binarios [aquí](http://www.equation.com/servlet/equation.cmd?fa=fortran).

Para comprobar si usted ha configurado correctamente `gfortran` puede abrir una terminal y ejecutar el siguiente comando (~si se fía de nosotros~)

```terminal
$> gfortran --version
```

su salida (_output_) debería ser algo tal que así:

```
GNU Fortran 9.3.0
Copyright (C)  2019  Free Software Foundation, Inc.
This is free software;
see the source for copying conditions.  
There is NO warranty;
not even for MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE.
```

### _Hola Mundo_
Una vez que haya configurado su compilador, abra un nuevo archivo en su editor de código favorito (~que debería ser Vim~) e ingrese el siguiente código (~vamos, píquelo por usted~):

```Fortran
program holamundo
  ! Esto es una linea de comentario, el compilador la ignorara
  print *, 'Hola, Mundo!'
end program holamundo
```
Guardando su programa como `holamundo.f90` compile el mismo con la siguiente linea de código en su terminal.

```terminal
gfortran holamundo.f90 -o holamundo
```
> **Nota para quien navega**: `.f90` es la extensión para archivos fuente modernos de Fortran. El número 90 hace referencia al momento en que apareció el primer estándar moderno de Fortran, que fue 1990.

Para ejecutar el (~maravilloso~) programa producido por el compilador use:

``` terminal
$> ./holamundo
```

y obtendrá (~junto a su creciente fascinación, vamos siga-me el rollo~)

```terminal
 Hola, Mundo!
```
Felicitaciones, usted, ha escrito, compilado y ejecutado su primer programa en Fortran! En la siguiente parte de este (~apasionante~) tutorial le presentaremos variables (_variables_) para almacenar datos !
