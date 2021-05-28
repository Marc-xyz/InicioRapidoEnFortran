      module modulo_empleados
        implicit none 
        private
        public tipo_fecha, tipo_direccion, tipo_persona, tipo_empleado
        ! Nota que así podemos declara todo un conjunto de datos 
        ! como publicos 

        !Tipo fecha 
        type :: tipo_fecha 
            integer                       :: anyo, mes, dia 
        end type

        !Tipo direccion
        type :: tipo_direccion
            character(len=:), allocatable :: ciudad, nombre_calle
            integer                       :: numero_de_la_casa
        end type

        !Tipo hijo "persona" del padre "direccion"
        type, extends(tipo_direccion) :: tipo_persona
            character(len=:), allocatable :: nombre, apellido, e_mail
        end type

        !Tipo hijo "empleado" del padre "persona"
        type, extends(tipo_persona) :: tipo_empleado
            type(tipo_fecha)              :: fecha_contratacion
            character(len=:), allocatable :: puesto_empresa
            real                          :: salario_mensual
        end type
      end module modulo_empleados


      program  testear_empleados
        use modulo_empleados
        implicit none 
        type(tipo_empleado) :: empleado
        
        !Inicializamos 
        empleado%fecha_contratacion%anyo =2021 
        ! tipo_empleado tiene acceso a miembros del tipo_fecha 
        ! no porque sea una extensión sino porque se declaro un
        ! tipo_fecha dentro de tipo_empleado.
        empleado%fecha_contratacion%mes = 5
        empleado%fecha_contratacion%dia = 28
        empleado%nombre= "Numerius"
        ! tipo_empleado tiene acceso a miembros del tipo_persona
        ! y por ello hereda sus miembros debido a "extends".
        empleado%apellido = "Negidius"
        empleado%ciudad = "Girona"
        ! tipo_empleado tiene acceso a tipo_direccion ya que
        ! porque hereda de tipo_persona que a su vez lo hereda
        ! del tipo_direccion.
        empleado%nombre_calle= 'Carrer Major'
        empleado%numero_de_la_casa= 121
        empleado%puesto_empresa= 'Interno'
        empleado%salario_mensual= 0.0
        print *, empleado%nombre 
      end program testear_empleados

