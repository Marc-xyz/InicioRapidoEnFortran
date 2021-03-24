      !Declaración estática de una formación
      program formaciones
         !Formación de enteros 1-Dimensional (1D)
         integer, dimension(10) :: formacion1

         !Declaración equivalente 
         integer :: formacion2(10)

         !Formación de reales 2-Dimensional (2D)
         real, dimension(10,10) :: formacion3

         !Personalizando límites superior y inferior de los indices de una formación
         real :: formacion4(0:9)
         real :: formacion5(-5:5)
      end program formaciones
