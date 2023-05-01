
N = 50;
NQ = 0:N;
mconv = 0:52;
k=0:N;
imax=20;
x= sin(0.1 *pi*k) - 2*cos(0.2* pi * k) + 3*sin(0.3* pi * k);

for k = 0:N

    x1(k+1) = sin(0.1 *pi*k) - 2*cos(0.2 *pi*k) + 3*sin(0.3 *pi*k);
    if k<=imax
        h(k+1)= ((-1).^k/(10 + k.^2));
    else
        h(k+1)=0;
    end
end


for k = 0:N
    ys = 0;
    for i = 0:k
        ys = ys +h(k+1 - i) * x1(i+1);
    end
    yz(k+1)=ys;
end


for k = 0:2N
    if k<= N
        x2(k+1)= sin(0.1*pi*k) - 2*cos(0.2*pi*k) + 3*sin(0.3*pi*k);
    else
        x2(k+1)=0;
    end
    if k<= imax
        h1(k+1)=((-1)^k/(10+k^2));
    else
        h1(k+1)=0;
    end
end

%filter 
i = 0:20;
b=(-1).^i ./(10+i.^2);
a=[1];
delta=[1,zeros(1,N)];
HF=filter(b,a,delta);


figure
subplot(3,3,1);
plot(NQ,h);
grid on;
title('Impulse response using first principles')
xlabel('n')
ylabel('h(k)')

subplot(3,3,2);
plot(NQ,HF);
grid on;
title('Impulse response filter')
xlabel('n')
ylabel('h(k)')


subplot(3,3,3);
plot(NQ,x1);
grid on;
title('X-function')
xlabel('n')
ylabel('h(k)')

subplot(3,3,4);
plot(NQ,yz);
grid on;
title('Zero State Plot')
xlabel('n')
ylabel('h(k)')

yconv = conv(x2,h)
subplot(3,3,5);
plot(mconv,yconv);
grid on;
title('Function conv')
xlabel('n')
ylabel('ysz(k)')
 
subplot(3,3,6);
plot(NQ,filter(HF,a,x));
grid on;
title('y(k) using filter function ')
xlabel('n')
ylabel('y==(k)')




























