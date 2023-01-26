! Reference: https://mpitutorial.com/tutorials/mpi-send-and-receive/

      program send_scatter
      implicit none

      include 'mpif.h'

      INTEGER :: num,comsize,procrank,ierr,l,Gsize,GLPT,GWorld,CLPT,CWorld,RLPT
      INTEGER,pointer,dimension(:) :: numtot,numproc,GArray

      call MPI_INIT(ierr)
      call MPI_COMM_SIZE(MPI_COMM_WORLD,comsize,ierr)
      call MPI_COMM_RANK(MPI_COMM_WORLD,procrank,ierr)
      call MPI_COMM_GROUP(MPI_COMM_WORLD,GWorld,ierr)
      call MPI_COMM_CREATE(MPI_COMM_WORLD,GWorld,CWorld,ierr)
	  
      Gsize=3
      allocate(GArray(Gsize))
      GArray(1)=0 ; GArray(2)=3 ; GArray(3)=1
      call MPI_GROUP_INCL(GWorld         	&!group parent
     &			 ,GSize			&!group size
     &			 ,GArray		&!proc series
     &			 ,GLPT			&!group children
     &			 ,ierr)			 !error monitor
      
      call MPI_COMM_CREATE(CWorld        	&!comm parent
     &			  ,GLPT     		&!target group
     &			  ,CLPT			&!comm children
     &			  ,ierr)		 !error monitor

      call MPI_GROUP_RANK(GLPT,RLPT,ierr)
      
      if(CLPT.ne.MPI_COMM_NULL) then
	allocate(numtot(10)) ; numtot(:)=0 

	if(RLPT.eq.0) then
	  numtot(1)=2190
	  numtot(2)=324
	  numtot(5)=903
	  numtot(9)=-12
	  WRITE(6,'(a,10I6)') 'master:',numtot(1:10)
	end if
	  
	call MPI_BCAST(numtot			  &!send data
     &		      ,2			  &!send count
     &		      ,MPI_INT		      	  &!send datatype
     &		      ,0			  &!master proc
     &		      ,CLPT			  &!communicator field
     &		      ,ierr)			   !error monitor
      
	WRITE(6,'(a,I6,a,10I6)') 'Proc:',RLPT,'     numproc:',numtot(1:10)
	
      end if
      
      call MPI_FINALIZE(ierr)

      end
