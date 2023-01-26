      program RAND_multi 
      implicit none 

      include 'mpif.h'

      INTEGER :: n,nmax,ierr,nprocs,myrank,nrand,nrand_proc,master
      INTEGER :: l,ll,sarr,sarrproc,ls
      DOUBLE PRECISION,allocatable,dimension(:) :: arr,arr_proc,arr_master
      
!      WRITE(6,'(a)') 'Enter the number of processors you want to use'
!      READ(*,*) nprocs

      CALL MPI_INIT (ierr)
      CALL MPI_COMM_SIZE (MPI_COMM_WORLD, nprocs, ierr)
      CALL MPI_COMM_RANK (MPI_COMM_WORLD, myrank, ierr)
      
      master=1
      CALL MPI_BARRIER (MPI_COMM_WORLD, ierr)

      if(myrank.eq.0) then
        WRITE(6,'(a)') 'Enter the number of random number you want to create'
        READ(*,*) nrand
      end if
      CALL MPI_BARRIER (MPI_COMM_WORLD, ierr)

      CALL MPI_BCAST (nrand,1,MPI_INTEGER,0,MPI_COMM_WORLD,ierr)
      WRITE(6,'(a,I6,a,I6)') 'Proc:',myrank,'   nrand:',nrand
      CALL MPI_BARRIER (MPI_COMM_WORLD, ierr)

      
      nrand_proc=nrand/nprocs
      allocate(arr(nrand),arr_proc(nrand_proc))
      allocate(arr_master(nrand))
      sarr=size(arr) ; sarrproc=size(arr_proc)
      arr(:)=0.d0 ; arr_proc(:)=0.d0 ; arr_master(:)=0.d0
      ls=myrank*nrand_proc
      
      if(myrank.eq.0) then
        WRITE(6,'(a)')        
      end if
      CALL MPI_BARRIER (MPI_COMM_WORLD, ierr)

      WRITE(6,'(a,I6,a,I14,a,2I14)') 'Proc:',myrank,'   arr size:',sarr,'   arr_proc size:',sarrproc,ls
      CALL MPI_BARRIER (MPI_COMM_WORLD, ierr)
      
      CALL RANDOM_NUMBER(arr_proc)
      
      do l=1,nrand_proc
        ll=ls+l
        arr(ll)=arr_proc(l)
!        WRITE(6,'(2I10,F16.4)') ll,myrank,arr(ll)
      end do
      
      
!      CALL MPI_BARRIER (MPI_COMM_WORLD, ierr)
!      CALL MPI_ALLREDUCE(arr,arr_master,nrand,MPI_DOUBLE_PRECISION,MPI_SUM,MPI_COMM_WORLD,ierr)

!      WRITE(6,'(F16.4)') arr_master

      CALL MPI_BARRIER (MPI_COMM_WORLD, ierr)
      CALL MPI_FINALIZE (ierr)

      end program RAND_multi
