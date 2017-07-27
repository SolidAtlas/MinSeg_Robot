%save ext_dat vel
%load ext_dat
% time = 0.03;
% for (
% new_pos = pos/time;

%figure, plot(pos)

figure; hold on 
new_vel = vel.*2.833

plot(WindowDat)
plot(new_vel,'r')
title('velocity step response')
xlabel('time (ms)')
ylabel('velocity (RPM)')
