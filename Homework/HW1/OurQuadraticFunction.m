function y = OurQuadraticFunction(x)
    % A function file always starts with this line: function outVar = functionName(inputVar)
    % Use the same filename as functionName when saving the function file
    % To access a function, it needs to be either in the Matlab's current
    % directory or in a directory added to Matlab's path-list
    
    yout = evalin('base','yout'); % Reads variable "yout" from the workspace and assigns it to "yout" inside the function 

    y1 = (x(1)-10)^2;
    y2 = (x(2)-15)^2;
    y = y1 + y2; 
    
    yout = [yout y]; % Appends the new function evaluation to the previous ones in the "yout" vector
    assignin('base','yout',yout); % Sends the updated "yout" back to workspace   
end
