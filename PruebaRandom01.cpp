#include <iostream>
#include <fstream>
#include <armadillo>
#include <math.h>

#include "RevuelveIntervalos01.hpp" 

using namespace std;
using namespace arma;

int main(){

  vec test=randu(10);

  test.save("test01.dat", arma_ascii);
  test=shuffle(test);
  test.save("test02.dat", arma_ascii);
  test=shuffle(test);
  test.save("test03.dat", arma_ascii);
  test=shuffle(test);
  test.save("test04.dat", arma_ascii);
  
    
  
  return 0;
}
