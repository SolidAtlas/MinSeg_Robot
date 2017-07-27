file = 'SineWaveData';
time= xlsread(file, 'A:A');
Ym = xlsread(file, 'B:B');
x1_opt = 0;
x2_opt = 0;
MinCumError = inf;

%-------------------------------Promblem 3--------------------------------
x1 =  5:5/99:10;
x2 = 0:pi/(2*99):pi/2;

 for i = 1:length(x1)
        for j = 1:length(x2);
                CumError(i,j) = CalcCumErrorFunction([x1(i) x2(j)]);  
                NewCumError = CalcCumErrorFunction([x1(i) x2(j)]); 
                if  NewCumError < MinCumError
                    clear x1_opt 
                    clear x2_opt 
                    MinCumError = NewCumError;
                    x1_opt =x1(i);
                    x2_opt = x2(j);
                end
        end
 end


 disp(['Estimated amplitude is: ' num2str(x1_opt),' V']);
 disp(['Estimated phase is: ' num2str(x2_opt),' Radians']);
 figure(1);
 surf(x1, x2, CumError)

t_sim=[0:0.001:.099];
y_sim = x1_opt'*sin(2*pi*10.*t_sim + x2_opt); 

  figure(2) 
  subplot(2,1,1);
  plot(t_sim, y_sim ,'-og', 'linewidth',2); 
  subplot(2,1,2);
  plot(time, Ym);  
%-------------------------------Promblem 3--------------------------------
x1_initial = 7.5;
x2_initial = pi/4;
[x_opt f_opt] =fminsearch('CalcCumErrorFunction', [x1_initial x2_initial]);
xopt = find(7<x_opt)
Newxopt =x_opt(xopt) 
xopt2 = find(x_opt<2)
Newxopt2 =x_opt(xopt2) 

disp(['The estimated amplitude after performing the comparison  and phase is: ' num2str(Newxop),' V']);
disp(['The estimated amplitude after performing the comparison and phase is: ' num2str(Newxop2),' radians']);
disp(['The the minimum ComError is: ' num2str(f_opt)]);


%-------------------------------Promblem 3--------------------------------

