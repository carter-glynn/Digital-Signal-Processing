
clear;

startyear = 2015;
endyear = 2045;
totalyear = endyear - startyear +1;
n = startyear:endyear
dep = 2000;
interest = [0 0.10 0.09 0.05 0.08 0.07 0.07 0.10 0.11 0.04 0.07 0.06 0.08 0.10 0.11 0.03 0.05 0.07 0.03 0.06 0.03 0.08 0.02 0.10 0.04 0.06 0.08 0.03 0.05 0.07 0.07];

y(1) = dep; 
for k = 2:totalyear
    y(k) = dep + y(k-1)*(1 + interest(k)); 
end

figure
scatter (n, y)
grid on 
title('value of Recursive Function')
xlabel('year')
ylabel('investment value')