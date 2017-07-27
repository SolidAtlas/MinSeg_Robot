R  = 10;
L1 = .1;
L2 = .2;
C  = .001;


G_11 = tf([1],[(L1*C) (R*C) 1])
figure(1);
step (G_11)