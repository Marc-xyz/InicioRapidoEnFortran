      module modulo_formas
        implicit none 
        private
        public tipo_cuadrado

        
        type :: tipo_cuadrado
            real :: lado
            contains 
                procedure :: area !Declaración de procedimiento
        end type

       !!Aquí añadimos nuestra modificación 
        contains
            subroutine area(el_mismo,x)
            class(tipo_cuadrado), intent(in) :: el_mismo
            real,                 intent(out) :: x
            x=el_mismo%lado**2
            end subroutine
      end module modulo_formas


      program principal ! "principal" .eq. "main"
        use modulo_formas
        implicit none
        
        !Declaración de variables
        type(tipo_cuadrado) :: cuadradito
        real :: x, lado

        !Inicializando variables
        lado = 0.5
        cuadradito%lado = lado
        call cuadradito%area(x)
        ! el "el_mismo" no aparece aquí, esto sucede ya que es 
        ! pasado de forma implícita 
        print *, "x=" , x
      end program principal

      !x=  0.250000000 
