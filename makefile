LIBS1=-larmadillo -lm 

Revuelve01.x: RevuelveIntervalos01.cpp
	g++ $(LIBS1) $< -o $@


Busca01.x: BuscaCoincidencias01.cpp
	g++ $(LIBS1) $< -o $@

GeneraDatos.x: GeneraDatosRandom01.cpp
	g++ -lm -lgsl $< -o $@

