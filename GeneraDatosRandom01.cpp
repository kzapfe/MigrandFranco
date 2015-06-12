/*generamos  tiempos de disparo al azar */


#include <gsl/gsl_rng.h>
#include <gsl/gsl_randist.h>
#include <iostream>
#include <fstream>
#include <math.h>

using namespace std;


int main(int argc, char *argv[]){

  int cantidad;
  if(argc<2){
    cantidad=1000;
  }else{
    cantidad=atoi(argv[1]);
  }

  const gsl_rng_type *T;
  gsl_rng *r;
  T=gsl_rng_ranlxs2;
  r=gsl_rng_alloc(T);
  gsl_rng_env_setup();
  gsl_rng_set(r,283712);


  
  double tau=0;
  for(int j=1;j<=cantidad; j++){
    tau+=gsl_ran_rayleigh(r, 0.5);
    cout<<tau<<endl;
  }
  
  
  return 0;

}
