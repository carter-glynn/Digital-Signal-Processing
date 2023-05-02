clear;

n=0:50;
y(1) = 2;
y(2) = 3;
x = 0.8.^(n+1);
b=[2 1];
a=[1 -0.6 0.05];
z=[2 3]
if n < 0 
    x(n) = 0;
end
for k=3:51
    y(k) = 0.6*y(k-1) - 0.05*y(k-2) + 2*x(k) + x(k-1);
end
figure(1)
plot(n,y,'-o');
grid on;
xlabel("n")
ylabel("y(n)")
title("By Hand")
figure(2)
plot(n,filter(b,a,x,z), '-o')
grid on;
xlabel("n")
ylabel("y(n)")
title("Filter Function")