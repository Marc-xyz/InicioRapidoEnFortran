      program usando_sequence
        type :: tipo_pareja
            sequence
            integer :: i
            real :: x
        end type
        
        !Inicializamos 
        type(tipo_pareja) :: pareja
        pareja = tipo_pareja(1,0.5)
        print *, pareja
      end program usando_sequence
