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
* Formaciones ( _arrays_) y cadenas de caracteres (_strings_) 
    - Declaración de formaciones (_arrays_)
	- Rebanadas de formaciones (_Array slicing_)
	- Asignación dinámica de formaciones (_dynamic arrays_) 
	- Cadenas de caracteres (_character strings_)
## Introducción
El siguiente tutorial de inicio rápido ofrece una descripción general del lenguaje de programación Fortran, así de como su sintaxis para estructuras de programación típicas como: tipos (_types_), variables (_variables_), arreglos (~este termino es poco adecuado~) o vectores (_arrays_), flujo de control (_control flow_) y funciones (_functions_).

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

En nuestro ejemplo anterior (`holamundo.f90`), imprimimos texto en la terminal. A esto se lo conoce comúnmente como `standard output` o bien `stdout`(salida estándar).

Podemos usar la sentencia `print` para imprimir valores de variables con la salida estándar (`stdout`):


**Ejemplo (Salida estándar de variables)**
```Fortran
print *, 'El valor de cantidad (numero entero) es: ', cantidad
print *, 'El valor de pi (numero real) es: ', pi
print *, 'El valor de frecuencia (numero complejo) es: ', frecuencia
print *, 'El valor de inicial es (carcter): ', inicial
print *, 'El valor inicial de estaBien (logico) es: ', estaBien
```

De forma similar, podemos leer valores en la ventana de comandos (o _shell_, o _command windows_), usando la sentencia `read`:

**Ejemplo (Entrada y salida estándar de variables)**
```Fortran
        program leer_valores
                implicit none
                integer :: edad

                print *, 'Por favor introduzca su edad: '
                read (*,*) edad

                print *, 'Tu edad es: ', edad
        end program leer_valores      
```

Esta fuente de entrada (_input source_) comúnmente se suele referenciar como `standard input` o bien `stdin` (Entrada estándar).
### Expresiones

En la siguiente tabla se muestra, por orden de precedencia, el conjunto de operadores aritméticos habituales disponibles en Fortran:

|Operador |   Descripción    |
|---------|------------------|
|   `**`  | Potencia         |
|   `*`   | Multiplicación   |
|   `/`   | División         |
|   `+`   | Suma             |
|   `-`   | Resta            |

Veamos un ejemplo de su uso.

**Ejemplo (Operadores aritméticos con un cilindro)**
```Fortran
      program aritmetica
        implicit none

        real :: pi
        real :: radio_cilindro
        real :: altura_cilindro
        real :: area_cilindro
        real :: volumen_cilindro

        pi=3.1415926535
        !  3.14159265358979323846264338

        print *, 'Introduzca el radio de la base del cilindro:'
        read(*,*) radio_cilindro

        print *, 'Introduzca la altura del cilindro:'
        read(*,*) altura_cilindro

        area_cilindro = pi*radio_cilindro**2.0
        volumen_cilindro = area_cilindro*altura_cilindro

        print *, 'Radio del cilindro: ', radio_cilindro
        print *, 'Altura del cilindro: ',altura_cilindro
        print *, 'Area del cilindro: ',area_cilindro
        print *, 'Volumen del cilindro: ',volumen_cilindro
      end program aritmetica

```
### Precisión de punto flotante (_floats_)

La precisión de punto flotante (_floating-point precision_) deseada se puede declara de forma explicita usando el parámetro `kind`. El módulo intrínseco (_intrinsic module_) `iso_fortran_env` proporciona parámetros de tipo (_kind_) para los tipos comunes de 32 bits y 64 bits.

De nuevo, veamos un ejemplo de ello.

**Ejemplo (De tipo (_kind_) explicíto  con `iso_fortran_env`)**
```Fortran
      program flotante
        use, intrinsic :: iso_fortran_env, only: sp=>real32, dp=>real64
        implicit none
        real(sp) :: flotante32
        real(dp) :: flotante64

        flotante32 = 1.0_sp
        !Sufijo explicito para constantes literales
        flotante64 = 1.0_dp

        print *,'flotante32 = ',flotante32
        print *,'flotante64 = ',flotante64
        !flotante32 =    1.00000000    
        !flotante64 =    1.0000000000000000 
      end program flotante

```

|**Importante:** |
|------------------------------------------------------------------------|
|Siempre use un  sufijo `kind` (de tipo) para las constantes literales en punto flotante.|

Podemos usar otro modulo,

**Ejemplo (De tipo _kind_ con `iso_c_binding`)**
```Fortran
      program flotante2
            use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
            implicit none
            real(sp) :: flotante32
            real(dp) :: flotante64
            
            flotante32 = 1.0_sp
            flotante64 = 1.0_dp
            print *,'flotante32 = ',flotante32
            print *,'flotante64 = ',flotante64
            !flotante32 =    1.00000000    
            !flotante64 =    1.0000000000000000 
      end program flotante2
```
En la siguiente subsección, vamos a aprender como usar vectores para almacenar más de un valor en una variable.

## Formaciones ( _arrays_) y cadenas de caracteres (_strings_) 

Sucede más a menudo que lo contrario, que necesitamos almacenar y operar con largas listas de números, en lugar de unas únicas pocas variables escalares o caracteres (como las que hemos visto hasta ahora). En programación informática estas listas son llamadas _arrays_, que siguiendo el trabajo de _Antonio Ramón Vaquero Sánchez( 30 de  Agosto 1938)_ no traduciremos (~nunca más como arreglos~) sino como vectores  o formaciones (de escalares, por ejemplo).

Entendemos como formaciones (_arrays_), variables _multidimensionales_, es decir, que contienen más de un valor, donde cada uno de estos resulta accesible mediante un o unos indices numerables.

|**Importante:** |
|------------------------------------------------------------------------|
| Las formaciones o vectores  (_arrays_) están indexadas comenzando por `1`, esto quiere decir,  que para acceder al primer elemento de cualquiera de sus dimensiones, vamos a usar el indice igualado a `1`.|

## Declaración de formaciones (_arrays_)

Podemos declarar formaciones (_formaciones_) de cualquier tipo. Hay dos notaciones comunes para declarar formaciones de variables; usando la palabra clave `dimension` o agregando las dimensiones de la formación entre paréntesis después del nombre de la variable de formación separadas por `:`.

Veamos un ejemplo,

**Ejemplo (Declaración estática de una formación)**
```Fortran
      !Declaración estática de una formación
      program formaciones
         !Formación de enteros 1-Dimensional (1D)
         integer, dimension(10) :: formacion1

         !Declaración equivalente 
         integer :: formacion2(10)

         !Formación de reales 2-Dimensional (2D)
         real, dimension(10,10) :: formacion3

         !Personalizando límites superior y inferior de los indices de una formación
         real :: formacion4(0:9)
         real :: formacion5(-5:5)
     end program formaciones
``` 

## Rebanadas de formaciones (_Array slicing_)
Una poderosa caracteristica del lenguaje de programación Fortran es su soporte integrado  para operaciones con formaciones (especialmente con matrices); podemos usar estas operaciones sobre una formación o una parte de una de esta (que también será una formación) usando la notación de formación rebanada:

Veamos un ejemplo más,
 
**Ejemplo (Rebanamiento de formaciones)**

```Fortran
      program rebanamiento_formaciones
        implicit none
        integer :: i

        integer :: vector1(10)
        !1D formación de 10 elementos

        integer :: matriz2(10,10)
        !D2 formación de 100 elementos


        vector1=[1,2,3,4,5,6,7,8,9,10]
        !Constructor de formaciones  
        print *,'vector1:'// achar(10) , vector1

        vector1=[(i,i=1,10)]
        !Constructor de formaciones con bucle implícito
        print *,'vector1:'
        print *, vector1

        vector1(:)=0
        !Por defecto todos los elementos igual a cero
        print *,'vector1:'// achar(10) , vector1

        vector1(1:5)=1
        !Establecer los 5 primeros elemento igual a uno
        print *,'vector1:'// achar(10) , vector1

        vector1(6:)=1
        !Establecer del sexto al ultimo elemento igual a 1
        print *,'vector1:'// achar(10) , vector1


        print *,'Indices pares de vector1:'// achar(10),vector1(1:10:2)
        !Imprimir todos los elemento con indice par

        print *,'Columna 1 de matriz2:'// achar(10),matriz2(:,1)
        !Imprimir la primera columna de la formación 2D

        print *,'vector1 en  orden invertido:'// achar(10),vector1(10:1:-1)
        !Imprimir la formación de diez elementos en orden decreciente por indice
      end program rebanamiento_formaciones
~                                                  
```

> **Nota para quien navega**: Fortran guarda las formaciones de dos dimensiones por orden de columna; solo hace falta recordar que  el primer indice varia más rápidamente.

### Asignación dinámica de formaciones (_dynamic arrays_)

Hasta ahora hemos especificado el tamaño de nuestras formaciones en el código de nuestro programa; este tipo de formación (que podría ser un vector, matriz, ~tensor?~) _estática_, ya que su tamaño es fijo cuando compilamos nuestro programa. 

Muy a menudo, no sabemos como de grande vamos a necesitar que sea una formación (pensamos en la práctica en una matriz) hasta que ejecutamos nuestro programa. Por ejemplo, si estamos leyendo  datos de un fichero de tamaño desconocido.

Para esta problemática, vamos a necesitar formaciones asignables `allocatable`, estás se _asignan_ mientras se ejecuta el programa que es cuando realmente podemos saber como de grande, en tamaño, necesitamos que sea la formación.

**Ejemplo (Asignación de formaciones diámicas)**

```Fortran
program asignable
        implicit none
        
        integer, allocatable :: vector(:)
        integer, allocatable :: matriz(:,:)
        
        allocate(vector(10))
        allocate(matriz(10,10))
        
        !Se asignan por defecto todos los 
        !elementos con ceros

        print *,'Vector: ', vector
        print *,'Matriz: ', matriz
      end program asignable
```

> **Nota para quien navega**: Las formaciones asignables locales se _desasignan_ automáticamente cuando quedan fuera de alcance (_when they go out of scope_). 

### Cadenas de caracteres (_character strings_)

Vamos a verlo directamente con un par de ejemplos:

**Ejemplo (Cadena de caracteres estática)**

```Fortran
      program cadena_de_caracteres
        implicit none
        
        character(len=8) :: nombre
        character(len=9) :: apellido
        character(len=18) :: nombre_completo
       
        nombre = 'Diogenes'
        apellido= 'De Sinope'

        !Concatenación de cadenas de caracteres 
        nombre_completo= nombre//' '//apellido

        print *, '¿ Y su nombre ?'
        print *, nombre_completo
      end program cadena_de_caracteres
```

Ahora con cadenas de caracteres de tamaño asignable
**Ejemplo (Cadena de caracteres dinámica )**

```Fortran
      program cadena_de_caracteres_asignable
        implicit none
        
        character(:), allocatable :: nombre
        character(:), allocatable :: apellido

               
        allocate(character(8) :: nombre)
        nombre='Diogenes'
        !Declaración de asignación explícita
 

        apellido='De Sinope'
        !Asignación en la asignación

        print *, nombre//' '//apellido
      end program cadena_de_caracteres_asignable 
```

