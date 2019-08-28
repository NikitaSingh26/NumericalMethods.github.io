fprintf('Welcome to Linear Equation Solution Finder by GAUSS SEIDEL''s Iterative Method!! \n\n');
n = input('Enter the number of variables in Linear Equation: ');
format short;
a = zeros(n,n); %coefficient matrix
b = zeros(n,1); %constant matrix
a1 = zeros(n,n); %to store data of [a] which can be further modified
b1 = zeros(n,1); %to store data of [b] which can be further modified
x = zeros(n,1); %variable matrix
x0 = zeros(n,1); %initial guesses by the user
err = zeros(n,1);

%Data input from user:
fprintf('\nEnter the coefficients and equation constant:\n')
for i = 1:1:n
 for j = 1:1:n
  a(i,j) = input(sprintf('Equation %i, Coefficient %i: ',i,j)); 
 end   
 b(i,1) = input(sprintf('\nEquation %i, Constant %i: ',i,i)); 
 fprintf('----------------------------\n');
end
for j = 1:1:n
 x0(j,1) = input(sprintf('Initial guess for x%i: ',j));   
end

%partial pivoting - rearranging the equations
ctr = 0;
flag = 0;
for r=1:1:n 
 max = 0;
 u = 1;
 while(u <= n)
  if(u ~= flag)   
   if(a(u,r)>max)
    max = a(u,r);
    a1(r,:) = a(u,:);
    b1(r,1) = b(u,1);
    ctr = u;
   end
  end
  u = u + 1;
 end
 flag = ctr;
end
fprintf('\nThe coefficient matrix entered:\n')
disp(a)
fprintf('\nThe diagonally dominant coefficient matrix:\n')
disp(a1)
fprintf('The diagonally dominant constants matrix:\n')
disp(b1)

%calculating after first iteration using user provided initial guesses
 for i = 1:1:n
  sum = 0;
  for j = 1:1:n
   if(i ~= j)
    sum = sum + a1(i,j)*x0(j,1);
   end    
  end
  x(i,1) = (b1(n,1) - sum)/a1(i,i);
  err(i,1) = abs(x(i,1) - x0(i,1));
  x0(i,1) = x(i,1);
 end  

%iterations till error > 0.001 
iteration = 0;
while(err(1,1) > 0.001 | err(n,1) > 0.001)
 iteration = iteration + 1;
 for i = 1:1:n
  sum = 0;
  for j = 1:1:n
   if(i ~= j)
    sum = sum + a1(i,j)*x0(j,1);
   end    
  end
  x(i,1) = (b1(n,1) - sum)/a1(i,i);
  err(i,1) = abs(x(i,1) - x0(i,1));
  x0(i,1) = x(i,1);
 end  
 fprintf('After %i iteraion, The Solution matrix:\n',iteration);
 disp(x);
 fprintf('Error matrix after %i iteraion:\n',iteration);
 disp(err);
 fprintf('--------------------------------\n')
end
