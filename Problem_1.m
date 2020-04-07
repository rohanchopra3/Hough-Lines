% This file implements all the different Edge detectors

import sobel.*
import Roberts.* 
import Prewitt.*

Image = imread('umbrella_woman.jpg');

[Grad_R , Theta_R] = Roberts(Image);
[Grad_P , Theta_P] = Prewitt(Image);
[Grad_S , Theta_S] = sobel(Image);

figure;

imshow(Grad_R ,[])
title('Roberts Grad');

figure;
imshow(Theta_R,[])
title('Roberts Theta');


figure;
imshow(Grad_P ,[])
title('Prewitt Grad');

figure;
imshow(Theta_P,[]) 
title('Prewitt Theta');


figure;
imshow(Grad_S ,[]) 
title('sobel Grad');

figure;
imshow(Theta_S,[]) 
title('sobel Theta');
