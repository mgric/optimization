%array to get values of our function
z = -5:.001:5;

% our function y=x^2  + 3x + 7
l = z.^2+3*z+7;


tol = 1;
% preallocating arrays
x = zeros(1,10);
y = zeros(1,10);
%initial guess
x(1)=-3;
y(1) = x(1).^2+3*x(1)+7;
i=2;

while tol >0.05
    dx = 2*x(i-1)+3; %derivative
    d2x = 2; %second derivatie
    x(i) = x(i-1)-(dx/d2x); %iterative step
    y(i)= x(i).^2+3*x(i)+7;
    
    tol = abs(x(i)-x(i-1)); %tolerance calc
    i= i +1;
end

x
%plot our results
plot(z,l,x(1),y(1),'g*',x(2),y(2),'g*',x(3),y(3),'r*')
title('Newtons Method example')
xlabel('x')
ylabel('y')