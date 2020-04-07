function [Grad , Theta] = sobel(Image)

    Grad=rgb2gray(Image);
    C=double(Grad);
    Theta=zeros(size(Grad,1),size(Grad,2));
    
    for i=1:size(C,1)-2
        for j=1:size(C,2)-2
            Gx=((2*C(i+2,j+1)+C(i+2,j)+C(i+2,j+2))-(2*C(i,j+1)+C(i,j)+C(i,j+2)));
            Gy=((2*C(i+1,j+2)+C(i,j+2)+C(i+2,j+2))-(2*C(i+1,j)+C(i,j)+C(i+2,j)));
        
            Theta(i,j) = atan(Gy/Gx);
            Grad(i,j)=sqrt(Gx.^2+Gy.^2);
      
        end
    end
end 