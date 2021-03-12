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
* Variables
    - Declarar variables
    - Estándares de entradas/salidas (_input/output_)
    - Expresiones
    - Precisión de punto flotante (_floats_)

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

## Variables 
Las variables permiten guardar información que va a manipular o usar el programa. Fortran es un lenjuage de programación **fuertemente tìpado**, lo que quiere decir, que dada cualquier variable esta debe tener un **tipo** (_type_).

Hay 5 **tipos integrados** (_built-in data types_) en Fortran (para el que el lenguaje de programación proporciona soporte integrado.)

- `integer` (enteros) - para los datos que representan números enteros, tanto positivo como negativos negativo.
- `real` (números reales) - para almacenar datos con precisión de punto flotante (_floating-point_). No para enteros.
- `complex` (números complejos) - par compuesto por una parte real y otra imaginaria.
 - `character` (carácter) - para los datos de texto.
 - `logical` (lógico) - para representar los valores booleanos, falso o verdadero.

Antes de podar usar una variable, debe ser declarada; esto le dice al compilador que tipo (_type_) de variable es, y si es el caso, otros atributos de la variable declarada.

> **Nota para quien navega**: Fortran es un **lenguaje de programación de tipo estático** (_statically typed_), lo que significa, que el tipo (_type_) de cada variable es fijo (no varia) una vez el programa es compilado. Es decir, mientras se ejecuta un programa en Fortran, una variable que se declare de un tipo (_type_), no podrá cambiarse a otro tipo  (_type_) durante el programa se este ejecutándose.
 

### Declaración de variables
La sintaxis para declarar una variables es

```Fortran
<tipo_de_variable> :: <nombre_de_la_variable>
```

donde `<tipo_de_variable>` es una de las cinco variables de la lista anterior y  `<nombre_de_la_variable>` es el nombre con el cual a usted le gustaría llamar a su variable.

Los nombres, para las variables, deben comenzar con una letra y pueden consistir en letras, números y guiones bajos `_` . En el siguiente ejemplo vamos a declarar una para cada tipo de variable integral.
 
**Ejemplo (Declaración de variables)**
```Fortran
program variables
    implicit none
    
    integer :: cantidad
    real :: pi
    complex :: frecuencia
    character :: inicial
    logical :: estaBien

end program variables    
```

> **Nota para quien navega**: El código en Fortran no es capaz de distinguir entre mayúsculas y minúsculas, así que no va a tenerse que preocuparse de ello en el nombre de las variable. Aún así es una buena practica mantener la coherencia con los nombres que usted dé.
 
Considere la sentencia al inicio del programa `implicit none` , del programa anterior. Esta sentencia _le dice_ al compilador que todas las variables van a ser declaradas explícitamente, sin este fragmento de código, las variables se declararan implícitamente de acuerdo con la primera letra de su nombre.

|**Importante:** |
|------------------------------------------------------------------------|
|Utilice siempre la sentencia `implicit none` al inicio de programa (_program_) y proceso (_procedure_). El tipado de variables (asignar tipos a las variables)  implícito es considerado una mala (~horrible~) práctica en la programación moderna, ya que oculta información que puede conducir a errores en el programa. |

Una vez hemos declarado una variable, podemos asignarle y reasignarle un valor determinado, usando el operador de asignación `=`.

**Ejemplo (Asignado valores a variables)**
```Fortran
cantidad = 10
pi = 5.141592
frecuencia = (1.0.-0.5)
inicial = 'M'
estaBien = .false.
```
Los caracteres deben ser puestos entre comillas simples `'` o compuestas `"`.

Los valores lógicos o booleanos pueden tomar el valor `.true.` ó bien `.false.` .

|**Importante:** |
|------------------------------------------------------------------------|
|Tenga cuidado la declaración y asignación `integer :: cantidad = 1`. **NO** es una inicialización normal para la variable, ya que implica el uso del atributo `save` lo que quiere decir que la variable retiene el valor entre procesos de llamada. Es una buena practica inicializar las variables de forma separada a la declaración de las mismas.|

### Estándares de entradas/salidas (_input/output_)




