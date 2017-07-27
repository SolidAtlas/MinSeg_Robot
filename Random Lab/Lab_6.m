%% Lab 6 Justin Garcia
% 11/2/2016

%%
save ext_dat Postion Velocity Time   % save the data
load ext_dat           % load the data
VelocityRPM = Velocity*2.7778;
vel_smooth = smooth(double(VelocityRPM), 10);
figure(1)
plot(Time,Postion)
figure(2)
plot(Time,VelocityRPM)
hold on
plot(Time,vel_smooth,'g')
xlabel('Time in seconds');
ylabel('RPM');
title('Velocity Response');
legend('Velocity','vel_smooth');
hold off