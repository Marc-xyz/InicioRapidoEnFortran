      !Programa principal líneas de la 1 a la 8
      program llamar_subrutina
        implicit none 
        real :: matriz(10,20)
        !Inicializar en cero todos los valores
        matriz(:,:) = 0.0
        call subrutina_imprimir_matriz(10,20,matriz)
      end program llamar_subrutina
      

      ! Subrutina usada en el programa principal líneas de la 11 a la 22
      subroutine subrutina_imprimir_matriz(numero_filas,numero_columnas,matriz)
        implicit none 
        integer, intent(in) :: numero_filas
        integer, intent(in) :: numero_columnas
        real, intent(in) :: matriz(numero_filas,numero_columnas)

        integer :: i
        do i=1,numero_filas
            print *,matriz(i,1:numero_columnas)
        end do
      end subroutine subrutina_imprimir_matriz  
