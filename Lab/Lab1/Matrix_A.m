A = xlsread('Lab1Excel.xlsx');

figure(1);
ax1 = subplot(2,1,1);
sin = plot(A(:,1),A(:,2),'b','LineWidth',2);
hold on;
cos = plot(A(:,1),A(:,3),'--r','LineWidth',2);
title('Sine and Cosine');
xlabel('x values');
ylabel('y values');
ax2 = subplot(2,1,2);
exp = plot(A(:,1),A(:,4),'og','LineWidth',2);
axis(ax2,[0 2 0 10]);
title('Exponential');
xlabel('x values');
ylabel('y values');


