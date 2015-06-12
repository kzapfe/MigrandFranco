function numero_de_coincidencias = checar_sincronizacion(electrodo1, electrodo2, SamplingFrequency)


numero_de_coincidencias=0;
for i = 1:length(electrodo1)
    espiga_de_comparacion = electrodo1(i) + floor((SamplingFrequency/1000)*2.5) : electrodo1(i) + floor((SamplingFrequency/1000)*5);%puntos_de_muestreo; % Se toma en cuenta la ventana después; es decir, se encuentran aquellas espigas de CA3 que sucedieron despues de las de GD
    [yyy, ~]=ismember(espiga_de_comparacion, electrodo2);
    cuantas_espigas=sum(yyy);
    numero_de_coincidencias = numero_de_coincidencias + cuantas_espigas;
end


