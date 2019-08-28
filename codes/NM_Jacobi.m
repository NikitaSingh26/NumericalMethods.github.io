fprintf('Welcome to Linear Equation Solution Finder by JACOBI''s Iterative Method!! \n\n');
n = input('Enter the number of variables in Linear Equation: ');
format short;
a = zeros(n,n); %coefficient matrix
b = zeros(n,1); %constant matrix
a1 = zeros(n,n); %to store data of [a] which can be further modified
b1 = zeros(n,1); %to store data of [b] which can be further modified
x = zeros(n,1); %variable matrix
x0 = zeros(n,1); %initial guesses by the user

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

fprintf('\nThe diagonally dominant coefficient matrix:\n')
disp(a1)
fprintf('The diagonally dominant constants matrix:\n')
disp(b1)

d = zeros(n,n); %diagonal matrix of A
c = zeros(n,n); %C = A - D
err = zeros(n,1); %Error Matrix
dInv = zeros(n,n); %Inverse of Diagonal Matrix

for i = 1:1:n
 d(i,i) = a1(i,i);
 dInv(i,i) = d(i,i)^(-1);
end
c = a1 - d;
err = abs(dInv*(b1 - a1*x0));
fprintf('Error matrix based on initial guesses by the user:\n');
disp(err);
fprintf('--------------------------------\n')
iteration = 0;

while(err(1,1) > 0.01 | err(n,1) > 0.01)
 iteration = iteration + 1;
 x = (-1*(dInv*c))*x0 + dInv*b1;
 x0 = x;
 err = abs(dInv*(b1 - a1*x0));
 fprintf('After %i iteraion, The Solution matrix:\n',iteration);
 disp(x0);
 fprintf('Error matrix after %i iteraion:\n',iteration);
 disp(err);
 fprintf('--------------------------------\n')
end
