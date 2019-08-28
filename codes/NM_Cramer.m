fprintf('Welcome to Linear Equation Solution Finder by CRAMER''s Rule!! \n\n');
n = input('Enter the number of variables in Linear Equation: ');
a = zeros(n,n);
b = zeros(n,1);
x = zeros(n,1);

a1 = zeros(n,n);

fprintf('\nEnter the coefficients and equation constant:\n')
for i = 1:1:n
 for j = 1:1:n
  a(i,j) = input(sprintf('Equation %i, Coefficient %i: ',i,j)); 
 end   
 b(i,1) = input(sprintf('\nEquation %i, Constant %i: ',i,i)); 
 fprintf('----------------------------\n\n');
end

A = det(a);
for m = 1:1:n
 a1 = a;   
 for d = 1:1:n
  a1(d,m) = b(d,1);
 end
 x(m,1) = det(a1)/A;
end

fprintf('\nThe Coefficient Matrix:\n')
disp(a)
fprintf('The Constants Matrix:\n')
disp(b)
fprintf('The solution matrix is:\n')
disp(x)