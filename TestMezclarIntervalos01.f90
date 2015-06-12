program TestMezclarIntervalos

  implicit none

  real*8,allocatable::intervalos

  real*8    ::dato
  real*8    ::sumas=0.0d0
  integer   ::numdatos=0

  
  open(unit=12,file="TestData.dat", action="read", status="old")

  do while(1.eq.1)
     read(12,*, END=666) dato
     numdatos=numdatos+1
     sumas=sumas+dato

  end do
  
666 continue

  write(6,*) "tenemos ", numdatos, "datos, que suman ", sumas, "."

  

  
end program TestMezclarIntervalos
