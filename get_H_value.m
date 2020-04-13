function H = get_H_value(I)
H = I(:,:,1);
M = mean2(H);
H = M;