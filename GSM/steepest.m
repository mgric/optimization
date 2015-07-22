% steepest decent 
%f(x,y) =  x^2 -x+cos(y+x)+y^2.

%% constant step size
x = zeros(1,10);% initialize arrays
y = zeros(1,10);

x(1)=8; %initial guess
y(1)=8;

%dx = -1+2*x-sin(x+y)
%dy = 2*y-sin(x+y)

a0=0.1; %initial step size

tol(1)=1;
tol(2)=2;

i=1;

while tol(1) >0.0001 && tol(2) > 0.0001 %stop conditions

    dx = -1+2*x(i)-sin(x(i)+y(i)); %gradient dx
    dy = 2*y(i) - sin(x(i)+y(i)); %gradient dy
 
    i=i+1;
    
    x(i) = x(i-1)-dx*a0; %iterative steps
    y(i) = y(i-1)-dy*a0;
    
    tol(1) = abs(x(i)-x(i-1)); %tolerance calc
    tol(2) = abs(y(i)-y(i-1));
    
    
end

%% Backtracking line search

x = zeros(1,10);
y = zeros(1,10);

x(1)=3;
y(1)=3;

%dx = -1+2*x-sin(x+y)
%dy = 2*y-sin(x+y)

ay=1;
ax=1;

tol(1)=1;
tol(2)=1;

i=1;

while tol(1) >0.0001 | tol(2) > 0.0001

    dx = -1+2*x(i)-sin(x(i)+y(i));
    dy = 2*y(i) - sin(x(i)+y(i));
 

    %evaluate function at different points
    fc =  x(i)^2 -x(i)+cos(y(i)+x(i))+y(i)^2;
    newfx =(x(i)-dx*ax)^2 -(x(i)-dx*ax)+cos(y(i)+(x(i)-dx*ax))+y(i)^2;
    newfy =x(i)^2 -x(i)+cos((y(i)-dy*ay)+x(i))+(y(i)-dy*ay)^2;
    
  
    while newfx> fc -ax*dx %Armijo-Goldstein Condition check
        ax=.5*ax; %shrink step size
        % function eval at new step
        newfx =(x(i)-dx*ax)^2 -(x(i)-dx*ax)+cos(y(i)+(x(i)-dx*ax))+y(i)^2;
    end
    while newfy > fc -ay*dy
        ay=.5*ay;
        newfy =x(i)^2 -x(i)+cos((y(i)-dy*ay)+x(i))+(y(i)-dy*ay)^2;
    end
    
    i=i+1;
    x(i) = x(i-1)-dx*ax;
    y(i) = y(i-1)-dy*ay;
    
    tol(1) = abs(x(i)-x(i-1));
    tol(2) = abs(y(i)-y(i-1));
    
    
end