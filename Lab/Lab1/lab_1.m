%% ME 190 Lab 1- MatLab Refresher and Data Handling
% Justin Garcia
% 9/2/2016
% Lab Section 4

%% Summary
% In this lab my partner and I learned to use the bbasic functions of
% MatLab to create vectors and matrices and manipulate their contents. We
% also used the linspace and logspace commands to create large vectors with
% regular spacing. This lab was also an opportunity to learn how to create
% basic scripts and generating a lab report using the publish feature. My
% partner and I also learned how to read in data from Microsoft Excel and
% how to plot data and create graphs that overlapped and had different line
% representations.
% In order to accomplish the tasks, we used the handouts that were referred
% to in the lab manual as well as the resources provided by MatLab online
% to correctly enter commands into the console.
% I am happy with the instruction provided by this lab and learned how to
% use the basic elements of MatLab. The power of the software makes me want
% to learn more. 

%--------------------------------------------------------------------------
%% Exercise 1 - Matrix Generation and Manipulation
B = 5:13
C = 13:-1:5
D = B.*C
E = [B(1:3),C(4:6),D(7:9)]
F = [B(1:3);C(4:6);D(7:9)]
G = [linspace(10,100,10);logspace(1,2,10)]
%--------------------------------------------------------------------------
%% Exercise 2 - Simple Indexing

x = -100:100;
y = x.^3 + 60*x.^2 -50;

miny = min(y)
maxy = max(y)

negmaxy = max(y(y<0))
posminy = min(y(y>0))

indexnegmaxy = find(y== -50)
indexposminy = find(y == 9)

firstindexpos = find(y > 0,1)
firstposy = y(42)

yzero2thousand = find(y>0 & y<1000)
valyzero2thousand = y(yzero2thousand)
%--------------------------------------------------------------------------
%% Exercise 3 - Multiplication Table
%% Part A - Times Table
% table size
row=5
col=5

x2 = 1:col
y2 = (1:row)'
z = y2*x2

% generate table and output
table = z

zmiddle = z(2:end-1,2:end-1)
zvector = zmiddle(:)
zsum = sum(zvector)


%% Part - B
row2 = 6
col2 = 7

x3 = 1:col2
y3 = (1:row2)'
z2 = y3*x3

table67 = z2
zmiddle2 = z2(2:end-1,2:end-1)
zvector67 = zmiddle2(:)
zsum67 = sum(zvector67)

%% Part - C

row3 = 10
col3 = 10

x4 = 1:col3
y4 = (1:row3)'
z3 = y4*x4

table10 = z3
vector10x10 = table10(:)
vector10x10 = find(vector10x10 > 20 & vector10x10 < 70)
size(vector10x10)
%--------------------------------------------------------------------------

%% Problem 4

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
%--------------------------------------------------------------------------

%% Problem 5

A = xlsread('Lab1Excel.xlsx');
figure(2);
sin2 = plot(A(:,1),A(:,2),'b','LineWidth',2);
axis(sin2, [0 10 -1 1]);
% 6th order polynomial is the lowest polynomial order that provides a
% reasonable fit

