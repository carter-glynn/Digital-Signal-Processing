clear;

R = 1000;
C = 1e-6;
RC = R * C;
Fcutoff = 1/(2*pi*sqrt(R*R*C*C));
SampleSize = 500;
fs = 4e9;
T = 1/fs;
root1 = 1500 + 500 * sqrt(5);
root2 = -500 * sqrt(5) + 1500;
for n = 1:SampleSize
   f(n) = fs/2/SampleSize*n;
   wAnalog = 2*pi*f(n);
   Analog(n) = wAnalog^2/(wAnalog^2 - (j*wAnalog*3/(RC)) - (1/(RC)^2));
   
   wDigital = 2*pi*f(n)/fs;
   z = exp(j*wDigital);
   Digital(n) = (z-1)/(((z-1)-exp(-(root1)*T))*((z-1)-exp(-(root2)*T)));
end

figure(1)
subplot(2,2,1)
semilogx(f,20*log10(abs(Analog)));
grid on;
title('Magnitude of Analog Filter');
xlabel('f');
ylabel('H(w)');

subplot(2,2,2)
semilogx(f, 20*log10(abs(Digital)));
grid on;
title('Magnitude of Digital Filter');
xlabel('f');
ylabel('H(z)');

subplot(2,2,3)
plot(f,(angle(Analog)));
grid on;
title('Phase of Analog Filter');
xlabel('f');
ylabel('H(z)');

subplot(2,2,4)
plot(f,(angle(Digital)));
grid on;
title('Phase of Digital Filter');
xlabel('f');
ylabel('H(z)');