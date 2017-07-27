R= 5;
mw= 0.025;
mp= 0.285;
l= 0.1;
rw= .022;
g= 9.81;
Jp=0.0010;
Jw = 0.0013;
C=0.0001;
kb=.5;
kt=0.3;
M=[(Jw/(rw.^2))+mp+mw mp*l;mp*l Jp+mp*l.^2];
D=[(C/(rw.^2))+(kt*kb)/(R*rw.^2) 0;-(C/(rw))-(kt*kb)/(R*rw) 0];
K=[0 0;0 -mp*g*l];
F=[kt/(R*rw); -kt/R];
A=[zeros(2,2) [1 0;0 1] ; -inv(M)*K -inv(M)*D]
B=[zeros(2,1); inv(M)*F]
p=[-8 -8 -8 -8];
K=acker(A,B,p);
[-1 -1.2 -1.5 -2];
figure(1)
plot(data)

x1 = eig(A)
eig(A-B*K)

% part 3
Q = [1 0 0 0;0 100 0 0; 0 0 1 0; 0 0 0 100];

k_lqr = lqr(A,B,Q, 1,0)

