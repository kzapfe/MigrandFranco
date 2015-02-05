program leyendobinarios01
  !! Programa que lee un archivo binario escrito en mono/csharp y devuelve lo que lee.
  !! parece funcionar a lo bruto.
  
  !!USE, INTRINSIC :: ISO_C_BINDING, ONLY: C_INT !!Creo que esto NO es necesario
  INTEGER, PARAMETER :: chaira = 10
  CHARACTER(*), PARAMETER :: filename = 'datos_binarios.bin'
  !!INTEGER(C_INT) :: data
  Integer*1 :: probando
  !***
  OPEN(unit=chaira,file=filename, ACCESS='STREAM', FORM='UNFORMATTED')
  do while (1.eq.1)    
     READ (10, END=666) probando
     PRINT "('data was ',I0)", probando
  end do

666 CLOSE(10)
  
  print*,  "That was it"
 
  

end program leyendobinarios01
  
