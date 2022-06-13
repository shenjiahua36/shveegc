
clear
clc
[s, h] = sload('A09E.gdf'); %cambiar el 01 por el numero de sujeto y revisar si es T o E
load A09E

X = zeros(288, 22,500);
for columna=1:22 %22 canales
	contador = 1;
    for i=1:288 %288 muestras
        X(i,columna,contador:contador+499) = s(h.TRIG(i)+750+125 : h.TRIG(i)+1249+125 , columna)';
    end
end


y = classlabel;
save test_2A_s9_2s.mat X y
