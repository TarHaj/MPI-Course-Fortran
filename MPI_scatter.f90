! Reference: https://mpitutorial.com/tutorials/mpi-send-and-receive/

      program send_scatter
      implicit none

      include 'mpif.h'

      integer :: num,comsize,procrank,ierr,l
      INTEGER,pointer,dimension(:) :: numtot,numproc

      call MPI_INIT(ierr)
      call MPI_COMM_SIZE(MPI_COMM_WORLD,comsize,ierr)
      call MPI_COMM_RANK(MPI_COMM_WORLD,procrank,ierr)
      
      allocate(numproc(10)) ; numproc(:)=0
      if(procrank.eq.0) then
	allocate(numtot(10)) ; numtot(:)=0 
	numtot(1)=2190
	numtot(2)=324
	numtot(5)=903
	numtot(9)=-12
      end if
	
	call MPI_SCATTER(numtot			  &!send data
     &			,2			  &!send count
     &			,MPI_INT		  &!send datatype
     &			,numproc		  &!receive data
     &			,2			  &!receive count
     &			,MPI_INT		  &!receive datatype
     &			,0			  &!master proc
     &			,MPI_COMM_WORLD		  &!communicator field
     &			,ierr)			   !error monitor
      
      WRITE(6,'(a,I6,a,10I6)') 'Proc:',procrank,'     numproc:',numproc(1:2)
      numproc(:)=numproc(:)*2

	call MPI_GATHER (numproc		  &!send data
     &			,2			  &!send count
     &			,MPI_INT		  &!send datatype
     &			,numtot			  &!receive data
     &			,2			  &!receive count
     &			,MPI_INT		  &!receive datatype
     &			,0			  &!master proc
     &			,MPI_COMM_WORLD		  &!communicator field
     &			,ierr)			   !error monitor
      
      if(procrank.eq.0) then
	WRITE(6,*) 
	WRITE(6,'(a,I6,a,10I6)') 'Proc:',procrank,'     numproc:',numtot(1:10)
      end if
!      numproc


      call MPI_FINALIZE(ierr)

      end
