Motor_Parameters;
RADSEC2RPM = 60/(2*pi);
Tsim_final= .3;
sim_step_size = .0001;
sim('Sim_Motor_Response1')

figure(1)
hold on
h1 = plot(tsim, w_1st*RADSEC2RPM, 'blue');
h2 = plot(tsim, w_2nd*RADSEC2RPM, 'red');
htf = plot(tsim, w_Tf*RADSEC2RPM, 'green');

Bm = 0;
Tf=0;
sim('Sim_Motor_Response1')
h1_nf = plot(tsim, w_2nd*RADSEC2RPM, 'c--');
h2_nf = plot(tsim, w_Tf*RADSEC2RPM, 'm--');

xlabel('Time (seconds)')
ylabel('angular celocity (RPM) - imput 405v step')

legend('1st order - viscous only', '2nd order - viscous only', '1st order - coulomb',...
    '1st order - no coulomb no viscous','2st order no viscous')

%Comparison of the first order system response for the case of having no
%viscous and no Coulomb? Intialy the first order with no viscous or no
%coulomb merges with all plots. In about 25rpm the garphs seperate and go
%through different paths. Despite the graphs seperating the first order with no viscous no
%coulomb merges with the 2nd order no viscous graph. As a result the order
%no visous graph and the first orde no viscous no coulomb have the samge
%graph; in addition, the have the hightest angular volocity compare to the
%rest of the graphas. The term that can be ignored without comprimising the
%accuracy is encoder_counts. In terms of examining the graph the terms that
%can be ignored are 