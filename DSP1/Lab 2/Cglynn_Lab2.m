% Carter Glynn
% Lab 2 - Operation on Complex-Valued Functions

clear;

n=-10:10;

for p=1:21
x(p)=exp((-0.1*n(p))+(0.3i*n(p)));


% Using first principles
mag1(p)=exp(-0.1*n(p));
phase1(p)=0.3*n(p);
real1(p)=exp(-0.1*n(p))*cos(0.3*n(p));
imag1(p)=exp(-0.1*n(p))*sin(0.3*n(p));

% Using MATLAB
mag2(p)=abs(x(p));
phase2(p)=phase(x(p));
real2(p)=real(x(p));
imag2(p)=imag(x(p));

end

figure(1)
plot(n,x,'-o');
xlabel('n');
ylabel('x(n)');
title('x(n), -10<=n<=10');
grid on


figure(2)
subplot(2,2,1)
plot(n,mag1,'-o');
xlabel('n');
ylabel('Magnitude');
title('1a) Magnitude Calculated');
grid on
subplot(2,2,2)
plot(n,phase1,'-o');
xlabel('n');
ylabel('Phase');
title('1b) Phase Calculated');
grid on
subplot(2,2,3)
plot(n,real1,'-o');
xlabel('n');
ylabel('Real');
title('1c) Real Calculated');
grid on
subplot(2,2,4)
plot(n,imag1,'-o');
xlabel('n');
ylabel('Imaginary');
title('1d) Imaginary Calculated');
grid on

figure(3)
subplot(2,2,1)
plot(n,mag2,'-o');
xlabel('n');
ylabel('Magnitude');
title('2a) Magnitude MATLAB');
grid on
subplot(2,2,2)
plot(n,phase2,'-o');
xlabel('n');
ylabel('Phase');
title('2b) Phase MATLAB');
grid on
subplot(2,2,3)
plot(n,real2,'-o');
xlabel('n');
ylabel('Real');
title('2c) Real MATLAB');
grid on
subplot(2,2,4)
plot(n,imag2,'-o');
xlabel('n');
ylabel('Imaginary');
title('2d) Imaginary MATLAB');
grid on

