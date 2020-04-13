function S = get_S_value(I)
S = I(:,:,2);
M = mean2(S);
S = M;