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
