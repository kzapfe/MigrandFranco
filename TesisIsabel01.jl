using HDF5 #Leer datos en HDF5 

#Tienes que modificar esto
DatosPrueba=h5open("../050815_1R4.brw", "r")


#Por alguna estúpida razón, son arrays de arrays...
numerocuadros=DatosPrueba["/3BRecInfo/3BRecVars/NRecFrames"][1][1]
frecuencia=DatosPrueba["/3BRecInfo/3BRecVars/SamplingRate"][1][1]
maxvolt=DatosPrueba["/3BRecInfo/3BRecVars/MaxVolt"][1][1]
minvolt=DatosPrueba["/3BRecInfo/3BRecVars/MinVolt"][1][1]
bitdepth=DatosPrueba["/3BRecInfo/3BRecVars/BitDepth"][1][1]

DatosCrudos=read(DatosPrueba["/3BData/Raw"])


aux=Array(Int32, 64,64,210624);
for j=1:64,k=1:64
    aux[k,j,:]=DatosCrudos[j+(k-1)*64,:]
end
DatosCentrados=int32(aux)*(-1)+2048;
aux=0


