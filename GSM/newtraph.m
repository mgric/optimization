%newton raphson in  dimensions
%f(x,y) =  x^2 -x+cos(y+x)+y^2

x=zeros(2,7);
z=zeros(1,7);

x(1,1)=2; %initial guess
x(2,1)=2;


tol(1)=1;
tol(2)=2;

i=2;


while tol(1) >0.0001 && tol(2) > 0.0001 %stop conditions

    %gradients
    dx1 = -1+2*x(1,i-1)-sin(x(1,i-1)+x(2,i-1)); %gradient dx
    dx2 = 2*x(2,i-1) - sin(x(1,i-1)+x(2,i-1)); %gradient dy

    g=[dx1,dx2]';%gradient matrix
    
    %hessian
    ddx1= 2 - cos(x(1,i-1)+x(2,i-1)); % sames as ddx2
    dx1dx2= -cos(x(1,i-1)+x(2,i-1)); % same as dx2dx1

    h =[ddx1 dx1dx2;dx1dx2,ddx1]; %hessian matrix
    
    x(:,i) = x(:,i-1)-h\g;
    
    
    tol(1) = abs(x(1,i)-x(1,i-1)); %tolerance calc
    tol(2) = abs(x(2,i)-x(2,i-1));

    z(i) =x(1,i)^2 -x(1,i)+cos(x(2,i)+x(1,i))+x(2,i)^2;

    i=i+1;
end

xx = linspace(-20,20);
yy = linspace(-20,20);
[L,R] = meshgrid(xx,yy);
U = L.^2 -L+cos(R+L)+R.^2;

contour(L,R,U)
hold all


x1=[x(1,1) x(1,2)];
x2 = [x(1,2) x(1,3)];
x3 = [x(1,3) x(1,4)];
x4=[x(1,4) x(1,5)];
x5= [x(1,5) x(1,6)];


y1=[x(2,1) x(2,2)];
y2 = [x(2,2) x(2,3)];
y3 = [x(2,3) x(2,4)];
y4=[x(2,4) x(2,5)];
y5= [x(2,5) x(2,6)];



line(x1,y1,'color','r')
line(x2,y2,'color','m')
line(x3,y3,'color','k')
line(x4,y4,'color','b')
line(x5,y5,'color','r')





