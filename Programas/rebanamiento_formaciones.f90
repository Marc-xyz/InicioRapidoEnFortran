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
