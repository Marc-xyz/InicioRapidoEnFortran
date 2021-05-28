      program mi_primer_tipo_derivado
        type :: tipo_pareja
            integer :: i = 1
            real    :: x = 0.5
        end type
        
        type(tipo_pareja) :: pareja
        
        ! pareja%i es 1, pareja%x es 0.5
        pareja = tipo_pareja() 
        print *, '(i= ',pareja%i, 'x= ',pareja%x, ')'
        
        ! pareja%i es 2, pareja%x es 0.5
        pareja = tipo_pareja(i=2)
        print *, pareja

        ! pareja%i es 1, pareja%x es 2.7
        pareja = tipo_pareja(x=2.7)
        print *, '(i= ',pareja%i, 'x= ',pareja%x, ')'
      end program mi_primer_tipo_derivado

!Salida del programa, observamos un valor curioso en el último valor
! (i=            1 x=   0.500000000     )                                                                                                              
!           2  0.500000000                                                                                                                             
! (i=            1 x=    2.70000005     ) 
