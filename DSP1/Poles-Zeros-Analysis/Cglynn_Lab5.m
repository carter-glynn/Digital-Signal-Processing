% Carter Glynn
% Lab 5 - Poles/Zeros Analysis and Frequency/Phase Response
clear;

y = [10 0 0 0];
x = [1 0 0 0 -0.81];

% 1
z_pol = 10.^3*0;
z_zero = roots(x);
z_zero = [z_zero; z_pol];
figure(1)
plot(real(z_zero),imag(z_zero),'o');
grid on;

% 2
sys = tf(y,x);
figure(2)
pzmap(sys);

%3
M = 200;
fs = 200;
[h,w] = freqz(y,x,M,fs);
figure(3)
subplot(2,1,1)
plot(w,abs(h));
grid on;
subplot(2,1,2)
plot(w,angle(h));
grid on;

% 4 
n = 0:200;
for k=1:201
    w(k) = (pi/fs)*k;
    Hmag(k) = 10/(sqrt(((cos(4*w(k))-0.81).^2)+(1j*sin(4*w(k)).^2)));
    Hph(k) = (3*w(k))-atan((sin(4*w(k))./(cos(4*w(k)-0.81))));
end

figure(4)
subplot(2,1,1)
plot(n,Hmag)
grid on;
subplot(2,1,2)
plot(n,Hph);
grid on;