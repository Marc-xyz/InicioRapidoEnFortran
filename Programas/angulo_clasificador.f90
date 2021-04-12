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
