%% Homework 1
% Justin Garcia
% Due: 9/13/2016

%% Problem 1 - Develop a script (and a function) for sine signal identification.
% clear all; close all; clc

ExpData = xlsread('SineWaveData.xlsx');
x1 = ExpData(:,1);
x2 = ExpData(:,2);
M = 5;
f = 10;
phi = 0;


for i = 1:length(x1)
    for j = 1:length(x2)
        x = [x1(i) x2(j)];
        Error(i,j) = SineQuadraticError(x); % This creates a 13x13 matrix
        TotalError = diag(Error);% We take advantage that the diagonal values of this matrix has matching indices, which corresponds to the original matching values we want to calculate together
        TotalError = sum(TotalError); % This is the sum of those thirteen entries
    end
end

%% Problem 2 - Create nested for loops which vary x(1) and x(2) within their given ranges with 100 linearly spaced increments:


ExpData = xlsread('SineWaveData.xlsx');
h1 = ExpData(:,1);
h2 = ExpData(:,2);
f2 = 10;
A = (5:5/99:10);
phi2 = (0:pi/198:pi/2);

for i = 1:100 %length(A)
    for j = 1:100 %length(phi2)
        z = [A(i) phi2(j)];
        MError(i,j) = MinimumSineQuadraticError(z);   
%       MError = MError(:);
        
    end
end
