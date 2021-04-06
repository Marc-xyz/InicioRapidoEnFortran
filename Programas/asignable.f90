      program asignable
        implicit none
        
        integer, allocatable :: vector(:)
        integer, allocatable :: matriz(:,:)
        
        allocate(vector(10))
        allocate(matriz(10,10))
        
        !Se asignan por defecto todos los 
        !elementos con ceros

        print *,'Vector: ', vector
        print *,'Matriz: ', matriz
      end program asignable
