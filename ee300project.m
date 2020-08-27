clear, clc 

% GDP in $1000 USD
x = [33.4 32.5 30.0 29.9 16.6 21.1 29.0 18.7 29.5 31.1 33.7 17.0 16.8...
    30.5 25.4 24.0 26.1 28.6 21.7 15.3 41.3 13.9 28.8 24.4 35.7 18.9...
    20.5 20.2 20.5 23.1 30.6 36.4 17.1 28.4 44.0 12.2 16.7 10.9];

% Life Satisfaction Index (LSI)
y = [7.3 7 6.9 7.3 6.7 6.6 7.5 5.6 7.5 6.4 7 5.2 5.3 7.5 7 7.2 5.9 5.9...
    5.9 5.9 6.9 6.6 7.4 7.3 7.5 6 5.2 6.1 5.8 6.4 7.3 7.5 5.5 6.7 6.9...
    6.6 6 4.8];


% 1. Find the (sample) means of the GDP and the LSI and store them as mx and my

fprintf("1:\nUsing MATLAB funcitons mean(x) and mean(y) we get:\n")
fprintf("mean(x) = %d\n", mean(x(:)));
fprintf("mean(y) = %d\n", mean(y(:)));
disp(" ")

mx = my_mean(x);
my = my_mean(y); 

fprintf("In comparison, the results of my function my_mean() are as follows:\n")
fprintf("my_mean(x) = %d\n", mx)
fprintf("my_mean(y) = %d\n", my)
disp(" ")

% 2. Find the (sample) standard deviation of the GDP and the LSI and store them as stdx and stdy

fprintf("2:\nUsing MATLAB funcitons std(x) and std(y) we get:\n")
fprintf("std(x) = %d\n", std(x(:)))
fprintf("std(y) = %d\n", std(y(:)))
disp(" ")

stdx = my_std(x);
stdy = my_std(y);

fprintf("In comparison, the results of my function my_std() are as follows:\n")
fprintf("my_std(x) = %d\n", stdx)
fprintf("my_std(y) = %d\n", stdy)
disp(" ")

% 3. Determine the mediam of the GDPs and store it as medianx.

fprintf("3:\nUsing MATLAB funcitons median(x) we get:\n")
fprintf("median(x) = %d\n", median(x(:)))
disp(" ")

fprintf("In comparison, the results of my function my_median(x) is as follows:\n")
fprintf("my_median(x) = %d\n", my_median(x))
disp(" ")

% 4. Illustrate the data in the table using a scatter plot with the
% horizontal axis representing the GDP and the vertical axis representing
% the LSI. From the plot, determine whether the GDP and the LSI have
% positive correlation, negative correlation or no correlation

scatter(x,y)
fprintf("4:\nFrom the plot, the GDP and LSI have positive correlation.\n\n")


% 5. Find the sample covariance of the GDP and the LSI and store it as covxy

covxy = (numel(x)/(numel(x)-1))*mean((x-mx).*(y-my));
fprintf("5:\nThe sample covariance of the GDP and the LSI is %d\n", covxy)
disp(" ")

% 6. Find the correlation coefficient from the sample covariance and the
% standard deviations of the GDP and LSI. Print the obtained correlation
% coefficient, and determine if the calculation confirms with your
% observation from the scatter plot.

rhoxy = covxy/(my_std(x)*my_std(y));
fprintf("6:\nThe correlation coefficient is %d\n", rhoxy)
disp("This calculation confirms with my observation from the scatterplot because a positive value indicates a positive correlation")



function my_m = my_mean(h)
    my_m = sum(h) / length(h);
end

function my_s = my_std(i)
    partialSum = 0;
    for j = 1 : numel(i)
       temp = (i(j) - my_mean(i)).^2;
       partialSum = partialSum + temp;
    end
    my_s = sqrt((1/(numel(i)-1)) * partialSum);
end
 
function my_med = my_median(k)
    sortedArray = sort(k);
    arraySize = numel(k);
    if mod(arraySize,2) == 0                              % if arraySize is even
       m = arraySize/2;
       my_med = (sortedArray(m) + sortedArray(m+1))/2;
    else                                                  % if arraySize is odd
       n = (arraySize + 1)/2;
       my_med = sortedArray(n);
    end
end
