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
