/*Rutina que mezcla Intervalos */


using namespace std;
using namespace arma;

vec Revuelto(vec original){

  
  int tantos=original.n_rows;
  vec intervalos=original;
  intervalos.shed_row(0);
  original.shed_row(tantos-1);
  intervalos-=original;

  vec randomInterval=shuffle(intervalos);
  vec randomFireTimes=cumsum(randomInterval);

  return randomFireTimes;
    

}
