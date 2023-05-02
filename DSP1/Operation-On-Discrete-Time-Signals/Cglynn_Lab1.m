clear;

n=-3:8;
x=[0 0 0 0 0 0 1 2 3 4 0 0];

figure(1);
scatter(n,x)
xlabel('n');
ylabel('x(n)');
title('Exercise A');
grid on


n=-3:9;
x=[0 0 0 0 0 0 1 2 3 4 0 0 0];
y1 = double.empty;
for a=4:length(n)
    y1(a)=x(a)- x(a-3);
end

figure(2);
scatter(n,y1)
xlabel('n');
ylabel('y(n)');
title('Exercise B');
grid on

n=-3:8;
x=[0 0 0 0 0 0 1 2 3 4 0 0];
y2 = double.empty;

for a=1:length(n)
    y2(a)=0.5 * x(a);
end

figure(3);
scatter(n,y2)
xlabel('n');
ylabel('y(n)');
title('Exercise C');
grid on


y3 = double.empty;
n=-10:0;
for a=1:length(n)
    y3(a)=x(11-a+1);
end

figure(4);
scatter(n,y3)
xlabel('n');
ylabel('y(n)');
title('Exercise D');
grid on









