function  AccumulatedError = MinErrorFunction(x)
t = evalin ('base','h1');
Volts = evalin ('base','h2');
f = evalin('base','f2');

yk = x(1)*sin(t.*2*pi*f + x(2));
Error = (Volts - yk).^2;
AccumulatedError = sum(Error);
CumErrorTrace = evalin('base','CumErrorTrace');
CumErrorTrace = [CumErrorTrace AccumulatedError];
assignin('base','CumErrorTrace',CumErrorTrace);

end

