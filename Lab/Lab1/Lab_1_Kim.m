%% ME 190 Lab 1 - MATLAB Refresher and Data Handling
% Group 1 - Justin Garcia and Kimberly Sue Kuchinka
% Name - Kimberly Sue Kuchinka
% Lab Section 4

%% Summary

%% Exercise 1: Matrix Generation and Manipulation
B = 5:13;
C = 13:-1:5;
D = B.*C;
E = [B(1:3),C(4:6),D(7:9)];
F = [B(1:3);C(4:6);D(7:9)];
G = [linspace(10,100,10);logspace(1,2,10)];

%% Exercise 2 - Simple Indexing

x = -100:100;
y = x.^3 + 60*x.^2 -50;

miny = min(y);
maxy = max(y);

negmaxy = max(y(y<0));
posminy = min(y(y>0));

indexnegmaxy = find(y== -50);
indexposminy = find(y == 9);

firstindexpos = find(y > 0,1);
firstposy = y(42);

yzero2thousand = find(y>0 & y<1000);
valyzero2thousand = y(yzero2thousand);

%% Exercise 3 - Multiplication Table

%% Part A - Times Table
% table size
row=5;
col=5;

x2 = 1:col;
y2 = (1:row)';
z = y2*x2;

% generate table and output
table = z;

zmiddle = z(2:end-1,2:end-1);
zvector = zmiddle(:);
zsum = sum(zvector);


%% Part - B
row2 = 6;
col2 = 7;

x3 = 1:col2;
y3 = (1:row2)';
z2 = y3*x3;

table67 = z2;
zmiddle2 = z2(2:end-1,2:end-1);
zvector67 = zmiddle2(:);
zsum67 = sum(zvector67);

%% Part - C

row3 = 10;
col3 = 10;

x4 = 1:col3;
y4 = (1:row3)';
z3 = y4*x4;

table10 = z3;
vector10x10 = table10(:);
vector10x10 = find(vector10x10 > 20 & vector10x10 < 70);
size(vector10x10);




