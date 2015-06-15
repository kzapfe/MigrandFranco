/*Programa que mezcla los intervalos de los tiempos de disparo */


//#include <gsl/gsl_rng.h>
//#include <gsl/gsl_randist.h>
#include <iostream>
#include <fstream>
#include <armadillo>
#include <math.h>

using namespace std;
using namespace arma;

int main(int argc, char *argv[]){

  /*cargando datos de tiempos  de disparo*/
  char *nombredatos;
  vec tiempos;
  
  if(argc<2) {
    nombredatos="Test.dat";}
  else{    
    nombredatos=argv[1];}
  
  cout<<nombredatos<<"\t"<<argc<<endl;
  tiempos.load(nombredatos);
  //cout<<"OSAUFPOSJF"<<endl;
  int tantos=tiempos.n_rows;  
  cout<<"cargamos "<<nombredatos<< " y son "<< tantos<<endl;
  
  vec intervalos=tiempos;
  intervalos.shed_row(0);
  //cout<<"llalal"<<endl;
  tiempos.shed_row(tantos-1);
  //cout<<tiempos<<endl;

  intervalos-=tiempos;
  //cout<<intervalos<<endl;
  
  /*inicializar variables del generador aleatoreo */

  vec randomInterval=shuffle(intervalos);
  vec randomFireTimes=cumsum(randomInterval);

  
  


  
  /*  const gsl_rng_type *T;
  gsl_rng *r;
  T=gsl_rng_ranlxs2;
  r=gsl_rng_alloc(T);
  gsl_rng_env_setup();
  gsl_rng_set(r,283712);
  */
  

  
  return 0;
  


}
