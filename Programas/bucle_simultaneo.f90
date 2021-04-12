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
