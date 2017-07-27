%% Lab 2 - Simulink Exercise
% Justin Garcia
% Kim Kuchinka
% Due 9/21/2016

%% Exercise 1
K = 1000;
C = 100;
m = 10;

sim('Simulink_Lab2')
plot(T,X);
%% Exercise 2 - Changing the damping constant.
for C = 50:50:200
    sim('Simulink_Lab2')
    
    plot(T,X);
    hold on
end
    title('Effects of Changing Damping Constant')
    xlabel('Time in Seconds');
    ylabel('Amplitude')
    hold off
    
 %% Exercise 3 - 
 C = 100; 
 freq = 2;
 time_t = 0:0.001:10;
 signal_y = 0.01*sin(2*pi*freq*time_t);
 y_input = [time_t',signal_y'];
 sim('Simulink_Lab2_2')
 plot(time_t,X);
 %% Exercise 4 
 amp_y = .01;
 freq = 0.2:0.1:5;
 Amp_ratio = zeros(1, length(freq));
 amp_x = 0;
 for i = 1:length(freq)
     signal_y = 0.01*sin(2*pi*freq(i)*time_t);
     y_input;
     sim('Simulink_Lab2_2')
     amp_x = max(X(200:1001));

     Amp_ratio(i) = amp_x/amp_y;
%      clear amp_x
     plot(freq(i),Amp_ratio(i))
     hold on
 end
 
 
 %%
 
 
   