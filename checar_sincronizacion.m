function numero_de_coincidencias = checar_sincronizacion(neurona1, neurona2, SamplingFrequency) % puntos_de_muestreo)

%tic
numero_de_coincidencias=0;
for i=1:length(neurona1)
    % espiga_de_comparacion=neurona1(i)-puntos_de_muestreo : neurona1(i)+puntos_de_muestreo; % Se toma en cuenta la ventana antes y despues
    espiga_de_comparacion=neurona1(i)+floor((SamplingFrequency/1000)*3):neurona1(i)+floor((SamplingFrequency/1000)*5);%puntos_de_muestreo; % Se toma en cuenta la ventana después; es decir, se encuentran aquellas espigas de CA3 que sucedieron despues de las de GD
    [yyy, ~]=ismember(espiga_de_comparacion, neurona2);
    cuantas_espigas=sum(yyy);
    numero_de_coincidencias=numero_de_coincidencias+cuantas_espigas;
end
%toc