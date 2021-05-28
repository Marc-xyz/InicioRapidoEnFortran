     !Programa principal líneas de la 1 a la 9
      program llamar_funcion
        implicit none 
        real :: un_vector(9)
        real :: norma_del_vector
        !Inicializar en 9 todas las componentes del vector
        un_vector(:)=9
        print *, 'Norma del vector= ',norma_del_vector(9,un_vector)
      end program llamar_funcion
   
      !Función usada en el programa principal de las líneas 11 a 18       
      function norma_del_vector(longitud_del_vector,nombre_del_vector) result(valor_norma)
        implicit none
        integer, intent(in) :: longitud_del_vector
        real, intent(in) :: nombre_del_vector(longitud_del_vector)
        real :: valor_norma
        valor_norma= sqrt(sum(nombre_del_vector**2))
      end function norma_del_vector
