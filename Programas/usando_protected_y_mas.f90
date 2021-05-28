      module usando_protected_y_mas
        type :: tipo_ejemplo

            !1r_caso: tipo integrado simple con atributo 
            !de acceso e [init]
            integer, private :: i = 0 
            !"private" lo oculta del uso fuera del alcance
            ! de tipo_ejemplo
            ! La inicialización predeterminada "[=0]" es la
            ! parte "[init]".
         

            !2n_caso: "protected"
           !!integer, protected :: i
            ! A diferencia de "private", "protected" permite 
            ! el acceso al valor asignado de "i" fuera de
            ! tipo_ejemplo pero no es definible, es decir,
            ! se puede asignar un valor a "i" solo dentro de 
            ! tipo_ejemplo


            !3r_caso id de una formación dinámica 
            real, allocatable, dimension(:) :: x
            ! lo mismo con
           !!real, allocatable :: x(:)
            ! El paréntesis implica "dimension(:)" y es uno de los 
            ! posibles "[especificaciones-dependientes del atributo]"
        end type
      end module usando_protected_y_mas
     
      program testear_usando_protected_y_mas
        use usando_protected_y_mas
        type(tipo_ejemplo) :: ejemplo1
        print *, 'x=' , ejemplo1%x
        !print *, 'i=' , ejemplo1%i
      end program testear_usando_protected_y_mas
