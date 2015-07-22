%array to get values of our function
z = -8:.001:5;

% our function x^4 -(x)^3+cos(x)-12
l = z.^4-(z-3).^3+cos(z)-12;


%% Newton's Method
tol = 1;
%initialize arrays to store step values
x = zeros(1,6);
y = zeros(1,6);
%initial guess
x(1)=2;
y(1) = x(1).^4-(x(1)).^3+cos(x(1))-12;
i=2;
while tol >0.005 %tolerance stop conidtion
    %first derivative
    dx = x(i-1)^2 *(-3+4 *x(i-1))-sin(x(i-1));
    %second derivative
    d2x = 6 *x(i-1) *(-1+2 *x(i-1))-cos(x(i-1));
    %newtons method step
    x(i) = x(i-1)-(dx/d2x);
    y(i)= x(i).^4-(x(i)).^3+cos(x(i))-12;
    
    tol = abs(x(i)-x(i-1));
    i= i +1;
end

minn=x(6)
%plot our results
% subplot(1,3,1)
% plot(z,l,x(1),y(1),'g*',x(4),y(4),'g*',x(2),y(2),'c*',x(3),y(3),'r*',x(5),y(5),'c*',x(6),y(6),'r*',x(7),y(7),'g*',x(8),y(8),'g*',x(9),y(9),'c*',x(10),y(10),'r*')
% 
% title('Newtons Method example 2 ')
% xlabel('x')
% ylabel('y')

%% GSS
rho = (-1+sqrt(5))/2;
x1=-3;
x2=3;

x3 = x2+rho*(x1-x2);
x4 = x1 +rho*(x2-x1);
tol = abs(x2+x1)/2;

x30 = x2+rho*(x1-x2);
x40 = x1 +rho*(x2-x1);


for i = 0:5
 fx3 = x3.^4-x3.^3+cos(x3)-12;
 fx4 = x4.^4-x4.^3+cos(x4)-12;
 if fx3>fx4
    x1=x3;
    x3=x4;
    x4 = x1 +rho*(x2-x1);
 else
    x2=x4;
    x4=x3;
    x3 = x2+rho*(x1-x2);
 end
 tol = abs(x3-x4);
 x3a(i+1) = x3;
 x4a(i+1)=x4;
end

mingss = (x3+x4)/2
minf = mingss.^2+3*mingss+7;
% subplot(1,3,2)
% plot(z,l,-3,l,3,l,x30,l,'g',x40,l,'g',x3a(1),l,'r',x4a(1),l,'r',x3a(2),l,'c',x4a(2),l,'c',x3a(3),l,'y',x4a(3),l,'y',x3a(4),l,'m',x4a(4),l,'m',x3a(5),l,'b',x4a(5),l,'b')
% title('GSS example')
% xlabel('x')
% ylabel('y')

%% Fibonacci Search

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
    % evaluate our function at the two internal points
 fx3 = x3.^4-x3.^3+cos(x3)-12;
 fx4 = x4.^4-x4.^3+cos(x4)-12;
    %check if we are at the last iteration
 if rho(i+1)==0.5
     rho(i+1)= 0.5-epsilon;
 end
    %determine which interval we want to keep
 if fx3>fx4
    x1=x3;
    x3=x4;
    x4 = x1 +(1-rho(i+1))*(x2-x1); %find new x4 point
 else
    x2=x4;
    x4=x3;
    x3 = x1+rho(i+1)*(x2-x1); %find new x3
 end
 
 x3a(i) = x3;
 x4a(i)=x4;
end

minfs = (x3+x4)/2 %our "boxed in" min
minf = minfs.^2+3*minfs+7; % our function evaluated at our min

%plot our results
% subplot(1,3,3)
% plot(z,l,-3,l,3,l,x30,l,'g',x40,l,'g',x3a(1),l,'r',x4a(1),l,'r',x3a(2),l,'c',x4a(2),l,'c',x3a(3),l,'y',x4a(3),l,'y',x3a(4),l,'m',x4a(4),l,'m')
% title('Fibonacci example')
% xlabel('x')
% ylabel('y')