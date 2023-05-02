clear;

fi = 10000;
fc = 100000;
fs = 2.00001*fc;
N = 100000;
Ac = 1;
Ai = 1;
corr = 50;

for n = 0:N-1
    discrete(n+1) = n;
    vAM(n+1) = (Ac + Ai*sin(2*pi*fi/fs*n/N*corr))*sin(2*pi*fc/fs*n/N*corr);
end

for n = 0:N-1
    v_demod(n+1) = (0.5*(Ac + Ai*sin(2*pi*fi/fs*n/N*corr))) - ((0.5*(Ac + Ai*sin(2*pi*fi/fs*n/N*corr)))*cos(4*pi*fc/fs*n/N*corr));
end

% Apply filter to modulated signal
cutoff = 10050;
v_filtered = lowpass(v_demod, cutoff, fs);

% Plots
figure;
subplot(3,1,1);
plot(discrete, vAM);
title('Original Signal');
subplot(3,1,2);
plot(discrete, v_demod);
title('Demodulated Signal');
subplot(3,1,3);
plot(discrete, vAM_filtered);
title('Filtered Signal (Intelligence Signal)');
