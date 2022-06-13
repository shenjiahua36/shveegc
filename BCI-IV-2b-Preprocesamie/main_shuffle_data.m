clc
clear all

load train_2A_s8_2s_mixed
RandIndex = randperm( 1440 );
X = X( RandIndex,:,: );
y = y( RandIndex,:);

save train_2A_s8_2s_mixed X y