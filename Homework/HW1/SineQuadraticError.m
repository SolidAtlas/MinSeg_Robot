%% Function File : Sine Quadratic Error

% Appendix: Quadratic Function code
function Error = SineQuadraticError(x)
    % A function file always starts with this line: function outVar = functionName(inputVar)
    % Use the same filename as functionName when saving the function file
    % To access a function, it needs to be either in the Matlab's current
    % directory or in a directory added to Matlab's path-list
    
    
    M = evalin('base','M');
    f = evalin('base','f');
    phi = evalin('base','phi');
   
    
    
    ym = x(2);
    yk = M*sin(2*pi*f*(x(1)) + phi);
    Error = (ym - yk)^2; 
    
    
end
