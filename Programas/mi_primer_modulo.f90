      module mi_primer_modulo
        implicit none 
        
        !private variable_privada !Todas las entradas son module-private por defecto
        public variable_publica, imprimir_matriz_A !Explicitamos exportar las entradas como públicas

        real, parameter :: variable_publica=2
        integer :: variable_privada

        contains
            !Imprimir la matriz A por pantalla
            subroutine imprimir_matriz_A(A)
                real, intent(in) :: A(:,:) ! Un argumento ficticio 
                
                integer :: i
                do i=1,size(A,1)
                    print *,A(i,:)
                end do
            end subroutine imprimir_matriz_A
      end module mi_primer_modulo 
