function DT = loadDT()
DT = zeros(22, 4);
gambar1 = 'train (';
gambar2 = ').jpg';

for i = 1 : 22
    
    j = int2str(i);
    gambar = strcat(gambar1, j, gambar2);        
    a = imread(gambar); 
    
    J = rgb2hsv(a);
%     J = manualrgb2hsv(a);
    
    H = get_H_value(J);
    S = get_S_value(J);
    V = get_V_value(J);
        
    A = [H,S,V,1];
    if i>11
        A = [H,S,V,2];
    end    
    DT(i,:) = [A];
    
    proses = (i/22)*100
end






