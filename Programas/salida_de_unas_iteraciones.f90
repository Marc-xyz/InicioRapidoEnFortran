      program salida_de_unas_iteraciones
        implicit none
        integer :: i
        do i=1,10 
          if (mod(i,2)==1) then
            cycle ! No imprimas los números impares
          end if 
          print *,i 
        end do
        print *,i, "(Este no es par)" ! Aquí _i_ vale 11
      end program salida_de_unas_iteraciones
