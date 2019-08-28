fprintf('Welcome to Linear Equation Solution Finder by GAUSS JORDAN Method!! \n\n');
n = input('Enter the number of variables in Linear Equation: ');
format short;
a = zeros(n,n); %coefficient matrix
b = zeros(n,1); %constant matrix
x = zeros(n,1); %variable matrix
a1 = zeros(n,n); %to store data of [a] which can be further modified
b1 = zeros(n,1); %to store data of [b] which can be further modified

%Data input from user:
fprintf('\nEnter the coefficients and equation constant:\n')
for i = 1:1:n
 for j = 1:1:n
  a(i,j) = input(sprintf('Equation %i, Coefficient %i: ',i,j)); 
 end   
 b(i,1) = input(sprintf('\nEquation %i, Constant %i: ',i,i)); 
 fprintf('----------------------------\n\n');
end
%converting [a1] to  triangular matrix, also modifying [b1]
a1 = a;
b1 = b;
for p = 1:1:n-1
 c = double(a1(p,p));  
 a1(p,:) = a1(p,:)/c;
 b1(p,1) = b1(p,1)/c;
 for q = p+1:1:n
  d = double(a1(q,p));   
  a1(q,:) = a1(q,:) - d*a1(p,:); 
  b1(q,1) = b1(q,1) - d*b1(p,1);
 end
end
e = a1(n,n);
a1(n,:) = a1(n,:)/e;
b1(n,1) = b1(n,1)/e;

%converting triangular matrix to identity matrix
for u = n-1:-1:1
 v = u;
 while (v >= 1)
  f = a1(v,u+1);   
  a1(v,:) = a1(v,:) - a1(u+1,:)*f;
  b1(v,1) = b1(v,1) - b1(u+1,1)*f;
  v = v-1;
 end 
end    

%Equating variables using identity matrix so formed
for k = n:-1:1
 x(k,1) = b1(k,1);
end


%Error matrix
err = zeros(n,1);
for s = 1:1:n
 Ecalc = 0;
 for t = 1:1:n
 Ecalc = Ecalc + a(s,t)*x(t,1);
 end
 err(s,1) = abs(b(s,1) - Ecalc); 
end

fprintf('The Coefficient Matrix:\n')
disp(a)
fprintf('The Constants Matrix:\n')
disp(b)
fprintf('After transformation,the Coefficient Matrix turning into Identity Matrix:\n')
disp(a1)
fprintf('After transformation, the Constants Matrix:\n')
disp(b1)
fprintf('The Solution matrix is:\n')
disp(x)
fprintf('The Error Matrix:\n')
disp(err)