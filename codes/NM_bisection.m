function  m = NM_bisection(f, low, high, tolerance)
fprintf('Welcome to Non-Linear Equation Solution Finder by Bisection Method!! \n\n');

% Evaluating both ends of the interval
y1 = feval(f, low);
y2 = feval(f, high);
i = 0; 

% Error if f(a).f(b) > 0
if y1 * y2 > 0
   disp('Error in function limits as f(a).f(b) < 0 is not satisfied');
   return;
end 

% Updating the limits till tolerance is reached
disp('Iter     a               f(a)             b               f(b)             x0');
while (abs(high - low) >= tolerance)
    i = i + 1;
    % Find a new value to be tested as a root
    m = (high + low)/2;
    y3 = feval(f, m);
    if(y3 == 0)
     fprintf('Root at x = %f \n\n', m);
     return
    end
    fprintf('%2i \t %f \t %f \t %f \t %f \t %f \n', i-1, low, y1, high, y2, m);   
    % Update the limits
    if (y1 * y3 > 0)
      low = m;
      y1 = y3;
    else
      high = m;
      y2 = y3;
    end
end 
fprintf('\n x = %f produces f(x) = %f \n %i iterations\n', m, y3, i-1);
fprintf(' Approximation with tolerance = %f \n', tolerance);