clear;

fi = 10000;
fc = 100000;
fs = 2.00001*fc;
N = 160;
Ac = 1;
Ai = 1;
corr = 50;

for n = 0:N-1
    discrete(n+1) = n;
    fisig(n+1) = Ac + Ai*sin(2*pi*fi/fs*n/N*corr);
    vAM(n+1) = (Ac + Ai*sin(2*pi*fi/fs*n/N*corr))*sin(2*pi*fc/fs*n/N*corr);
end

for n = 0:N-1
    vdemod(n+1) = (0.5*(Ac + Ai*sin(2*pi*fi/fs*n/N*corr))) - ((0.5*(Ac + Ai*sin(2*pi*fi/fs*n/N*corr)))*cos(4*pi*fc/fs*n/N*corr));
end

% Apply filter to modulated signal
[b,a] = cheby2(10,100,0.11);
%[b,a] = butter(4,0.01);
% freqz(b,a);
vfiltered = filter(b,a,vdemod);

% Plots
figure;
subplot(4,1,1);
plot(discrete, vAM);
title('Original Signal');
subplot(4,1,2);
plot(discrete, vdemod);
title('Demodulated Signal');
subplot(4,1,3);
plot(discrete, vfiltered);
title('Filtered Signal');
subplot(4,1,4);
plot(discrete, fisig);
title('Intended Output');
