import sobel.*


Image=imread('lines.png');

% using the Edge detector I wrote

[image,~] = sobel(Image);
     

% For Finding the Hough Matrix

[x, y] = size(image);                                            
rho = (-norm([x y]):1:norm([x y]));
theta = (0:0.01:pi);

num_thetas = numel(theta);
num_rhos = numel(rho);

hough_space = zeros(num_rhos, num_thetas);


for i = 1:x
    for j = 1:y
        if image(i, j) == 1 
            for theta_index = 1:num_thetas
                r  = i * cos(theta(theta_index)) + j * sin(theta(theta_index));
                rho_index = round(r + num_rhos/2);                      
                hough_space(rho_index, theta_index) = hough_space(rho_index, theta_index) + 1;
            end
        end
    end
end

% For Finding the peaks using a threshold

[maxcolumn, rownum] = max(hough_space);
thresh = max(max(hough_space)) - 39;

for i = 1:size(maxcolumn, 2)
   if maxcolumn(i) > thresh
       col(end + 1) = i;
       row(end + 1) = rownum(i);
   end
end


% For Plotting the Lines

figure;
imshow(image);
colormap(gray);
hold on;

for i = 1:size(col,2)
    m = -(cos(theta(col(i)))/sin(theta(col(i))));
    b = rho(row(i))/sin(theta(col(i)));
    x1 = 1:y;
    plot(m*x1+b, x1);
    hold on;
end   
