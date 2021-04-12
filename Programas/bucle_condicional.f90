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
