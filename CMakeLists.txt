# ------------------------------------------------------------------------------------------------------------------------- 
# General options 
# ------------------------------------------------------------------------------------------------------------------------- 
 
# Top-Level CmakeLists.txt 
PROJECT(bind_c_f90 C Fortran) 
 
enable_language (C Fortran) 
 
# Check version of cmake 
cmake_minimum_required(VERSION 2.6) 
 
# to see command lines 
#SET(CMAKE_VERBOSE_MAKEFILE ON) 
 
# to add Color on CMake Process 
SET(CMAKE_COLOR_MAKEFILE ON) 
 
SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin) 
SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib) 
SET(CMAKE_Fortran_MODULE_DIRECTORY ${PROJECT_SOURCE_DIR}/includes) 
 
# Type of build  
message( STATUS "Build type: " ${CMAKE_BUILD_TYPE}) 

# -------------------------------------------------------------------------------------------------------------------------
# Compiler options
# -------------------------------------------------------------------------------------------------------------------------
message( STATUS "Fortran compiler: " ${CMAKE_Fortran_COMPILER} )
message( STATUS "Fortran compiler: " ${CMAKE_C_COMPILER} )
# External Libs
#set(NETCDFloc "/opt/software/libraries/netcdf/4.3.3.1_fortran-4.4.2/hdf5/1.8.14/intel/15.0.3.187/bullxmpi/1.2.8.4-mxm")
#set(NETCDFLIB  "-I${NETCDFloc}/include -I${NETCDFfloc}/include -lnetcdf -lnetcdff")
#Compiler Intel Flags
#set(CMAKE_Fortran_FLAGS "-fpp -heap-arrays -assume byterecl -vec -simd") # -qopenmp
#set(CMAKE_Fortran_FLAGS_RELEASE "-O3 -xCORE-AVX2 -implicitnone -pc64 -xW -axp -cm -w -mcmodel=medium")
#set(CMAKE_Fortran_FLAGS_DEBUG "-O0 -g -fpe0 -recursive -implicitnone -mcmodel=medium -traceback -CB")
#set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ")
#Compiler gfortran Flags
set(CMAKE_Fortran_FLAGS "-fbounds-check ") # -qopenmp
set(CMAKE_Fortran_FLAGS_RELEASE "-O3 -march=native -ffast-math -funroll-loops -std=legacy -fopenmp")
set(CMAKE_Fortran_FLAGS_DEBUG "-O0 -Warray-bounds  -std=legacy -Wall -Wno-unused ")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ")
set(DOUBLE "-r8")

# Examples for external libraries
# Lapack
#set(LAPACKLIB "-L/opt/software/intel/composer_xe_2015.0.090/mkl/lib/intel64 -lmkl_intel_lp64 -lmkl_scalapack_lp64 -lmkl_blacs_intelmpi_lp64 -  lmkl_intel_lp64 -lmkl_core -lmkl_sequential")
# Lapack with openMP settings
#set(LAPACKLIB "-L/opt/software/intel/composer_xe_2015.0.090/mkl/lib/intel64 -lmkl_intel_lp64 -lmkl_scalapack_lp64 -lmkl_blacs_intelmpi_lp64 - lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread -lmkl_sequential")
# PETSc 
#set(PETSCloc "/scratch/cnt0026/lml1741/solak/LIB/myPETSc-3.7.2-threads")
#set(PETSCloc "/scratch/cnt0026/lml1741/solak/LIB/myPETSc-3.7.2-opt")
#set(PETSCopt "-lpetsc -lHYPRE -ldmumps -lmumps_common -lparmetis -lmetis -lpord -lscalapack -lsuperlu_dist -lml")
#set(PETSCLIB "-L${PETSCloc}/lib ${PETSCopt}")

set(X11LIB "-lX11")
include_directories(${PETSCloc}/include ${NETCDFloc}/include)

if (${CMAKE_BUILD_TYPE} MATCHES "Release")
  message( STATUS "Fortran compiler flags:" ${CMAKE_Fortran_FLAGS_RELEASE})
elseif (${CMAKE_BUILD_TYPE} MATCHES "Debug")
  message( STATUS "Fortran compiler flags:" ${CMAKE_Fortran_FLAGS_DEBUG})
endif()

message( STATUS "Netcdf library flags:" ${NETCDFLIB})
message( STATUS "Petsc library flags:" ${PETSCLIB})

# -------------------------------------------------------------------------------------------------------------------------
# Libraries
# -------------------------------------------------------------------------------------------------------------------------

# class dir_handling
SET(DIR_HANDLING_C dir_handling_c)
ADD_LIBRARY(${DIR_HANDLING_C} STATIC src/module_dir_handling.c)
#target_link_libraries(${DIR_HANDLING_C})

# class bind_dir_handling
SET(DIR_HANDLING_F90 dir_handling_f90)
ADD_LIBRARY(${DIR_HANDLING_F90} STATIC src/module_bind_dir_handling.f90) 
target_link_libraries(${DIR_HANDLING_F90} ${DIR_HANDLING_C})

# -------------------------------------------------------------------------------------------------------------------------
# Executables
# -------------------------------------------------------------------------------------------------------------------------
# main program
SET(MAIN main)
ADD_EXECUTABLE( ${MAIN} src/main.f90)
target_link_libraries(${MAIN} ${DIR_HANDLING_F90})

