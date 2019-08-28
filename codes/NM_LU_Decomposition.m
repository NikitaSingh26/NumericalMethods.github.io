fprintf('Welcome to Linear Equation Solution Finder by LU Decomposition Method!! \n\n');
n = input('Enter the number of variables in Linear Equation: ');
format short;
a = zeros(n,n); %coefficient matrix
b = zeros(n,1); %constant matrix
x = zeros(n,1); %variable matrix
y = zeros(n,1); %temporary variable matrix
upper = eye(n,n); %upper triangular matrix
lower = eye(n,n); %lower triangular matrix

%Data input from user:
fprintf('\nEnter the coefficients and equation constant:\n')
for i = 1:1:n
 for j = 1:1:n
  a(i,j) = input(sprintf('Equation %i, Coefficient %i: ',i,j)); 
 end   
 b(i,1) = input(sprintf('\nEquation %i, Constant %i: ',i,i)); 
 fprintf('----------------------------\n\n');
end

%To find upper and lower triangular matrices satisfying A = L x U.
for j = 1:1:n
 for i = 1:1:n   
  if(i >= j)
   sum = 0;
   k =1;
   while(k<j)
    sum = sum + lower(i,k)*upper(k,j);
    k = k+1;
   end
   lower(i,j) = a(i,j) - sum;
  end 
  if(i < j)
   sum = 0;
   k = 1;
   while(k<i)
    sum = sum + lower(i,k)*upper(k,j);
    k = k+1;
   end
   upper(i,j) = (a(i,j)-sum)/lower(i,i);
  end
 end
end

%Equating variables using lower traingular matrix in equation Ly = b:
for p = 1:1:n
 sum = 0;
 q = 1;
 while(q < p)   
  sum = sum + lower(p,q)*y(q,1);
  q = q + 1;  
 end
 y(p,1) = (b(p,1) - sum)/lower(p,p);
end

%Equating variables using upper traingular matrix in equation Ux = y:
x(n,1) = y(n,1);
for r = n-1:-1:1
 var = r;
 sub = 0;
 l = n - r;
 while(l > 0)
  sub = sub + x(var+1,1)*upper(r,var+1);   
  l = l - 1;  
  var = var + 1;
 end   
 x(r,1) = y(r,1) - sub;
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

fprintf('The Coefficient Matrix (A) is:\n')
disp(a)
fprintf('The Constants Matrix (B) in Ax = B is:\n')
disp(b)
fprintf('The Lower Triangular Matrix in A = L x U is:\n')
disp(lower)
fprintf('The Upper Triangular Matrix in A = L x U is:\n')
disp(upper)
fprintf('The (Y) matrix in Ly = B is:\n')
disp(y)
fprintf('The Solution matrix (X) in Ux = y is:\n')
disp(x)
fprintf('The Error Matrix:\n')
disp(err)