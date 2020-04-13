function V = get_V_value(I)
V = I(:,:,3);
M = mean2(V);
V = M;