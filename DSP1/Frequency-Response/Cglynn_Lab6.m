clear;

% Question 1
y = [((1/3)*2) ((1/3)*1) 1];
x = [((1/3)*2) 0 0];
M = 500;
fs = 200;
[h,w] = freqz(y,x,M,fs);

figure(1)

subplot(2,1,1)
plot(w,abs(h));
grid on;
title('Magnitude of tranfer function')
xlabel('w')
ylabel('Magnitude')

subplot(2,1,2)
plot(w,angle(h));
grid on;
title('Phase of tranfer function')
xlabel('w')
ylabel('Phase')

% Question 2
for n = 0:fs-1
  W(n+1) = pi/fs*n;
end

for n = 0:fs-1
  H(n+1) = 1/3 * (2 * cos(W(n+1)) + 1) * exp(j * -W(n+1));
end

figure(2)
subplot(2, 1, 1)
plot(W, abs(H))
grid on
title('Magnitude of tranfer function')
xlabel('w')
ylabel('Magnitude')

subplot(2, 1, 2)
plot(W, angle(H))
grid on
title('Phase of tranfer function')
xlabel('w')
ylabel('Phase')
