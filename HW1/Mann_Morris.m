function V_amp = Mann_Morris(v,w,del_T)
for i = 2:length(v)-1
    vcos = (v(i+1)-v(i-1))/(2*w*del_T);
    vsin = v(i);
    V_amp(i-1) = sqrt(vcos^2+vsin^2);
end
end