LIBS=-larmadillo -lm -lgsl

Revuelve01.x: RevuelveIntervalos01.cpp
	g++ $(LIBS) $< -o $@

