%% Homework 6 Justin Garcia
%Due November 1,2016
%ME 190


%load motor parameters:
Motor_Parameters;

% conversion factor
RADSEC2RPM = 60/(2*pi);

%Simulation Parameters
Tsim_final= .3; %Final Simulation Time
sim_step_size = .0001; %Simulation Step Size

%Simulate the Model
sim('Motor_Step_Response_Linear_1st_2nd_Coulomb')

%Plot the Response in RPM
figure(2)
hold on
h1 = plot(T, W_First*RADSEC2RPM, 'blue');
h2 = plot(T, W_Second*RADSEC2RPM, 'red');
htf = plot(T, W_Tf*RADSEC2RPM, 'green');

%Simulate with no Friction and Plot
Bm = 0;
Tf = 0;
sim('Motor_Step_Response_Linear_1st_2nd_Coulomb')
h1_nf = plot(T, W_Second*RADSEC2RPM, 'c--');
h2_nf = plot(T, W_Tf*RADSEC2RPM, 'm--');

xlabel('Time (seconds)')
ylabel('angular celocity (RPM) - input 405v step')

legend([h1 h2 htf h1_nf h2_nf],{'1st order - viscous only','2nd order - viscous only', '1st order - coulomb','1st order - no coulomb no viscous','2st order no viscous'})

%% Conclusions
%From the graph we can see that the viscous friction terms do little to
%change the overall value of the output and for simplicity can be ignored.
%There was little difference also between the 1st and 2nd order models due
%to the impedance be so low(.004H). The coulomb forces significantly
%decreased the output of the 1st order transfer function so we should
%include it in any analysis for real world applications.
open_system('Motor_Step_Response_Linear_1st_2nd_Coulomb')
