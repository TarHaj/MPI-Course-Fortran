# MPI-Course-Fortran

THE CREATION OF THIS COURSE IS STILL IN PROGRESS...

### Video 1: Installation
    Content: 
      1. Installation of ifort & intelMPI
      2. Installation of gfrotran & openMPI
      3. Bashrc alias mpiintel & mpiopen
      4. Check installation (hello world program)
    Tool:
      1. /opt
      2. bashrc

### Video 2: MPI_BCAST & MPI_ALLREDUCE
    Content:
      1. Explain MPI headers and foornote (hello program)
      2. Random number program 
      3. Compare running time to compute 10000 random number (single proc VS multi procs (x4))
      4. Introduction to MPI_BCAST & MPI_ALLREDUCE.
      5. Show htop & time command line
    Tool:
      1. htop
      2. time *.exe

### Video 3: MPI_SCATTER & MPI_REDUCE
    Content:
      1. Create linear ball travel game:
      2. Drop at random location along the length [0,1]
      3. Four different zone provide different acceleration
      4. Run the game until all the sphere reaches the finish line.
    Tool:
      1. MPI_Scatter 
      2. MPI_Reduce


### Video 4: MPI_BCAST/MPI_ALLREDUCE VS MPI_SCATTER/MPI_REDUCE
    Content:
      1. Run the same game with MPI_BCAST/MPI_ALLREDUCE
      2. Compare the time and memory allocation when a significant number of sphere are created. (1M)
    Tool:
      1. MPI_BCAST/MPI_ALLREDUCE
      2. MPI_SCATTER/MPI_REDUCE


### Video 5: MPI_SEND & MPI_RECEIVE
    Content:
      1. Create a 1D heat equation model
      2. Use ghost to inform the bound of the processor.
    Tool:
      1. MPI_SEND
      2. MPI_RECEIVE
      3. MPI_WAIT

### Video 6: DEBUG MPI & MISTAKE TO AVOID
    Content:
      1. Show how to debug with MPI_BARRIER
      2. Where not to place MPI_BARRIER
    Tool:
      1. MPI_BARRIER
