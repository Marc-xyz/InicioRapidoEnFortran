      program cadena_de_caracteres
        implicit none
        
        character(len=8) :: nombre
        character(len=9) :: apellido
        character(len=18) :: nombre_completo
       
        nombre = 'Diogenes'
        apellido= 'De Sinope'

        !Concatenación de cadenas de caracteres 
        nombre_completo= nombre//' '//apellido

        print *, '¿ Y su nombre ?'
        print *, nombre_completo
      end program cadena_de_caracteres
