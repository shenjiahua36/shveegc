function cc_sequence = NCCc_fftnopower2(x,y)

corrLength=length(x)+length(y)-1;
r=fftshift(ifft(fft(x,corrLength).*conj(fft(y,corrLength))));

cc_sequence = r./(norm(x)*norm(y));