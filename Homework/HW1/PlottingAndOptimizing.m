%% Surface plotting of the quadratic function disscussed in the class
clear all; close all; clc

x1 = [5:0.1:15];
x2 = [10:0.1:20];

yout = [];
for i = 1:length(x1)
    for j = 1:length(x2)
        x = [x1(i) x2(j)];
        y(i,j) = OurQuadraticFunction(x);
    end
end

figure(1); 
surf(x1, x2, y)
xlabel('x1')
ylabel('x2')
zlabel('y')
title('Surface Plot of the Quadratic Function')

%% Optimization of the function using Nelder-Mean Simplex Search algorithm
yout = [];
[x_opt y_opt] = fminsearch('OurQuadraticFunction',[15 20]);
figure(2);
plot(yout,'linewidth',2)
xlabel('Number of function evaluations')
ylabel('Cost function value')
title('Optimization of the Quadratic Cost Function')

%% Appendix: Quadratic Function code
% function y = OurQuadraticFunction(x)
%     % A function file always starts with this line: function outVar = functionName(inputVar)
%     % Use the same filename as functionName when saving the function file
%     % To access a function, it needs to be either in the Matlab's current
%     % directory or in a directory added to Matlab's path-list
%     
%     yout = evalin('base','yout'); % Reads variable "yout" from the workspace and assigns it to "yout" inside the function 
% 
%     y1 = (x(1)-10)^2;
%     y2 = (x(2)-15)^2;
%     y = y1 + y2; 
%     
%     yout = [yout y]; % Appends the new function evaluation to the previous ones in the "yout" vector
%     assignin('base','yout',yout); % Sends the updated "yout" back to workspace   
% end
