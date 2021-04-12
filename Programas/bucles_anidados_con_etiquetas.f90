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

