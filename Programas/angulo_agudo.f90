      program angulo_agudo
        implicit none
        real :: angulo
        angulo = 45.0
        if (angulo < 90.0) then
          print *, 'El angulo es agudo'
        end if 
      end program
