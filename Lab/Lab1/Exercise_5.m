A = xlsread('Lab1Excel.xlsx');
figure(2);
sin2 = plot(A(:,1),A(:,2),'b','LineWidth',2);
axis(sin2, [0 10 -1 1]);
% 6th order polynomial is the lowest polynomial order that provides a
% reasonable fit
