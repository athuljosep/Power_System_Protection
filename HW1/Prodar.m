function V_amp = Prodar(v,w,del_T)
for i = 2:length(v)-1
    vcos = (v(i+1)-v(i-1))/(2*w*del_T);
    vsin = (v(i-1)-(2*v(i))+v(i+1))/((w*del_T)^2);
    V_amp(i-1) = sqrt(vcos^2+vsin^2);
end
end