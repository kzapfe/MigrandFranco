
tic
No_de_comparacion=0;
matriz_numero_de_coincidencias_originalCA3DG1(1:length(CA3), 1:length(DG)) = single(zeros);
matriz_significancia_montecarloCA3DG1(1:length(CA3), 1:length(DG)) = single(zeros);
for i = 1:20%length(etiquetas_canales_CA3)
    canal_CA3 = etiquetas_canales_CA3{i,1};
    canal_CA3_vacio = isempty(espigas_CA3.(eval('canal_CA3')){1,1});
    if canal_CA3_vacio == 0
        electrodo1 = espigas_CA3.(eval('canal_CA3')){1,1}(1,:);
        for j = 1:length(etiquetas_canales_DG)
            canal_DG = etiquetas_canales_DG{j,1};
            canal_DG_vacio = isempty(espigas_DG.(eval('canal_DG')){1,1});
            if canal_DG_vacio == 0
                electrodo2 = espigas_DG.(eval('canal_DG')){1,1}(1,:);
                No_de_comparacion=No_de_comparacion+1;
                [numero_de_coincidencias_original, valorp] = sincronia_montecarlo_con_v3(electrodo1, electrodo2, grafica, significancia, folder, canal_DG, canal_CA3, No_de_comparacion, SamplingFrequency);
            end
            matriz_significancia_montecarloCA3DG1(i,j) = valorp;
            matriz_numero_de_coincidencias_originalCA3DG1(i,j) = numero_de_coincidencias_original;
            j = j
            
        end
    end
    i = i
    save matriz_significancia_montecarloCA3DG1 matriz_significancia_montecarloCA3DG1
    save matriz_numero_de_coincidencias_originalCA3DG1 matriz_numero_de_coincidencias_originalCA3DG1
    waitbar(i/20)
end



clear matriz_significancia_montecarloCA3DG1 matriz_numero_de_coincidencias_originalCA3DG1

toc

