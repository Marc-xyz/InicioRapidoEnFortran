      module m_matriz
        implicit none
        private

        type, public :: tipo_matriz(filas, columnas, k)
            integer, len :: filas, columnas
            integer, kind :: k = kind(0.0)
            real(kind=k), dimension(filas,columnas) :: valores
        end type
      end module m_matriz

      program testear_matriz
        use m_matriz
        implicit none
        type(tipo_matriz(filas=5,columnas=5)) :: m
        print *,m      
      end program testear_matriz
