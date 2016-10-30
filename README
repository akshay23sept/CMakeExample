An example program for the Fortran - C binding. Also uses CMake to generate a Makefile. 
It is initially designed to be part of Fortran lectures in International Master on Turbulence program by Ilkay Solak. 
Please contact me if you have any question and/or contribution.

## DIRECTORIES :

bin : executables
build : where to compile
includes : modules includes files
lib : libraries
src : source files


## SOURCE CODE :

For this example there are only 3 files. And there are no subdirectories. 

Note: In case of subdirectories, mention each folder accordingly.

main   : calls the subroutine


## COMPILATION :

- Go to build directory :
cd build

- Create Makefile with one of these command choosing compiler (gfortran, ifort, ...)
and build type (Debug, Release, ...). 

FC=ifort cmake -D CMAKE_BUILD_TYPE=Debug  ..
FC=ifort cmake -D CMAKE_BUILD_TYPE=Release  ..

FC=gfortran cmake -D CMAKE_BUILD_TYPE=Debug  ..
FC=gfortran cmake -D CMAKE_BUILD_TYPE=Release  ..

FC=mpif90 cmake -D CMAKE_BUILD_TYPE=Debug  ..
FC=mpif90 cmake -D CMAKE_BUILD_TYPE=Release  ..

- Compile :
make


## USAGE :

- run desired executable(s) from bin folder.

