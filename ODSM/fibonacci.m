%array to get values of our function
z = -5:.001:5;

% our function y=x^2  + 3x + 7
y = z.^2+3*z+7;

%number of iterations, feel free to change
iter = 5;
epsilon=0.05; %epislon to prevent double value at last iteration

% Fibonacci calculation sequence
fib = zeros(1,iter+2);
fib(1)=1;
fib(2)=1;
for i =3:iter+2
   fib(i) = fib(i-1)+fib(i-2) ;
end
rho = zeros(1,iter);

%calculate z values from above Fibonacci Sequence
for i=0:iter
   rho(i+1) =  1-(fib(end-i-1)/fib(end-i)) ;
end

%our  search interval
x1=-3;
x2=1;

%finding our first two internal points
x3 = x1+rho(1)*(x2-x1);
x4 = x1 +(1-rho(1))*(x2-x1);

x30 = x1+rho(1)*(x2-x1);
x40 = x1 +(1-rho(1))*(x2-x1);


for i = 1:iter-1
    %function evals
 fx3 = x3.^2+3*x3+7; 
 fx4 = x4.^2+3*x4+7;
 if rho(i+1)==0.5 % double point prevention
     rho(i+1)= 0.5-epsilon;
 end
 %choosing correct interval
 if fx3>fx4
    x1=x3;
    x3=x4;
    x4 = x1 +(1-rho(i+1))*(x2-x1);
 else
    x2=x4;
    x4=x3;
    x3 = x1+rho(i+1)*(x2-x1);
 end
 tol = abs(x3-x4);
 x3a(i) = x3;
 x4a(i)=x4;
end

min = (x3+x4)/2 %our "boxed in" min
minf = min.^2+3*min+7 % our function evaluated at our min

%plot our results
plot(z,y,-3,y,3,y,x30,y,'g',x40,y,'g',x3a(1),y,'r',x4a(1),y,'r',x3a(2),y,'c',x4a(2),y,'c',x3a(3),y,'y',x4a(3),y,'y',x3a(4),y,'m',x4a(4),y,'m')
title('Fibonacci example')
xlabel('x')
ylabel('y')