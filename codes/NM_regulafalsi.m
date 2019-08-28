function root = NM_regulafalsi(f,a,b,tolerance)
    i = 0;
    tolerance = 1e-6;
    fx = 1;
    fprintf('Welcome to Non-Linear Equation Solution Finder by Regula Falsi Method!! \n');
    fprintf('The function is: xln(x)-1 \n\n');
    disp('Iteration       a          b          x          f(a)          f(b)             f(c)');
    disp('=========    =======    =======    =======    ==========    ==========       ========');
    while(fx > tolerance)
        i = i + 1;
        if (f(a) == f(b))
            fprintf('Function has the same value on a and b on iteration %d\n', Iter);
            disp('Denominator in Regula falsi is zero');
            root = 'Regula falsi can''t compute the root';
            beep
            disp('Go for another iteration');
            return;
        end
        c = a - ((f(a)*(b-a))/(f(b) - f(a)));
        fprintf('%3d%17.4f%11.4f%11.4f%14.4f%14.4f%14.4f\n', i,a,b,c,f(a),f(b),f(c));
        
        if(f(c)*f(a) > 0)
            b = c;
            fx = abs(f(b));
            root = b;
        else
            a = c;
            fx = abs(f(a));
            root = a;
        end
    end
    fprintf('\n x = %f produces f(x) = %f \n %i iterations\n', root, fx, i-1);
    fprintf(' Approximation with tolerance = %f \n', tolerance);
end
