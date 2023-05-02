% Carter Glynn
% Lab 3 - Difference Equations/Convolution
clear;

%-----Question 1-----
starty = 2015;
endy = 2045;
totaly = endy - starty + 1;
n = starty:endy;
dep = 2000;
interest = [0 0.10 0.09 0.05 0.08 0.07 0.07 0.10 0.11 0.04 0.07 0.06 0.08 0.10 0.11 0.03 0.05 0.07 0.03 0.06 0.03 0.08 0.02 0.10 0.04 0.06 0.08 0.03 0.05 0.07 0.07];

y(1) = dep; 
for k = 2:totaly
    y(k) = y(k-1)*(1 + interest(k)) + dep; 
end

figure
plot(n, y, '-o')
grid on 
title('Investment Value')
xlabel('Year')
ylabel('Dollars')


%-----Question 2-----
N=50;
n=0:50;
summax=20;

for k = 0:N
    x1(k+1) = sin(0.1 *pi*k) - 2*cos(0.2 *pi*k) + 3*sin(0.3 *pi*k);
    if k<=summax
        h(k+1)= ((-1).^k/(10 + k.^2));
    else
        h(k+1)=0;
    end
end
for k = 0:N
    if k<= N
        x2(k+1)= sin(0.1*pi*k) - 2*cos(0.2*pi*k) + 3*sin(0.3*pi*k);
    else
        x2(k+1)=0;
    end
end

for k = 0:N
    ysum = 0;
    for i = 0:k
        ysum = ysum +h(k+1 - i) * x1(i+1);
    end
    yz(k+1)=ysum;
end

n2=0:100;
icon=conv(x2,h);

i = 0:20;
b=(-1).^i ./(10+i.^2);
a=[1];
delta=[1,zeros(1,N)];
hf=filter(b,a,delta);

figure
subplot(3,3,1)
plot(n,x1)
title('Input x(k)')
xlabel('k'), ylabel('x(k)')

subplot(3,3,2)
plot(n,h)
title('Impulse Response (First Principles)')
xlabel('k'), ylabel('h(k)')

subplot(3,3,3)
plot(n,hf)
title('Impulse Response Filter')
xlabel('k'), ylabel('h(k)')

subplot(3,3,4)
plot(n,yz);
title('Zero State')
xlabel('k'), ylabel('h(k)')

subplot(3,3,7)
plot(n2,icon);
title('Convolution Function MATLAB')
xlabel('k'), ylabel('y(k)')

subplot(3,3,8)
plot(n,filter(hf,a,x1));
title('Filter Function MATLAB')
xlabel('k'), ylabel('Filter')
