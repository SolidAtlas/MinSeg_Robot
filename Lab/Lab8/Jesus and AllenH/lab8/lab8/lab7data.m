save ext_data pos vel
load ext_data
figure,plot(pos)
figure,plot(vel)
vel_smooth=smooth(double(vel), 10);
figure(1),plot(vel_smooth,'red')
hold on

% plot(vel,'blue')
ave(vel_smooth)