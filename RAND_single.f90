      program RAND_single 
      implicit none 


      INTEGER :: n,nmax
      DOUBLE PRECISION :: r
      DOUBLE PRECISION,pointer,dimension(:) :: arr
      
      WRITE(6,'(a)') 'Enter the number of random you want:'
      READ(*,*) nmax

      allocate(arr(nmax))
      
      call random_number(arr)
      
      do n=1,nmax
        WRITE(6,'(F16.3)') arr(n)
      end do


      end program RAND_single


