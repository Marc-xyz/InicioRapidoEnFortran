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
