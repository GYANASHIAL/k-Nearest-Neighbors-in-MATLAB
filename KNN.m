%In this problem, you need to implement KNN algorithm.
%The inputs: data from train-KNN and test-KNN
%            In the datasets, the first column is your horizontal coordinate(x axis), 
%            the second column is your vertical coordinate(y axis), 
%            the third column represents the data label.       
%
%
%The outputs: plot of original data,
%             plots of your classification results after implementing KNN
%             algorithm with K= 1, 2, 5, 20,
%             error rate of classification results with K= 1, 2, 5, 20.
%              
%Load the training data and plot it.
%To better recognize your results during grading process, here you are
%required to use "o" to represent label 1, use "+" to represent label 2, 
%and use "*" to represent label 3.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Starts Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear all;
load('train-KNN.mat');
x = a(:,1);
y = a(:,2);
z = a(:,3);
train_data = [x,y];
m = length(z);
x1 = []; y1 = [];
x2 = []; y2 = [];
x3 = []; y3 = [];
for i = 1:m
    if(z(i) == 1)
        x1 = [x1 x(i)];
        y1 = [y1 y(i)];
    end
     if(z(i) == 2)
         x2 = [x2 x(i)];
         y2 = [y2 y(i)];
     end
      if(z(i) == 3)
           x3 = [x3 x(i)];
            y3 = [y3 y(i)];
        end
end
figure(1);
plot(x1,y1,'o','MarkerSize',10);
hold on;
plot(x2,y2,'+','MarkerSize',10);
hold on;
plot(x3,y3,'*','MarkerSize',10);
title('Training Data');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Ends Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%Implement KNN algorithm with your testing data(remember you need to consider
%both l1 distance and l2 distance) and save the classification results in
%test_label_l1 and test_label_l2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Starts Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('test-KNN.mat');
test_data = B;
K = [1,2,5,20];
sort_L1 = [];
sort_L2 = [];
Z1 = [];
Z2 = [];

for k = 1:length(K)
    test_label_l1 = [];
    test_label_l2 = [];
    m = K(k);
for i = 1:size(B,1)
    c1_1 = 0; c2_1 = 0; c3_1 = 0; c1_2 = 0; c2_2 = 0; c3_2 = 0;
    l1 = sum(abs((B(i,:)-train_data)),2);
    l2 = sqrt(sum((B(i,:)-train_data).^2,2));
    [L1, I] = sort(l1);
    [L2, J] = sort(l2);
    L1 = [L1 I];
    L2  = [L2 J];
    L1 = L1(1:m,:);
    L2 = L2(1:m,:);
    
    for j = 1:m
        Z1(j) = z(L1(j,2));
        Z2(j) = z(L2(j,2));
    end
    test_label_l1 = [test_label_l1; mode(Z1)];
    test_label_l2 = [test_label_l2; mode(Z2)];
end
test_data = [test_data,test_label_l1,test_label_l2];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Ends Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% 
% %Plot your classification results (i.e. test_label_l1 & test_label_l2), 
% %See Lecture 2 page 43/47 as a reference.
% %Remember to indicate your distance type and K values
% %To better recognize your results during grading process, here you are
% %required to use "o" to represent label 1, use "+" to represent label 2, 
% %and use "*" to represent label 3.
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%         Your Code Starts Here         %%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
K = [1,2,5,20];
    k = 1; 
for p = 3:2:9
    z = test_data(:,p);
    x = test_data(:,1);
    y = test_data(:,2);

m = 40000;
x1 = []; y1 = [];
x2 = []; y2 = [];
x3 = []; y3 = [];
for i = 1:m
    if(z(i) == 1)
        x1 = [x1 x(i)];
        y1 = [y1 y(i)];
    end
     if(z(i) == 2)
         x2 = [x2 x(i)];
         y2 = [y2 y(i)];
     end
      if(z(i) == 3)
           x3 = [x3 x(i)];
            y3 = [y3 y(i)];
        end
end
figure();
plot(x1,y1,'o','MarkerSize',10);
hold on;
plot(x2,y2,'+','MarkerSize',10);
hold on;
plot(x3,y3,'*','MarkerSize',10);
str = sprintf('L1 plots for k = %d',K(k));
title(str);
k = k+1;
end
 K = [1,2,5,20];
    k = 1;
for p = 4:2:10
   
    z = test_data(:,p);
    x = test_data(:,1);
    y = test_data(:,2);

m = 40000;
x1 = []; y1 = [];
x2 = []; y2 = [];
x3 = []; y3 = [];
for i = 1:m
    if(z(i) == 1)
        x1 = [x1 x(i)];
        y1 = [y1 y(i)];
    end
     if(z(i) == 2)
         x2 = [x2 x(i)];
         y2 = [y2 y(i)];
     end
      if(z(i) == 3)
           x3 = [x3 x(i)];
            y3 = [y3 y(i)];
        end
end
figure();
plot(x1,y1,'o','MarkerSize',10);
hold on;
plot(x2,y2,'+','MarkerSize',10);
hold on;
plot(x3,y3,'*','MarkerSize',10);
str = sprintf('L2 plots for k = %d',K(k));
title(str);
k = k+1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%         Your Code Ends Here         %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

