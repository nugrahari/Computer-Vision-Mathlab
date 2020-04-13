function hsv_img = manualrgb2hsv(rgb_img)
hsv_img=double(zeros(size(rgb_img)));
% hsv_img=rgb2hsv(hsv_img);

for i=1:size(hsv_img,1)
    for j=1:size(hsv_img,2)
        var_R = (double(rgb_img(i,j,1))/255);
        var_G = (double(rgb_img(i,j,2))/255);  
        var_B = (double(rgb_img(i,j,3))/255);
        
        var_Min = min([var_R, var_G, var_B]);    
        var_Max = max([var_R, var_G, var_B]);   
        del_Max = var_Max - var_Min;
        hsv_img(i,j,3) = var_Max;

        if ( del_Max < 0.00001 )                  
            hsv_img(i,j,1) = 0;
            hsv_img(i,j,2) = 0;
        else                                    
            hsv_img(i,j,2) = del_Max / var_Max;

            del_R = ( ( ( var_Max - var_R ) / 6 ) + ( del_Max / 2 ) ) / del_Max;
            del_G = ( ( ( var_Max - var_G ) / 6 ) + ( del_Max / 2 ) ) / del_Max;
            del_B = ( ( ( var_Max - var_B ) / 6 ) + ( del_Max / 2 ) ) / del_Max;

            if( var_R == var_Max )
                hsv_img(i,j,1) = del_B - del_G;
            elseif ( var_G == var_Max )
                hsv_img(i,j,1) = ( 1 / 3 ) + del_R - del_B;
            elseif ( var_B == var_Max )
                hsv_img(i,j,1) = ( 2 / 3 ) + del_G - del_R;
            end

            if ( hsv_img(i,j,1) < 0 ) 
                hsv_img(i,j,1) =hsv_img(i,j,1) + 1;
            end
            if ( hsv_img(i,j,1) > 1 ) 
                hsv_img(i,j,1) =hsv_img(i,j,1) - 1;            
            end
        end
        
    end
end
end

