%Edgar Moises Hernandez-Gonzalez
%16/10/19-01/12/19
%Subconjuntos de datos para BCI-IV-2a
%Obtenemos los 4seg de MI del segundo 2 al 6
%Fs=250Hz, por lo tanto en 4seg son 1000 datos
%Input Shape: todox25
%Output Shape: 288000x22

clear
clc

%cargar los datos
[s, h] = sload('A01T.gdf'); %cambiar el 01 por el numero de sujeto y revisar si es T o E
%Asi para que no existan NaN (no sirve)
% [s, h] = sload('A02T.gdf', 0, 'OVERFLOWDETECTION:ON'); %cambiar el 01 por el numero de sujeto
% load A01E.mat

%-------------------------------------------------------------------------
%2秒版本 post-cue
%0.3 - 2.3 : 75
%0.4 - 2.4 : 100
%0.5 - 2.5 : 125
%0.6 - 2.6 : 150
%0.7 - 2.7 : 175

X = zeros(1440, 22,500);
for columna=1:22 %22 canales
	contador = 1;
    for i=1:288 %288 muestras
        X(i,columna,contador:contador+499) = s(h.TRIG(i)+750+75 : h.TRIG(i)+1249+75 , columna)';
    end
    for i=289:576 %288 muestras
        X(i,columna,contador:contador+499) = s(h.TRIG(i-288)+750+100 : h.TRIG(i-288)+1249+100 , columna)';
    end
    for i=577:864 %288 muestras
        X(i,columna,contador:contador+499) = s(h.TRIG(i-288*2)+750+125 : h.TRIG(i-288*2)+1249+125 , columna)';
    end
    for i=865:1152 %288 muestras
        X(i,columna,contador:contador+499) = s(h.TRIG(i-288*3)+750+150 : h.TRIG(i-288*3)+1249+150 , columna)';
    end
    for i= 1153 : 1440 %288 muestras
        X(i,columna,contador:contador+499) = s(h.TRIG(i-288*4)+750+175 : h.TRIG(i-288*4)+1249+175 , columna)';
    end
end
% y = classlabel;
y = [h.Classlabel;h.Classlabel;h.Classlabel;h.Classlabel;h.Classlabel];
%-------------------------------------------------------------------------
%3秒版本 post-cue
% X = zeros(288, 22, 750);
% for columna=1:22 %22 canales
% 	contador = 1;
%     for i=1:288 %288 muestras
%         X(i,columna,contador:contador+749) = s(h.TRIG(i)+750 : h.TRIG(i)+ 1499, columna)';
%     end
% end

%-------------------------------------------------------------------------

% save('2A_s1_03_23.mat',''); %cambiar el 01 por el numero de sujeto y revisar si es T o E
% save test_2A_s1_2s.mat X y
save train_2A_s2_2s_mixed X y