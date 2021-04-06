      program cadena_de_caracteres_asignable
        implicit none
        
        character(:), allocatable :: nombre
        character(:), allocatable :: apellido

               
        allocate(character(8) :: nombre)
        nombre='Diogenes'
        !Declaración de asignación explícita
 

        apellido='De Sinope'
        !Asignación en la asignación

        print *, nombre//' '//apellido
      end program cadena_de_caracteres_asignable

        
