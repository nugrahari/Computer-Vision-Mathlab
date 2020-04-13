DT = zeros(6, 4);

gambar1 = 'train (';
gambar2 = ').jpg'

for i = 17 : 22
    
    j = int2str(i);
    gambar = strcat(gambar1, j, gambar2);
        
    a = imread(gambar);
    
    J = rgb2hsv(a);
    H = get_H_value(J);
    S = get_S_value(J);
    V = get_V_value(J);
    A = [H,S,V,1];
    figure, imshow(a);
    
    DT(i,:) = [A];
end

