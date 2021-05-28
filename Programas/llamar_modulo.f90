      program llamar_modulo
        use mi_primer_modulo
        implicit none 

        real :: matriz(10,10)
        matriz(:,:)=variable_publica
        call imprimir_matriz_A(matriz)
      end program llamar_modulo
