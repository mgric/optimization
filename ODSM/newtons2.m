%array to get values of our function
z = -8:.001:5;

% our function x^4+8x^3-2x +cos(x)
l = z.^4+6*z.^3+z.^2-2*z+cos(z);

tol = 1;
% preallocating arrays
x = zeros(1,10);
y = zeros(1,10);
%initial guess
x(1)=5;
y(1) = x(1).^4+6*x(1).^3+x(1).^2-2*x(1)+cos(x(1));
i=2;
while tol >0.001
    dx = 4*x(i-1).^3+18*x(i-1).^2+2*x(i-1)-2-sin(x(i-1)); %derivative
    d2x = 12*x(i-1).^2+36*x(i-1)+2-cos(x(i-1)); %second derivative
    x(i) = x(i-1)-(dx/d2x); %iterative step
    y(i)= x(i).^4+6*x(i).^3+x(i).^2-2*x(i)+cos(x(i));
    
    tol = abs(x(i)-x(i-1));%tolerance calc
    i= i +1;
end

x
%plot our results
plot(z,l,x(1),y(1),'g*',x(4),y(4),'g*',x(2),y(2),'c*',x(3),y(3),'r*',x(5),y(5),'c*',x(6),y(6),'r*',x(7),y(7),'g*',x(8),y(8),'g*',x(9),y(9),'c*',x(10),y(10),'r*')
title('Newtons Method example 2 ')
xlabel('x')
ylabel('y')