function V_amp = LSM(v,w,N)
del_T = (2*pi)/(w*N);
for i = 1:N
    A(i,1) = sin((2*(i-1)-N+1)*w*del_T/2);
    A(i,2) = cos((2*(i-1)-N+1)*w*del_T/2);
end
A_inv = inv(A'*A)*A';
for i = N:length(v)
    vcos = 0; vsin = 0;
    b = v(i-N+1:i);
    x = A_inv * b';
    vcos = x(1);
    vsin = x(2);
    V_amp(i-N+1) = sqrt(vcos^2+vsin^2);
end
end