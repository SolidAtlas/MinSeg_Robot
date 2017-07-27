function  CumError=CalcCumErrorFunction(x)
time = evalin ('base','time');
Ym = evalin ('base','Ym');

f = 10;

yk = x(1)*sin(2*pi*f*time +x(2));
e = (Ym - yk).^2;
CumError = sum(e);

end



