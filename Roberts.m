function [Grad , Theta] = Roberts(Image)

    Grad=rgb2gray(Image);
    C=double(Grad);
    Theta=ones(size(Grad,1),size(Grad,2));
    
    for i=1:size( C,1)-2
        for j=1:size( C,2)-2
            Gx =-1* C(i,j)+0+0+1*C(i+1,j+1);
            Gy = 0-1*C(i,j+1)+1*C(i+1,j)+0;
            Theta(i,j) = atan(Gy/Gx);
            Grad(i,j)=sqrt(Gx.^2+Gy.^2);
        end
    end
end