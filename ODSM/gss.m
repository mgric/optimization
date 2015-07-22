%array to get values of our function
z = -5:.001:5;
% our function x^4 -(x)^3+cos(x)-12
y = z.^4-z.^3+cos(z)-12;
% setting our reduction size to the golden ratio
rho = (-1+sqrt(5))/2;
%initial left and right bounds
x1=-3;
x2=3;
% first two points
x3 = x2+rho*(x1-x2);
x4 = x1 +rho*(x2-x1);
tol = abs(x2+x1)/2;

x30 = x2+rho*(x1-x2);
x40 = x1 +rho*(x2-x1);


for i = 0:5
    %function evaluations 
fx3 = x3.^4-x3.^3+cos(x3)-12;
 fx4 = x4.^4-x4.^3+cos(x4)-12;
 %determining which interval to keep
 if fx3>fx4
    x1=x3;
    x3=x4;
    x4 = x1 +rho*(x2-x1);
 else
    x2=x4;
    x4=x3;
    x3 = x2+rho*(x1-x2);
 end
 %check tolerance
 tol = abs(x3-x4);
 x3a(i+1) = x3;
 x4a(i+1)=x4;
end
%end
min = (x3+x4)/2
minf = min.^2+3*min+7;

% plot(z,y,-3,y,3,y,x30,y,'g',x40,y,'g',x3a(1),y,'r',x4a(1),y,'r',x3a(2),y,'c',x4a(2),y,'c',x3a(3),y,'y',x4a(3),y,'y',x3a(4),y,'m',x4a(4),y,'m',x3a(5),y,'b',x4a(5),y,'b')
% title('GSS example')
% xlabel('x')
% ylabel('y')

%