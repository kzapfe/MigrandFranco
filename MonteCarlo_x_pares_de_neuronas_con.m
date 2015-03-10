
%load('cluster')
tic
Unidad_DG='UnidadDG';
versus='vs';
Unidad_CA3='Unidad_CA3';
No_de_comparacion=0;
significancia_entre_pares_de_neuronas_all=cell(20340,2);
for i=1:1;%10%length(espigas_unidades_mayor_a_menor_DG)
    numero_de_unidad_DG=num2str(i);
    unidad_DG=strcat(Unidad_DG, numero_de_unidad_DG);
    canal_DG=espigas_unidades_mayor_a_menor_DG{x_DG(i,1),2};
    neurona1=espigas_unidades_mayor_a_menor_DG{x_DG(i,1),1};
    for j=46:46;%783%length(espigas_unidades_mayor_a_menor_CA3)
        numero_de_unidad_CA3=num2str(j);
        unidad_CA3=strcat(Unidad_CA3, numero_de_unidad_CA3);
        canal_CA3=espigas_unidades_mayor_a_menor_CA3{x_CA3(j,1),2};
        neurona2=espigas_unidades_mayor_a_menor_CA3{x_CA3(j,1),1};
        No_de_comparacion=No_de_comparacion+1;
        significancia_entre_pares_de_neuronas = sincronia_montecarlo_con(neurona1, neurona2, puntos_de_muestreo, grafica, significancia, folder, Unidad_DG, versus, Unidad_CA3, numero_de_unidad_DG, canal_DG, numero_de_unidad_CA3, canal_CA3, No_de_comparacion);
        significancia_entre_pares_de_neuronas_all{No_de_comparacion,1}=significancia_entre_pares_de_neuronas{No_de_comparacion,1};
        significancia_entre_pares_de_neuronas_all{No_de_comparacion,2}=significancia_entre_pares_de_neuronas{No_de_comparacion,2};
        significancia_entre_pares_de_neuronas_all{No_de_comparacion,3}=espigas_unidades_mayor_a_menor_DG{x_DG(i,1),3};
        significancia_entre_pares_de_neuronas_all{No_de_comparacion,4}=espigas_unidades_mayor_a_menor_DG{x_DG(i,1),4};
        significancia_entre_pares_de_neuronas_all{No_de_comparacion,5}=espigas_unidades_mayor_a_menor_CA3{x_CA3(j,1),3};
        significancia_entre_pares_de_neuronas_all{No_de_comparacion,6}=espigas_unidades_mayor_a_menor_CA3{x_CA3(j,1),4};
    end
end
toc

%save('significancia_entre_pares_de_neuronas','significancia_entre_pares_de_neuronas')