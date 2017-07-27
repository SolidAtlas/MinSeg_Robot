%% Homework #4, Justin Garcia
% Problem 1
L1 = 0.1;
L2 = 0.2;
R = 10;
A = [(-2*R/L1),(- R/L1);(-R/L2),(- R/L2)];
B = [(1/L1), 0; 0, (1/L2)];
C = [1, 0; 0, 1];
D = [0, 0; 0, 0];
StepProblem1 = ss(A,B,C,D);
figure(1)
step(StepProblem1)
%%
% Problem 2
L1 = 0.1;
L2 = 0.2;
R = 10;
Ca = .001;
A2 = [(-R/L1),(-R/L1),(-1/(Ca*L1)); (-R/L2),(-R/L2),0 ;1,0,0];
B2 = [(1/L1),0; 0,(1/L2);0,0];
C2 = [1,0,0;0,1,0];
D2 = [0,0;0,0];
StepProblem2 = ss(A2,B2,C2,D2);
figure(2)
step(StepProblem2)