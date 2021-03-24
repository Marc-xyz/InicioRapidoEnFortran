      program flotante
        use, intrinsic :: iso_fortran_env, only: sp=>real32, dp=>real64
        implicit none
        real(sp) :: flotante32
        real(dp) :: flotante64

        flotante32 = 1.0_sp
        !Sufijo explicito para constantes literales
        flotante64 = 1.0_dp

        print *,'flotante32 = ',flotante32
        print *,'flotante64 = ',flotante64
        !flotante32 =    1.00000000    
        !flotante64 =    1.0000000000000000 
      end program flotante
