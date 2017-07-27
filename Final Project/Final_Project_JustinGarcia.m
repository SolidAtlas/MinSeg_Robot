%% Final Project Justin Garcia
%Start of the Matlab portion 
%1.6 (In This section all constants are etimated)

% Constants of World
g    = 9.81; % meters per second squared

% Constants of wheel

r_wh = .022; %about three quarters of an inch
M_wh = .025;
J_wh = .0013;
% Contants of Pendulum

L_p  = .1;
M_p  = .285;
J_p  = .001;
%Constants of Motor
K_b  = .5;
K_t  = .3;
C    = .0001;
R    = 5; %Ohms

%State Space Equation Matrices: M(Xdd)+D(Xd)+K(X)=F(U)
M    = [((J_wh)/(r_wh^2))+M_wh+M_p M_p*L_p;-M_p*L_p -(J_p+(M_p*(L_p^2)))];
D    = [((K_t*K_b)/(R*r_wh^2))+(C/(r_wh^2)) 0; (C/r_wh)+(((K_b*K_t)/(R*r_wh))) 0];
K    = [0 0; 0 M_p*g*L_p];
F    = [K_t/(R*r_wh);K_t/R];

%Converting
I    = [1 0;0 1];
A_zero= [0 0;0 0];
B_zero= [0;0];
                   %Matrices for the State-Space Solution
A    = [A_zero I; -inv(M)*K -inv(M)*D];
B    = [B_zero;inv(M)*F];
C    = eye(4);
D2   = [0;0;0;0];

p=[-8 -8 -8 -8];
K=acker(A,B,p);
[-1 -1.2 -1.5 -2];
figure(1)
 plot(data)

x1 = eig(A);
eig(A-B*K);



%%
Q = [1 0 0 0;0 100 0 0; 0 0 1 0; 0 0 0 100];
R = 1; 
N = 0;
[Klqr,S,e] = lqr(A,B,Q,R,N);

%% Part 4

Friction_bias = 50;
Gyro_bias = 0;
