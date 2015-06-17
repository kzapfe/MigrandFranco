/*Programa que busca las coincidencias dados dos vectores de tiempos */

#include <iostream>
#include <fstream>
#include <armadillo>
#include <math.h>

#include "RevuelveIntervalos01.hpp" 

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
  

  const int ventanaCausal=350;
  const int nmax=100;

  int coincidencias=0;
  int lastk=0;
  int coincidenciastotales=0;
  double promcoincidencias=0;
  
  vec GDrevuelto;
  vec CArevuelto;

  vec GDintervalos=TiemposGD;
  vec CAintervalos=TiemposCA;

  GDintervalos.shed_row(0);
  CAintervalos.shed_row(0);
  TiemposGD.shed_row(TiemposGD.n_rows-1);
  TiemposCA.shed_row(TiemposCA.n_rows-1);

  GDintervalos-=TiemposGD;
  CAintervalos-=TiemposCA;

  GDrevuelto=shuffle(GDintervalos);
  CArevuelto=shuffle(CAintervalos);

  vec GDRandomFire;
  vec CARandomFire;
  
  ostringstream escupenumero;
  string lastring;
  
  
  for(int n=1; n<=nmax; n++){

    
    // srand(n*time(0));
    //cout<<time(0)+n<<endl;
    GDrevuelto=shuffle(GDrevuelto);
    CArevuelto=shuffle(CArevuelto);
    GDRandomFire=cumsum(GDrevuelto);
    CARandomFire=cumsum(CArevuelto);

    coincidencias=0;
    lastk=0;
    
    /* 
    escupenumero<<n<<"_IntervalosRevueltos.dat"<<ends;
    lastring=escupenumero.str();
    const char *nomine =lastring.c_str();
    GDRandomFire.save(nomine, arma_ascii);
    escupenumero.clear();
    escupenumero.str("");
    */
    
    
    

    for(int j=0; j<GDRandomFire.n_rows; j++){
      //Dado que este es mas corto, podemos llevar a cabo
      // un brinco mas fuerte aquí
      
      for(int k=lastk; k<CARandomFire.n_rows; k++){
	
	if((CARandomFire(k)-GDRandomFire(j) < ventanaCausal) &&
	   (GDRandomFire(j)<CARandomFire(k) ))
	  {
	  coincidencias++;
	  lastk=k+1;
	
	  break;}
      }

   
    }

    //cout<<"Hubo " << coincidencias <<" coincidencias aceptables. "<<endl;
    cout<< coincidencias<<"\t"<<TiemposGD.n_rows<<"\t"<<TiemposCA.n_rows<<endl;
    coincidenciastotales+=coincidencias;
    
  }
  promcoincidencias=(double)coincidenciastotales/(double)nmax;

  cout<<"en promedio hubo disparios causales "<<promcoincidencias<<endl;
  
  return 0;
  

}



