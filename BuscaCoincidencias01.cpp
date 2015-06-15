/*Programa que busca las coincidencias dados dos vectores de tiempos */

#include <iostream>
#include <fstream>
#include <armadillo>
#include <math.h>

using namespace std;
using namespace arma;


int main(int argc, char *argv[]){

  char *nomdatosGD, *nomdatosCA;
  vec TiemposGD, TiemposCA;
  
  if(argc<3) {
    nomdatosGD="TestGD.dat";
    nomdatosCA="TestCA.dat";
  }
  else{    
    nomdatosGD=argv[1];
    nomdatosCA=argv[2];
  }

  TiemposGD.load(nomdatosGD);
  TiemposCA.load(nomdatosCA);
  
  /*
    vamos a suponer que la frecuencia de muestreo
    es de 7022 Hz 
    Asi que una "coincidencia tiene 50 ms para suceder,
    es decir, 351 cuadros (350 pa no moler). 
  */

  const int ventanaCausal=350;

  int coincidencias=0;
  int lastk=0;
  
  for(int j=0; j<TiemposGD.n_rows; j++){
    //Dado que este es mas corto, podemos llevar a cabo
    // un brinco mas fuerte aquí
   
    for(int k=lastk; k<TiemposCA.n_rows; k++){
      if(( TiemposCA(k)-TiemposGD(j) < ventanaCausal) &&
	 (TiemposGD(j)<TiemposCA(k) ))
	{
	coincidencias++;
	lastk=k+1;
	cout<<TiemposCA(k)-TiemposGD(j)<<endl;
	cout<<"Hubo una coincidencia para el dispero GD : "<< j <<endl;
	cout<<"Con el CA "<< lastk<<endl;
	cout<<"vamos a checar otro tiempo "<<endl;
	
	
	break;}
    }

   
  }

  cout<<"Hubo " << coincidencias <<" coincidencias aceptables. "<<endl;
    
  return 0;

}



