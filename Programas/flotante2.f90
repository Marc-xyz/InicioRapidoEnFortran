        program flotante2
            use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double
            implicit none
            real(sp) :: flotante32
            real(dp) :: flotante64
            
            flotante32 = 1.0_sp
            flotante64 = 1.0_dp
            print *,'flotante32 = ',flotante32
            print *,'flotante64 = ',flotante64
            !flotante32 =    1.00000000    
            !flotante64 =    1.0000000000000000 
      end program flotante2

