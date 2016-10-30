module learn_c_bind
use iso_c_binding, only: C_CHAR, C_NULL_CHAR

! ----------------------------------------------------------------------
!C interface, it is used in order to create a folder 
interface
 subroutine dir_create_c(string) bind(C, name="dir_create")
   use iso_c_binding, only: C_CHAR
   character(kind=C_CHAR) :: string 
  end subroutine dir_create_c
end interface
! ----------------------------------------------------------------------

contains

subroutine dir_create_f()
implicit none
character(8)  :: myDate
character(100)  :: myDirName
 
  call date_and_time(date = myDate)
  
  !-> create dirname and test existence
  myDirName='backup_'//trim(myDate)

  !dirnameC=trim(dirname)
  !-> call c function
  call dir_create_c(trim(myDirName)//C_NULL_CHAR)
  
  !-> call c function again
  call dir_create_c(trim(myDirName)//C_NULL_CHAR)

end subroutine dir_create_f

end module learn_c_bind
