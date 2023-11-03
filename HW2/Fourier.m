function V_amp = Fourier(v,w,N)
del_T = (2*pi)/(w*N);
for i = N:length(v)
    vcos = 0; vsin = 0;
    for j = 0:N-1 
        vcos = vcos + (v(j+i-N+1) * sin((2*pi*j/N)));
        vsin = vsin + (v(j+i-N+1) * cos((2*pi*j/N)));
    end
    vcos = (2/N)*vcos;
    vsin = (2/N)*vsin;
    V_amp(i-N+1) = sqrt(vcos^2+vsin^2);
end
end