%% Function File Minimal Quadratic Error

function MError = MinimumSineQuadraticError(z)

%   M = evalin('base','M');
    f2 = evalin('base','f2');
%     phi = evalin('base','phi');
    h1 = evalin('base','h1');
    h2 = evalin('base','h2');

for i = 1:length(h1)
    for j = 1:length(h2)
        h = [h1(i) h2(j)];
%         Error(i,j) = SineQuadraticError(x); % This creates a 13x13 matrix
%         TotalError = diag(Error);% We take advantage that the diagonal values of this matrix has matching indices, which corresponds to the original matching values we want to calculate together
%         TotalError = sum(TotalError); % This is the sum of those thirteen entries 

yk = z(1)*sin(h(1))*2*pi*f2 + z(2);
    
    MError = ((h(2)) - yk)^2;
    assignin('base','yk',yk);

    end
end
  

end