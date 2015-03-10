% En esta función voy a hacer lo siguiente:
 % 1) Calcular un vector con los intervales interespiga (isi)
 % 2) Hacer una permutación del vector isi (isiSh)
 % 3) Construir otro vector de tiempos de disparo a partir de isiSh (t2)
 
 % IN
 % t1: vector con los tiempos de los disparos de una neurona
 % OUT
 % t2: vector "revuelto" con los tiempos de disparo de esa neurona
 
 function t2 = RevuelveTiempos(t1,varargin)
 
 hayStream = false;
 
 if nargin > 1
     s = varargin{1};
     hayStream = true;
 end
 
 
 % 1)
 isi = zeros(length(t1),1);
 isi(1) = t1(1);
 for i = 2:length(t1)
     isi(i) = t1(i) - t1(i-1);
 end
 
 % 2)
 if hayStream
      isiSh = isi(randperm(s,length(isi)));
 else
    isiSh = isi(randperm(length(isi)));
 end
 
 % 3)
 t2 = zeros(length(isiSh),1);
 t2(1) = isiSh(1);
 for i = 2: length(isiSh)
     t2(i) = t2(i-1) + isiSh(i);
 end
 