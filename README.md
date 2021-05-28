```Fortran
# InicioRapidoEnFortran
Traducción de
https://fortran-lang.org/learn/quickstart
, porqué sí,
sin más,
es agradable hacerlo.
```
## Tutorial de inicio rápido en Fortran (índice)
* ⚪ Introducción
* 🟡 Hola Mundo
	- 🟨  Configuración del compilador
	- 🟨  _Hola Mundo_
* 🟠 Variables
	- 🟧 Declarar variables
	- 🟧 Estándares de entradas/salidas (_input/output_)
	- 🟧 Expresiones
	- 🟧 Precisión de punto flotante (_floats_)
* 🔴 Formaciones (_arrays_) y cadenas de caracteres (_strings_) 
	- 🟥 Declaración de formaciones (_arrays_)
	- 🟥 Rebanadas de formaciones (_Array slicing_)
	- 🟥 Asignación dinámica de formaciones (_dynamic arrays_) 
	- 🟥 Cadenas de caracteres (_character strings_)
* 🟢 Operadores y estructuras de control (_control flow_)
	- 🟩 Operadores lógicos
	- 🟩 Construcciones condicionales (`if`)
	- 🟩 Construcciones repetitivas o bucles (`do`)
	- 🟩 Bucles condicionales (`do while`)
	- 🟩 Sentencias de control de bucle (`exit` y `cycle`)
	- 🟩 Control de bucles anidados (_tags_ o etiquetas)
	- 🟩 Bucles en paralelo (`do concurrent`)
* 🔵 Organizar la estructura del código
	- 🟦 Subrutinas
	- 🟦 Funciones
	- 🟦 Módulos
* ⚫ Tipos derivados (_Derived types_)
	- ⬛ Una ojeada a los tipos de datos derivados
	- ⬛ Tipos de datos derivados, en detalle 
	- ⬛ Opciones para declarar un tipo derivado
	- ⬛ Opciones para declarar miembros de un tipo derivado (_members of a derived type_)
	- ⬛ Procedimientos ligados al tipado de datos (_Type-bound procedures_)
## ⚪ Introducción
El siguiente tutorial de inicio rápido ofrece una descripción general del lenguaje de programación Fortran, así de como su sintaxis para estructuras de programación típicas como: tipos (_types_), variables (_variables_), arreglos (~este termino es poco adecuado~) o vectores (_arrays_), flujo de control (_control flow_) y funciones (_functions_).

El contenido de este tutorial se muestra en la barra de navegación, que en un principio, quedara a su izquierda, la sección en la que se halle quedará resaltada en negrita (**Esto esta en negrita**).

Use el botón _Siguiente_, en la parte inferior (imagíneselo), para comenzar el tutorial con el típico ejemplo  _Hola Mundo_ esta vez en Fortran !

## 🟡 Hola Mundo
En esta parte del tutorial, vamos a escribir nuestro primer programa en Fortran: el omnipresente ejemplo de _Hola Mundo_.

Sin embargo antes de poder escribir (~para luego compilar y después ejecutar~) nuestro programa, debemos asegurarnos de tener configurado un compilador de Fortran.

> **Nota para quien navega**: Fortran es un lenguaje compilado, lo que quiere decir, que una vez escrito, antes de ser ejecutado por una máquina, debe ser compilado para producir un archivo que si que sea ejecutable por una máquina.

### 🟨 Configuración del compilador
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

### 🟨 _Hola Mundo_
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

## 🟠 Variables 
Las variables permiten guardar información que va a manipular o usar el programa. Fortran es un lenjuage de programación **fuertemente tipado**, lo que quiere decir, que dada cualquier variable esta debe tener un **tipo** (_type_).

Hay 5 **tipos integrados** (_built-in data types_) en Fortran (para el que el lenguaje de programación proporciona soporte integrado.)

- `integer` (enteros) - para los datos que representan números enteros, tanto positivo como negativos negativo.
- `real` (números reales) - para almacenar datos con precisión de punto flotante (_floating-point_). No para enteros.
- `complex` (números complejos) - par compuesto por una parte real y otra imaginaria.
 - `character` (carácter) - para los datos de texto.
 - `logical` (lógico) - para representar los valores booleanos, falso o verdadero.

Antes de podar usar una variable, debe ser declarada; esto le dice al compilador que tipo (_type_) de variable es, y si es el caso, otros atributos de la variable declarada.

> **Nota para quien navega**: Fortran es un **lenguaje de programación de tipo estático** (_statically typed_), lo que significa, que el tipo (_type_) de cada variable es fijo (no varia) una vez el programa es compilado. Es decir, mientras se ejecuta un programa en Fortran, una variable que se declare de un tipo (_type_), no podrá cambiarse a otro tipo  (_type_) durante el programa se este ejecutándose.
 

### 🟧 Declaración de variables
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

### 🟧  Estándares de entradas/salidas (_input/output_)

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
### 🟧 Expresiones

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
### 🟧 Precisión de punto flotante (_floats_)

La precisión de punto flotante (_floating-point precision_) deseada se puede declara de forma explicita usando el parámetro `kind`. El módulo intrínseco (_intrinsic module_) `iso_fortran_env` proporciona parámetros de tipo (_kind_) para los tipos comunes de 32 bits y 64 bits.

De nuevo, veamos un ejemplo de ello.

**Ejemplo (De tipo _kind_ explicíto  con `iso_fortran_env`)**
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

## 🔴 Formaciones (_arrays_) y cadenas de caracteres (_strings_) 

Sucede más a menudo que lo contrario, que necesitamos almacenar y operar con largas listas de números, en lugar de unas únicas pocas variables escalares o caracteres (como las que hemos visto hasta ahora). En programación informática estas listas son llamadas _arrays_, que siguiendo el trabajo de _Antonio Ramón Vaquero Sánchez( 30 de  Agosto 1938)_ no traduciremos (~nunca más como arreglos~) sino como vectores  o formaciones (de escalares, por ejemplo).

Entendemos como formaciones (_arrays_), variables _multidimensionales_, es decir, que contienen más de un valor, donde cada uno de estos resulta accesible mediante un o unos indices numerables.

|**Importante:** |
|------------------------------------------------------------------------|
| Las formaciones o vectores  (_arrays_) están indexadas comenzando por `1`, esto quiere decir,  que para acceder al primer elemento de cualquiera de sus dimensiones, vamos a usar el indice igualado a `1`.|

### 🟥 Declaración de formaciones (_arrays_)

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

### 🟥 Rebanadas de formaciones (_Array slicing_)
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
```

> **Nota para quien navega**: Fortran guarda las formaciones de dos dimensiones por orden de columna; solo hace falta recordar que  el primer indice varia más rápidamente.

### 🟥 Asignación dinámica de formaciones (_dynamic arrays_)

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

### 🟥 Cadenas de caracteres (_character strings_)

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

Ahora con cadenas de caracteres de tamaño asignable;

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
## 🟢 Operadores y estructuras de control (_control flow_)

Una de las ventajas más poderosas de los algoritmos computables, en comparación con simplemente fórmulas matemática, se puede apreciar en la estructura ramificada que presenta estos primeros. Los programas que implementan los algoritmos pueden decidir, mediante estas ramificaciones, que instrucciones ejecutar seguidamente basándose en condiciones lógicas (Por ejemplo, si se cumple `a>5` , entonces has cinco veces _tal cosa_ ).

Hay dos maneras principales de controlar el flujo de instrucciones de un programa (_program flow_) en Fortran.

* Condicionales (_Si se da A, entonces haz B_,`if`): Elegir la ruta que toma en programa (_program path_) en función de un valor booleano (es decir uno que solo puede ser _verdadero ó falso_).

* Bucle (_loop_): repite una porción de código múltiples veces.

### 🟩 Operadores lógicos

Antes de usar un operador de bifurcación lógica o condicional, necesitamos ser capaces de formar una expresión lógica que comprobar si se cumple o no.

Para formar una expresión lógica están disponibles el siguiente conjunto de operadores relacionales (_relational operators_)

| Operador | Alternativa | Descripción 						      |
|----------|-------------|----------------------------------------|
|  `==`    |   `.eq.`    | Prueba la igualdad de dos valores.     |
|  `/=`    |   `.ne.`    | Prueba la desigualdad de dos valores.  |
|  `>`     |   `.gt.`    | Prueba si el elemento a la izquierda del operador es más grande que el de la derecha del operador.|
|  `<`     |   `.lt.`    | Prueba si el elemento a la izquierda del operador es más pequeño que el de la derecha del operador.|
|  `>=`     |   `.ge.`    | Prueba si el elemento a la izquierda del operador es más grande o igual que el de la derecha del operador.|
|  `<=`     |   `.le.`    | Prueba si el elemento a la izquierda del operador es más pequeño o igual  que el de la derecha del operador.|

así como de el siguiente conjunto de operadores lógicos (_logical operators_):

| Operador | Descripción                 |
|----------|-----------------------------|
| `.and.`  | Verdadero  (`TRUE`) si los operandos de izquierda y derecha son verdaderos (`TRUE`).|
| `.or.`   | Verdadero  (`TRUE`) si o bien el operando derecho o izquierdo son o ambos son verdaderos. |
| `.not.`  | Verdadero (`TRUE`) si el operando derecho es Falso `FALSE`.|
| `.eqv.`  | Verdadero (`TRUE`) si el operando izquierdo tiene el mismo valor lógico que el operando derecho.|
| `.neqv`  | Verdadero (`TRUE`) si el operando izquierdo tiene el valor lógico opuesto al operando derecho.|

### 🟩 Construcciones condicionales (`if`)

En los siguientes ejemplos, se utiliza un constructor condicional `if` para imprimir un mensaje que describe la naturaleza de la variable `angulo`.

**Ejemplo (Ramificación única `if`)**
```Fortran
      program angulo_agudo
        implicit none
        real :: angulo
        angulo = 45.0
        if (angle < 90.0) then
          print *, 'El angulo es agudo'
        end if 
      end program
 ```
En este primer ejemplo el código contenido dentro de la estructura condicional `if` **sólo se ejecutara si** se comprueba que la variable real `angulo` tiene un valor estrictamente menor a `90.0`, es decir si la condición es Verdadera (`TRUE`).

|**Importante:** |
|------------------------------------------------------------------------|
| Es una buena practica _sangrar_ con un espacios o tabulación el código dentro de los constructores condicionales `if` y `do` para hacer más legible el código. |

Podemos agregar una rama alternativa a la estructura condicional creada añadiendo la palabra clave (_keyword_) `else`:

**Ejemplo (Dos ramificaciónes `if-else`)**
```Fortran
      program angulo_agudo_no_agudo
        implicit none
        real :: angulo
        angulo = 90.0
        if (angulo < 90.0) then
          print *, 'El angulo es agudo'
        else 
          print *, 'El angulo es obtuso o recto'
        end if 
      end program angulo_agudo_no_agudo
```

En el ejemplo anterior hay dos ramificaciones en la estructura condicional `if`, pero **solo una de las ramificaciones es ejecutada**, dependiendo claro esta, de la expresión lógica siguiente a la palabra clave `if` (mirar código del ejemplo anterior).

Aunque eso no es todo, ya que podemos agregar el número de ramificaciones que queramos usando la palabra clave `else-if` y añadir las nuevas condiciones que verificar. Veamos un ejemplo:

**Ejemplo (Múltiples ramificaciones con `if-elseif-else`)**
```Fortran
     program angulo_clasificar
        implicit none
        real :: angulo
        angulo = 190.0
        if (angulo < 90.0) then
          print *, 'El ángulo es agudo'
        else if (angulo < 180.0) then 
          print *, 'El ángulo es obtuso o recto'
        else 
          print *, 'El ángulo es cóncavo reflejo o entrante'
        end if 
        ! Podemos poner tilde 
        ! No podemos llamar una variable igual que el programa
      end program angulo_clasificar
```

### 🟩 Construcciones repetitivas o bucles (`do`)

En el siguiente ejemplo, vamos a usar la sentencia `do` para construir un bucle con el cual imprimir todos los elementos de una secuencia. El bucle creado con `do` tiene una variable entera que llamamos _contador_, esta es usada para contar en qué iteración `i`-ésima está el bucle actualmente (por ejemplo, si esta es la quita o sexta vez que se ejecuta la instrucción, eso es lo que cuenta la variable _contador_); en ejemplo vamos a usar un nombre común para la **variable contador**: `i` (_counter variable_).

Cuando definimos el inicio de un bucle `do` usamos el nombre de nuestra variable contador seguida de un signo de igualdad (`=`), para especificar el valor inicial y final para nuestra variable contador, veamos esto con el ejemplo:

**Ejemplo (Bucle con `do`)**
```Fortran
      program imprimir_secuencia
        integer :: i
        do i=1,10
            print *,i
        end do
      end program imprimir_secuencia
```

Y obtenemos: 
```terminal
          1       
          2
          3
          4
          5
          6
          7
          8
          9
         10
```

**Ejemplo (Bucle con `do` no de uno en uno)**
```Fortran
      program imprimir_secuencia_pares
        integer :: i
        do i=2,10,2
            print *,i !Imprimimos números pares
       end do
      end program imprimir_secuencia_pares
```

Y obtenemos: 
```terminal      
          2
          4
          6
          8
         10
```

### 🟩 Bucles condicionales (`do while`)

Es posible agregar un condicional a un bucle con la sentencia o palabra clave `while`. Si usamos `while` el bucle se ejecutará mientras la condición dada dentro de `while()` sea cierta, es decir, tenga valor `.true.`.

Veamos todo esto de forma explícita en un ejemplo:

**Ejemplo (Bucle con condicional `do while(i<11)`)**
```Fortran
      program bucle_condicional
        implicit none
        integer :: i
        i=1 
        do while (i<11)
           print *, i
           i=i+1
        end do
        print *,i ! Aquí _i_ vale 11
      end program bucle_condicional
```
### 🟩 Sentencias de control de bucle (`exit` y `cycle`)

La mayoría de veces, los bucles se deberían detener  si se cumple alguna condición. Fortran proporciona dos tipos de sentencias ejecutables para tal propósito.

Usamos `exit` para salir de un bucle _antes de tiempo_, por lo general, este se encuentra anidado dentro de un condicional construido con la palabra clave `if`.

**Ejemplo (Bucle con salida prematura, `exit`)**
```Fortran
      program salida_de_un_bucle
        implicit none
        integer :: i
        do i=1, 100 
          if (i>20) then
            exit !Para de imprimir números por favor 
          end if 
          print *,i 
        end do
        print *,i ! Aquí _i_ vale 21
      end program salida_de_un_bucle
```
Pero esto no es todo, si únicamente queremos saltar alguna de las iteraciones del bucle pero no finalizar este podemos usar la palabra clave `cycle`, para omitir algunas iteraciones si se cumple una condición. Veamos, también, un ejemplo de esto:

**Ejemplo (Bucle con salida de iteraciones, `cycle`)**
```Fortran
      program salida_de_unas_iteraciones
        implicit none
        integer :: i
        do i=1,10 
          if (mod(i,2)==1) then
            cycle ! No imprimas los números impares
          end if 
          print *,i 
        end do
        print *,i ! Aquí _i_ vale 11
      end program salida_de_unas_iteraciones
``` 

> **Nota para quien navega**: Cuando usamos bucles anidados, la palabras claves `cycle` y `exit` o sentencias actuan **sobre el bucle más interno**.

### 🟩 Control de bucles anidados (_tags_ o etiquetas)

Una duda recurrente en cualquier lenguaje de programación es hasta donde podemos usar bucles anidados ¿Dónde paramos? Cuando hablamos de **bucles anidados** nos referimos a bucles que existen dentro de bucles. Fortran permite a quien programa usar **etiquetas** o  **nombrar** (_tags_ o _names_) cada bucle. Si los bucles están etiquetados, se derivan de ello dos beneficios potenciales destacables:

1. La **legibilidad** del código aumenta (cuando la notación o nomenclatura es pedagógica, ~pensamos en nombres descriptivos, por ejemplo: `bucle_exterior`~ ).
2. `exit` y `cycle` pueden ser usadas con etiquetas (_tag_), lo cual conlleva una refinación o un control muy detallado de los bucles (_loop_).

Veamos un ejemplo de bucle con etiquetas;

**Ejemplo (Bucles anidados con etiquetas o _tag_ s)**
```Fortran
      program bucles_anidados_con_etiquetas
        implicit none !Resistan la tentación. Ya son enteros 
        integer :: i,j 
        
        bucle_exterior: do i=1,10 
          bucle_interior: do j=1,10
            
            if ((j+i)<10) then 
            !Imprimir solo elementos (i,j), tales que i+j>10.
                   cycle bucle_exterior
               !Ves a la siguiente iteración del bucle_exterior 
            end if 

            print *, 'I=', i, 'J=', j, 'SUM=', j+i
          end do bucle_interior
        end do bucle_exterior
      end program bucles_anidados_con_etiquetas
```

### 🟩 Bucles en paralelo (`do concurrent`)

Los bucles `do concurrent` tienen una gran utilidad para especificar explícitamente que el interior del bucle no tiene interdependencias; esto resulta útil ya que informa al compilador de la posibilidad de usar paralelización/ _SIMD_ para ejecutar más rápido el bucle, así como dejar constancia de ello por parte de quien programa el código. Más especifícamente, esto significa que cualquier iteración del bucle no depende de la ejecucción previa decualquiera de las otras iteraciones del bucle `do concurrent`. También es necesario que cualquier cambio de estado (_state changes_)  que pudiera ocurrir, únicamente deba suceder dentro de la propia iteración dada sin afectar a las demás. Estos requisitos, ya de por si imponen el tipo de instrucciones que pueden ser colocadas dentro del cuerpo de un bucle `do concurrent`.

|**Importante:** |
|------------------------------------------------------------------------|
| La instrucción `do concurrent` no es una instrucción básica de Fortran. Además la explicación dada anteriormente no da todos los requisitos que deben ser satisfechas para escribir un bucle `do concurrent` correcto. Los compiladores también son libres de codificar las instrucciones a código maquina como les parezca, cosa que puede llevar a una posible no optimización del bucle`do concurrent`.|

En fin demos un ejemplo pues;

**Ejemplo (Bucle `do concurrent()`)**
```Fortran
      program bucle_simultaneo
        implicit none 
        real, parameter :: pi =3.14159265
        integer, parameter :: n=10
        real :: resultado_sin(n)
        integer :: i
        do  concurrent (i=1:n) !Cuidado la sintaxis es ligeramente diferente
          resultado_sin(i)=sin(i*pi/4.)
        end do
        print *, resultado_sin
      end program bucle_simultaneo
```


## 🔵 Organizar la estructura del código

La mayoría de lenguajes de programación le permiten recopilar código usado frecuentemente en procedimientos (_procedures_) que se puede reutilizar llamándolos (_calling_) desde otras secciones del código.

Fortran presenta dos maneras de hacer esto:

* **Subrutinas**: invocadas mediante la sentencia `call`.
* **Funciones**: invocadas dentro de una expresión o asignación a la que devuelve un valor.

Tanto las subrutinas como las funciones tienen acceso a las variables en el ámbito principal por asociación de argumentos (_argument association_); a menos que se especifique el atributo `VALUE`, esto es similar a llamar por referencia (_call by reference_).

 
### 🟦 Subrutinas
Los argumentos de entrada de la subrutina, conocidos como argumentos ficticios (_dummy arguments_), se especifican entre paréntesis después del nombre de la subrutina; los tipos y atributos de argumentos ficticios se declaran dentro del cuerpo de la subrutina al igual que las variables locales.

**Ejemplo (Subrutina para imprimir una matriz)**
```Fortran
     ! Subrutina usada en el programa principal líneas de la 11 a la 22
      subroutine subrutina_imprimir_matriz(numero_filas,numero_columnas,matriz)
        implicit none 
        integer, intent(in) :: numero_filas
        integer, intent(in) :: numero_columnas
        real, intent(in) :: matriz(numero_filas,numero_columnas)

        integer :: i
        do i=1,numero_filas
            print *,matriz(i,1:numero_columnas)
        end do
      end subroutine subrutina_imprimir_matriz  
```

Nótese que la sentencia adicional en `intent` cuando declaramos las variables ficticias (_dummy arguments_); esta sentencia o atributo opcional es interpretado por el compilador para explicitar cuando el argumento es: de **solo lectura** (_ready-only_,`intent(in)`), de **solo escritura** (_write-only_, `intent(out)`), o de **lectura y escritura** (_read-write_,`intent(inout)`); dentro de la subrutina. En este ejemplo, la subrutina no modifica sus argumentos, por tanto, todos los argumentos son de _ready-only_, y usamos `(in)` dento de la sentencia `intent`.
|**Consejo:** |
|------------------------------------------------------------------------|
| Es una buena práctica especificar siempre el atributo `intent` para los argumentos ficticios (_dummy argumentos_); esto permite al compilador comprobar si hay errores sintácticos en el código y proporciona una auto-documentación (_self-documentation_).|

Podemos llamar a la subrutina del ejemplo anterior usando la sentencia `call`.

**Ejemplo (Llamando una subrutina con `call`)**
```Fortran
     !Programa principal líneas de la 1 a la 8
      program llamar_subrutina
        implicit none 
        real :: matriz(10,20)
        !Inicializar en cero todos los valores
        matriz(:,:) = 0.0
        call subrutina_imprimir_matriz(10,20,matriz)
      end program llamar_subrutina
```

> **Nota para quien navega**: El anterior ejemplo hace uso de un argumento de matriz (un tipo de formación) de forma explicita (_so-called explicit-shape array_) ya que hemos pasado variables adicionales para describir las dimensiones de la formación de números reales de 2 dimensiones; esto no será necesario si colocamos nuestra subrutina dentro de un módulo, como describiremos más adelante.

### 🟦 Funciones

**Ejemplo (Nuestra primera función en Fortran)**
```Fortran
      !Función usada en el programa principal de las líneas 11 a 18       
      function norma_del_vector(longitud_del_vector,nombre_del_vector) result(valor_norma)
        implicit none
        integer, intent(in) :: longitud_del_vector
        real, intent(in) :: nombre_del_vector(longitud_del_vector)
        real :: valor_norma
        valor_norma= sqrt(sum(nombre_del_vector**2))
      end function norma_del_vector
```
|**Consejo:** |
|------------------------------------------------------------------------|
|En la creación de código en Fortran la función de norma de un vector ya esta implementada de la mejor forma mediante `norm2`, por tanto no hará falta reescribirla en futuros códigos. ( ~No se desanime no ha perdido el tiempo, usted ha aprendido y además ahora conoce un atajo para su trabajo~ ).| 

Para ejecutar la anterior función podríamos usar el siguiente programa:

**Ejemplo (Llamando a una función)**
```Fortran
!Programa principal líneas de la 1 a la 9
      program llamar_funcion
        implicit none 
        real :: un_vector(9)
        real :: norma_del_vector
        !Inicializar en 9 todas las componentes del vector
        un_vector(:)=9
        print *, 'Norma del vector= ',norma_del_vector(9,un_vector)
      end program llamar_funcion
```

|**Consejo:** |
|------------------------------------------------------------------------|
| Es una buena práctica de programación el crear funciones que no modifiquen sus argumentos, es decir, todos los argumentos que reciban las funciones deberían ser de solo lectura (_read-only_, `intent(in)`), tales funciones se conocen como **funciones puras** (`pure` _functions_). Utilice subrutinas (_subroutines_) si su procedimiento necesita modificar argumentos.|

### 🟦 Módulos
Los módulos de Fortran contienen definiciones accesibles a programas (_programs_), procedimientos (_procedures_) y otros módulos (_modules_) a través de la sentencia `use`. Pueden contener objetos de datos (_data objects_), definiciones de tipos (_type definitions_), procedimientos (_procedures_) y interfaces (_interfaces_).
* Los módulos permiten la determinación del alcance de extensión por donde el _ente_ hace el acceso hace explicito.
* Los módulos generan automáticamente las interfaces explícitas necesarias para los procedimientos modernos.

|**Consejo:** |
|------------------------------------------------------------------------|
|Se recomienda colocar siempre funciones y subrutinas dentro de los módulos.|

Vamos un ejemplo de módulo en Fortran:

**Ejemplo (Nuestra primer módulo en Fortran)**
```Fortran
       module mi_primer_modulo
        implicit none 
        
        !private variable_privada !Todas las entradas son module-private por defecto
        public variable_publica, imprimir_matriz_A !Explicitamos exportar las entradas como públicas

        real, parameter :: variable_publica=2
        integer :: variable_privada

        contains
            !Imprimir la matriz A por pantalla
            subroutine imprimir_matriz_A(A)
                real, intent(in) :: A(:,:) ! Un argumento ficticio 
                
                integer :: i
                do i=1,size(A,1)
                    print *,A(i,:)
                end do
            end subroutine imprimir_matriz_A
      end module mi_primer_modulo 
```

> **Nota para quien navega**: Si comparamos esta subrutina (la que esta incluida dentro del modulo justo en el ejemplo anterior) para imprimir matrices, con la función de subapartado anterior que hacia a la práctica lo mismo (imprimir una matriz dada por pantalla ), vemos que ya no necesitamos pasar las dimensiones de la matriz (formación de dos dimensiones) y en su lugar podemos aprovechar que estos argumentos se están asumiendo (_assumed-shape arguments_), esto sucede ya que el módulo generará una interfaz explicita (_explicit iterface_). Esto da como resultado una interfaz de subrutina mucho más simple.

Para usar un módulo en un programa podemos proceder tal como ilustra el siguiente ejemplo:

**Ejemplo (Llamando a un módulo con `use`)**
```Fortran
      program llamar_modulo
        use mi_primer_modulo
        implicit none 

        real :: matriz(10,10)
        matriz(:,:)=variable_publica
        call imprimir_matriz_A(matriz)
      end program llamar_modulo
```

**Ejemplo (Importar lista explicita)**
```Fortran
      use mi_primer_modulo, only: variable_publica
```

**Ejemplo (Importar con un mote o alias)**
```Fortran
    use mi_primer_modulo, only: imprimirMatriz=>imprimir_matriz_A
```
> **Nota para quien navega**: Cada módulo debe ser escrito en un archivo de código fuente terminado en `.f90` independiente. Los módulos deben compilarse antes que cualquier unidad de programa (_any program units_) los pueda `use`ar.

## ⚫ Tipos derivados (_Derived types_)
Tal como vimos en la segunda sección `## Variables`, en Fortran, hay cinco **tipos de datos integrados** (_built-in data_). En esencia, cuando nos referimos a tipos de datos derivados, o simplemente tipos derivados, nos referimos a una forma especial de datos que pueden encaplsular datos integrados o otros datos derivados a su vez. Podríamos considerar a estos tipos de datos como el equivalente generado por la instrucción `struct` en los lenguajes de programación `C` y `C++`.  

### ⬛ Una ojeada a los tipos de datos derivados
Comencemos por un ejemplo básico de tipo derivado

**Ejemplo (Tipo de dato derivado)**
```Fortran
      type :: tipo_pareja
         integer :: i
         real :: x
      end type
```
La sintaxis para crear una variable de tipo `tipo_pareja` y acceder a sus miembros es:

**Ejemplo (Declarar y inicializar un tipo derivado)**
```Fortran
      !Declarar
      type(tipo_pareja) :: pareja
      
      !Inicializar
      pareja%i = 1
      pareja%x = 0.5
```
> **Nota para quien navega**: El símbolo de porcentaje `%` es usado para acceder a cada uno de los miembros del tipo derivado.

En el fragmento de código, declaramos y inicializamos un tipo derivado con miembros (del tipo derivado) dados de forma explicita. Aunque también podemos inicializar miembros de un tipo derivado invocando (_invoking_) al constructor del tipo derivado, sin especificar sus miembros.

Veamos un ejemplo de uso de un constructor (_constructor_) para tipos derivados:

**Ejemplo (Dos manera de inicializar con constructor)**
```Fortran
      ! Inicializar con argumentos posicionales
      pareja = tipo_pareja(1,0.5)
      
      ! Inicializar con argumentos "de palabra clave"
      pareja = tipo_pareja(i=1,x=0.5)

      ! Inicializar con palabras clave permite cualquier orden
      pareja = tipo_pareja(x=0.5,i=1)
``` 

**Ejemplo (Tipo derivado con inicialización por defecto)**
```Fortran
     program mi_primer_tipo_derivado
        type :: tipo_pareja
            integer :: i = 1
            real    :: x = 0.5
        end type
        
        type(tipo_pareja) :: pareja
        
        ! pareja%i es 1, pareja%x es 0.5
        pareja = tipo_pareja() 
        print *, '(i= ',pareja%i, 'x= ',pareja%x, ')'
        
        ! pareja%i es 2, pareja%x es 0.5
        pareja = tipo_pareja(i=2)
        print *, pareja

        ! pareja%i es 1, pareja%x es 2.7
        pareja = tipo_pareja(x=2.7)
        print *, '(i= ',pareja%i, 'x= ',pareja%x, ')'
      end program mi_primer_tipo_derivado

!Salida del programa, observamos un valor curioso en el último valor
! (i=            1 x=   0.500000000     )                                                                                                              
!           2  0.500000000                                                                                                                             
! (i=            1 x=    2.70000005     ) 
```
### ⬛ Tipos de datos derivados, en detalle 
La sintaxis completa de un tipo derivado con todas las propiedades opcionales se presenta a continuación:

**Ejemplo (Pseudocódigo en detalle de los tipos derivados)**
```Fortran
     type [,lista-de-atributos] :: nombre_del_tipo_derivado [lista-de-declaraciones-parametrizadas]
          [sentencias-de-deficnición-parametrizadas]
          [private declaraciones-privadas o sequence declaraciones-sequenciales]
          [variables-o-miembros-del-tipo-derivado]
          contains
                [procedimientos-vinculados-al-type]
    end type
```

### ⬛ Opciones para declarar un tipo derivado
`lista-de-atributos` se refiere a lo siguiente:

* El tipo de acceso al tipo (_access-type_) puede ser público (`public`) o privado (`private`).
* `bind(c)` ofrece intolerabilidad con el lenguaje de programación **C**.
* `extends(` "padre" `)` donde "padre" (_parent_) es el nombre de un tipo derivado previamente declarado, del cual, el tipo derivado actual heredará todos sus miembros y funcionalidad.
* `abstract` una característica orientada a objetos que se cubre en el tutorial de programación avanzada.

> **Nota para quien navega**: Si el atributo `attribute: bind(c)` o la sentencia `statement: sequence` son usadas en un tipo derivado no podremos usar los atributos `attribute: extends` y viceversa.

El atributo `sequence` sólo puede ser usado para declarar que se debe acceder a los siguientes miembros (del tipo) en el mismo orden en que están definidos dentro del tipo derivado.

**Ejemplo (Tipo derivado con sentencia `sequence`)**
```Fortran
      program usando_sequence
        type :: tipo_pareja
            sequence
            integer :: i
            real :: x
        end type
        
        !Inicializamos 
        type(tipo_pareja) :: pareja
        pareja = tipo_pareja(1,0.5)
        print *, pareja
      end program usando_sequence
```
> **Nota para quien navega**: El uso de la sentencia `sequence` presupone que los tipos de datos definidos a continuación no son asignables (`allocatable`) ni de tipo puntero (`pointer`). Además, cabe destacar, que este tipo de datos **no implica**  que este tipos de datos se almacenen de una forma particular, no hay relación con el atributo `contiguous`.

El uso de los atributos de tipos de acceso (_access-type_) `public` y `private` , si se usan, declaran que todas las _[variables-miembro]_ se les asignará automáticamente el atributo en consecuencia.

El atributo `bind(c)` es usado para lograr la compatibilidad entre los tipos derivado de Fortran y las estructuras de _C_.

Veamos un ejemplo con `bind(c)`

**Ejemplo (Tipo derivado con sentencia `bind(c)`)**
```Fortran
     module fortran_a_c
        use iso_c_bindings, only: c_int
        implicit none
        type, bind(c) :: tipo_fortran
            integer(c_int) :: i
        end type
     end module fortran_a_c
```
 
,que coincide con la siguiente estructura en _C_ siguiente:

**Ejemplo (Tipo derivado en sintaxis en lenguaje de programación C  )**
```C
struct{
	int i
}c_struct;
```

> **Nota para quien navega**: Un tipo derivado en Fortran con el atributo `bind(c)` no pueden tener los atributos `sequence` o `extends`. Además, **no** puede contener ningún puntero (`pointer`) o tipo asignable (`allocatable`) de Fortran.

`lista-de-declaración-parametrizada`: es una característica opcional. Aunque, si se utiliza, los parámetros deben aparecer en lugar de `[sentencia-de-definición-parametrizada]` y deben ser o bien parámetros `len` o `kind`; o bien ambos.

Vamos a ver un tipo derivado con `lista-declaración-parametrizada` y con el atributo `public`:

**Ejemplo (Tipo derivado con sentencia `bind(c)`)**
```Fortran
      module m_matriz
        implicit none
        private

        type, public :: tipo_matriz(filas, columnas, k)
            integer, len :: filas, columnas
            integer, kind :: k = kind(0.0)
            real(kind=k), dimension(filas,columnas) :: valores
        end type
      end module m_matriz

      program testear_matriz
        use m_matriz
        implicit none
        type(tipo_matriz(filas=5,columnas=5)) :: m
        print *,m      
      end program testear_matriz
```

> **Nota para quien navega**: En este ejemplo, el parámetro `k` ya se le ha asignado un valor por defecto con `kind(0.0)`, es decir, de precisión simple de punto flotante. Por lo tanto, se puede omitir, como es el caso aquí en la declaración dentro del programa principal (que en este caso es `testear_matriz`).

|**Importante:** |
|------------------------------------------------------------------------|
|De forma predeterminada, los tipos derivados y sus miembros son de acceso público (`public`). Sin embargo, en este ejemplo, el atributo `private` se usa al comienzo del módulo, por lo tanto, todo dentro del módulo será privado por defecto, a menos que, explícitamente, que se declare con `public` de forma especifica alguno. Si el tipo **matriz**  no se le dio el atributo público (`public`) en el ejemplo anterior, entonces el compilador arrojaría un error dentro del programa `testear_matriz`. |

El atributo `extends` se agregó en el estándar _F2003_ e introduce una característica importante del paradigma de programación orientada a objetos (_OOP_, _object orientate paradigm_), **la herencia**. Permite la reutilización del código al permitir que los tipos derivados de los _hijos_ (_children_)  como este: ` type, extends(padre) :: hijo` recuperen todos los miembros y funcionalidades de un tipo derivado de los _padres_: `type :: padre`.

Vamos a ver un ejemplo con el atributo `extends`:

**Ejemplo (Tipo derivado con `extends`)**
```Fortran
      module modulo_empleados
        implicit none 
        private
        public tipo_fecha, tipo_direccion, tipo_persona, tipo_empleado
        ! Nota que así podemos declara todo un conjunto de datos 
        ! como publicos 

        !Tipo fecha 
        type :: tipo_fecha 
            integer                       :: anyo, mes, dia 
        end type

        !Tipo direccion
        type :: tipo_direccion
            character(len=:), allocatable :: ciudad, nombre_calle
            integer                       :: numero_de_la_casa
        end type

        !Tipo hijo "persona" del padre "direccion"
        type, extends(tipo_direccion) :: tipo_persona
            character(len=:), allocatable :: nombre, apellido, e_mail
        end type

        !Tipo hijo "empleado" del padre "persona"
        type, extends(tipo_persona) :: tipo_empleado
            type(tipo_fecha)              :: fecha_contratacion
            character(len=:), allocatable :: puesto_empresa
            real                          :: salario_mensual
        end type
      end module modulo_empleados


      program  testear_empleados
        use modulo_empleados
        implicit none 
        type(tipo_empleado) :: empleado
        
        !Inicializamos 
        empleado%fecha_contratacion%anyo =2021 
        ! tipo_empleado tiene acceso a miembros del tipo_fecha 
        ! no porque sea una extensión sino porque se declaro un
        ! tipo_fecha dentro de tipo_empleado.
        empleado%fecha_contratacion%mes = 5
        empleado%fecha_contratacion%dia = 28
        empleado%nombre= "Numerius"
        ! tipo_empleado tiene acceso a miembros del tipo_persona
        ! y por ello hereda sus miembros debido a "extends".
        empleado%apellido = "Negidius"
        empleado%ciudad = "Girona"
        ! tipo_empleado tiene acceso a tipo_direccion ya que
        ! porque hereda de tipo_persona que a su vez lo hereda
        ! del tipo_direccion.
        empleado%nombre_calle= 'Carrer Major'
        empleado%numero_de_la_casa= 121
        empleado%puesto_empresa= 'Interno'
        empleado%salario_mensual= 0.0
        print *, empleado%nombre 
      end program testear_empleados

``` 

###  ⬛ Opciones para declarar miembros de un tipo derivado (_members of a derived type_)

`[variables-miembro]` se refiere a la declaración de todos los miembros de un tipo de dato. Estos tipos de datos pueden ser de cualquier tipo de datos integrado y/o de otros tipos derivados, como ya hemos visto en los ejemplos anteriores. Sin embargo, las variables miembro pueden tener su propia sintaxis extensa, en forma de: `type [, atributos-miembro] :: nombre[especificación-dependiente-del-atributo][init]`.

`type:` calquier tipo integrado (_bullit-in type_).

`variables-miembro` (opcionales):
* Atributos de acceso `public` o `private`.
* `protected` que también es un atributo de acceso.
* `allocatable` con o sin `dimension` para especificar una formación dinámica (_dynamic array_)
* puntero (`pointer`), codimensión (`codimension`), contiguo (`contiguous`),  volátil (`volatile`), asincrónico (`asynchronous`).

Veamos un ejemplo de casos comunes:

**Ejemplo (Tipo derivado con `extends`)**:
```Fortran
      module usando_protected_y_mas
        type :: tipo_ejemplo

            !1r_caso: tipo integrado simple con atributo 
            !de acceso e [init]
            integer, private :: i = 0 
            !"private" lo oculta del uso fuera del alcance
            ! de tipo_ejemplo
            ! La inicialización predeterminada "[=0]" es la
            ! parte "[init]".
         

            !2n_caso: "protected"
           !!integer, protected :: i
            ! A diferencia de "private", "protected" permite 
            ! el acceso al valor asignado de "i" fuera de
            ! tipo_ejemplo pero no es definible, es decir,
            ! se puede asignar un valor a "i" solo dentro de 
            ! tipo_ejemplo


            !3r_caso id de una formación dinámica 
            real, allocatable, dimension(:) :: x
            ! lo mismo con
           !!real, allocatable :: x(:)
            ! El paréntesis implica "dimension(:)" y es uno de los 
            ! posibles "[especificaciones-dependientes del atributo]"
        end type
      end module usando_protected_y_mas
     
      program testear_usando_protected_y_mas
        use usando_protected_y_mas
        type(tipo_ejemplo) :: ejemplo1
        print *, 'x=' , ejemplo1%x
        !print *, 'i=' , ejemplo1%i
      end program testear_usando_protected_y_mas            
```

> **Nota para quien navega**: Los siguientes atributos: puntero (`pointer`), codimensión (`codimension`), contiguo (`contguous`), volátil (`volatile`), asíncrono (`asynchronous`) son funciones avanzadas que no se abordarán en el tutorial de inicio rápido. Sin embargo, se comenta de su existencia aquí para que quien lo lea  sepan que estas características existen y puedan reconocerlas. Estas características se tratarán en detalle en el próximo _mini-libro_ de programación avanzada.


### ⬛ Procedimientos ligados al tipado de datos (_Type-bound procedures_)
Un tipo derivado puede contener funciones o subrutinas vinculadas a él. Nos referiremos a ellos como procedimientos ligados a tipos (_type-bound procedures_). Los procedimientos de tipado  siguen la sentencia `contains`  que, a su vez, sigue todas las declaraciones de variables miembro.

> **Nota para quien navega**: Es imposible describir en su totalidadlos _type-bound procedures_ sin profundizar en las características dinherentes ligadas a la programación orientada a objetos (_OOP_) del Fortran moderno. Por el momento nos vamos a limitar a un ejemplo sencillo para mostrar su uso de forma básica.

A continuación un ejemplo de un procedimiento ligado al tipo (_type-bound procedure_):

**Ejemplo (Tipo derivado con `procedure` y `contains`; con función)**
```Fortran
      module modulo_formas
        implicit none 
        private
        public tipo_cuadrado

        
        type :: tipo_cuadrado
            real :: lado
            contains 
                procedure :: area !Declaración de procedimiento
        end type


        contains
        !Definición del procedimiento
        real function area(el_mismo) result(resultado)
            class(tipo_cuadrado), intent(in) :: el_mismo
            resultado=el_mismo%lado**2
        end function
      end module modulo_formas


      program principal ! "principal" .eq. "main"
        use modulo_formas
        implicit none
        
        !Declaración de variables
        type(tipo_cuadrado) :: cuadradito
        real :: x, lado

        !Inicializando variables
        lado = 0.5
        cuadradito%lado = lado
        x =cuadradito%area()
        ! el "el_mismo" no aparece aquí, esto sucede ya que es 
        ! pasado de forma implícita 
        print *, "x=" , x
      end program principal

      !x=  0.250000000 

```
¿Y qué es nuevo?

* `el_mismo` es un nombre arbitrario que elegimos para representar la instancia del tipo derivado `tipo_cuadrado` dentro de la función con `procedure`. Esto nos permite acceder a sus miembros y pasarlos automáticamente como argumentos cuando invocamos un procedimiento de tipo enlazado (_type-bound procedure_).

* Ahora usamos la `class(tipo_cuadrado)` en la interfaz (_interface_) de la función `area()`. Esto nos permite invocar o llamar a la función `area()` con cualquier tipo derivado que extienda  `tipo_cuadrado`. La palabra clave (_keyword_) `class` intoduce las características de POO (Paradigma/ Programación Orientada a Objetos, o _Object-oriented programming_), como los polimorfismos.

En el ejemplo anterior, el tipo de procedimiento (_type-bound procedure_) `area` enlazado a tipo se define como una función y solo puedeinvocar en una expresión, por ejemplo `x =cuadradito%area()` o bien `print *, cuadradito%area()`. Si definimos en vez de una función como una subrutina, entonces, puede invocar a `area` mediante la sentencia `call`.

Veamos esto:
**Ejemplo (Tipo derivado con `procedure` y `contains`; con subrutina)**
```Fortran
      module modulo_formas
        implicit none 
        private
        public tipo_cuadrado

        
        type :: tipo_cuadrado
            real :: lado
            contains 
                procedure :: area !Declaración de procedimiento
        end type

       !!Aquí añadimos nuestra modificación 
        contains
            subroutine area(el_mismo,x)
            class(tipo_cuadrado), intent(in) :: el_mismo
            real,                 intent(out) :: x
            x=el_mismo%lado**2
            end subroutine
      end module modulo_formas


      program principal ! "principal" .eq. "main"
        use modulo_formas
        implicit none
        
        !Declaración de variables
        type(tipo_cuadrado) :: cuadradito
        real :: x, lado

        !Inicializando variables
        lado = 0.5
        cuadradito%lado = lado
        call cuadradito%area(x)
        ! el "el_mismo" no aparece aquí, esto sucede ya que es 
        ! pasado de forma implícita 
        print *, "x=" , x
      end program principal

      !x=  0.250000000 
```

En contraste con el ejemplo que usaba el formato función (`function`) ahora con la implementación mediante una subrutina tenemos dos argumentos:

* `class(tipo_cuadrado), intent(in) :: el_mismo`, que es la instancia del tipo derivado en sí.

* `real, intent(out) :: x` , que se utiliza para almacenar el área calculada y volver su valor al hacer la llamada.


