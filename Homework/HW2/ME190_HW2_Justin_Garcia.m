%% Homework #2   Justin Garcia
% Due Sept 22, 2016 
%% Problem #2
% The setup for this (Problem 1) can be found in the appendix.
m = .2;
Kp = 100;
Ki = 5;
Kd = 10;

t = 0:.01:10;
sim('ME190_HW2_Justin_Garcia_StepInput')
figure(1)
plot(T,R)
hold on
plot(T,Y)
title('Input and Output over time')
xlabel('time')
ylabel('amplitude')

%% Problem 3, Setting Ki = 0, and bringing overshoot within 5%

m = .2;
Kp = 100;
Ki = 0;
Kd = 7;

t = 0:.01:10;
sim('ME190_HW2_Justin_Garcia_StepInput')
figure(2)
plot(T,R)
hold on
plot(T,Y)
title('Damping Constant of 7,Responsive,Minimal Overshoot')
xlabel('time')
ylabel('amplitude')
%% Problem 4, Tracking Error
m = .2;
Kp = 100;
Ki = 0;
Kd = 7;

t = 0:.01:10;
sim('ME190_HW2_Justin_Garcia_SineInput')
figure(3)
plot(T,R)
hold on
plot(T,Y)
plot(T,R-Y)
title('Plotting Input, Response, and Tracking Error')
xlabel('time')
ylabel('amplitude')
%% Problem 5
m = .2;
Kp = 1000;
Ki = 0;
Kd = 20;

t = 0:.01:10;
sim('ME190_HW2_Justin_Garcia_StepInput')
subplot(2,1,1)
plot(T,R)
hold on
plot(T,Y)
title('Kp = 1000, finding best damping constant')
xlabel('time')
ylabel('amplitude')
hold off


sim('ME190_HW2_Justin_Garcia_SineInput')
subplot(2,1,2)
plot(T,R)
hold on
plot(T,Y)
plot(T,R-Y)
title('Plotting Input, Response, and Tracking Error')
xlabel('time')
ylabel('amplitude')

%% Problem 6 (optional)
Kp = 1000;
Kd = 20;
sim('ME190_HW2_Justin_Garcia_StepInput')
figure(6)
subplot(2,2,1)
plot(T,R)
hold on
plot(T,Y)
title('Kp = 1000')
xlabel('time')
ylabel('amplitude')

sim('ME190_HW2_Justin_Garcia_SineInput')
subplot(2,2,2)
plot(T,R)
hold on
plot(T,Y)
plot(T,R-Y)
title('Plotting Input, Response, and Tracking Error')
xlabel('time')
ylabel('amplitude')

subplot(2,2,3)
plot(T,Ydd)
title('U(t)')
%--------------------------------------------------------------------------
Kp = 100;
Kd = 7;
sim('ME190_HW2_Justin_Garcia_StepInput')
figure(7)
subplot(2,2,1)

plot(T,R)
hold on
plot(T,Y)
title('Kp = 100')
xlabel('time')
ylabel('amplitude')

sim('ME190_HW2_Justin_Garcia_SineInput')
subplot(2,2,2)
plot(T,R)
hold on
plot(T,Y)
plot(T,R-Y)
title('Plotting Input, Response, and Tracking Error')
xlabel('time')
ylabel('amplitude')

subplot(2,2,3)
plot(T,Ydd)
title('U(t)')

%% Appendix

open_system('ME190_HW2_Justin_Garcia_StepInput')


open_system('ME190_HW2_Justin_Garcia_SineInput')

