function [numero_de_coincidencias_original, valorp] = sincronia_montecarlo_con_v3(electrodo1, electrodo2, grafica, significancia, folder, canal_DG, canal_CA3, No_de_comparacion, SamplingFrequency)

% IN:
% neurona1 = tiempos crudos de las espigas de la neurona de DG
% neurona2 = tiempos crudos de las espigas de la neurona de CA3
% puntos_de_muestreo = puntos de la ventana de coincidencia hacia atras y
% hacia adelante
% grafica = Si grafica=1, hace la grafica del montecarlo unicamente cuando
% es significativo. Si grafica=0, no grafica nada.

% OUT:
% valorp = valor de significancia de la coincidencia entre los tiempos de
% disparo del par de neuronas. Si este valor es igual o mayor a cierta
% significancia se guarda en una matriz junto con las etiquetas de las
% unidades y los canales a los que pertenecen.



% existe_directorio=exist(folder,'dir');
% if existe_directorio==0
%     mkdir('/home/rgut/Proyecto_4096/Funciones/trazos_binarios/270415s01/',folder)
% else
% end
% 
% directorio=strcat('/home/rgut/Proyecto_4096/Funciones/trazos_binarios/270415s01/',folder,'/');
% cd(directorio)

numero_de_coincidencias_original = checar_sincronizacion(electrodo1, electrodo2, SamplingFrequency);


s = RandStream('mt19937ar','Seed',0);

repeticiones=1000;
numero_de_coincidencias(1:repeticiones,1) = uint32(zeros);
for jeje = 1:repeticiones
    electrodo1_r = RevuelveTiempos(electrodo1,s);
    electrodo2_r = RevuelveTiempos(electrodo2,s);
    numero_de_coincidencias_r = checar_sincronizacion(electrodo1_r, electrodo2_r, SamplingFrequency);
    numero_de_coincidencias(jeje,1) = numero_de_coincidencias_r;
    %waitbar(jeje/repeticiones)
end

% Ordena las coincidencias obtenidas por el método de Montecarlo
coincidencias_ordenadas = sort([numero_de_coincidencias; numero_de_coincidencias_original]);
coincidencias_desordenadas = ([numero_de_coincidencias; numero_de_coincidencias_original]);

% Encuentra el lugar dentro de las mil repeticiones del numero de
% coincidencias original
lugar = find(coincidencias_ordenadas == numero_de_coincidencias_original);
if length(lugar) > 1
     lugar = lugar(1);
end

% Me regresa el valor de significancia
valorp = 1 - lugar/repeticiones;

% significancia_entre_pares_de_neuronas{No_de_comparacion,1}=strcat(primer_canal, versus, segundo_canal);
% significancia_entre_pares_de_neuronas{No_de_comparacion,2}=valorp;

% %Grafica el experimento de montecarlo siempre y cuando este sea significativo
% if grafica == 1 %&& valorp <= significancia
%     figure1=figure; %set (figure1,'Visible','off');
%     subplot(3,1,1)
%     stem(coincidencias_desordenadas,'k'); %title(significancia_entre_pares_de_neuronas{No_de_comparacion,1}); xlabel('Numero de experimento Montecarlo'); ylabel('Numero de coincidencias');
%     hold on
%     stem(1001, numero_de_coincidencias_original,'g','LineWidth',2)
%     subplot(3,1,2)
%     plot(coincidencias_ordenadas,'ko'); %title(significancia_entre_pares_de_neuronas{No_de_comparacion,1}); xlabel('Experimentos Montecarlo ordenados'); ylabel('Numero de coincidencias');
%     hold on
%     plot(lugar, numero_de_coincidencias_original,'go','LineWidth',2)
%     subplot(3,1,3)
%     valoresDeCoincidencia = unique(coincidencias_ordenadas);
%     frecuencia = zeros(length(valoresDeCoincidencia),1);
%     for i= 1: length(valoresDeCoincidencia)
%         frecuencia(i) = sum(coincidencias_ordenadas == valoresDeCoincidencia(i));
%     end
%     bar(valoresDeCoincidencia, frecuencia,'k'); %title(significancia_entre_pares_de_neuronas{No_de_comparacion,1}); xlabel('Numero de coincidencias'); ylabel('Frecuencia');
%     %axis off
%     hold off
%     %saveas(figure1,[directorio,sprintf('img%05d.fig',No_de_comparacion)]);
%     %a=sprintf('img%06d.fig',No_de_comparacion);
%     %saveas(figure1,a);
%     %close
% end



%toc