clear;

% 2. Use this program to generate both a carrier and a tonal input.

fi = [1 3];
fc = [10 25];
fs= fc*2;
count = 1;
figure
for n = 1:2
    for k = 1:2
        t = (0 : 1/fs(k) : 2*pi);
        x = cos_wave(fi(n),t);
        y = ammod(x, fc(k), fs(k));

% 3. Plot out the results for several carrier and input frequency values.

        subplot(length(fi), length(fc), count)
        plot(t,y);
        grid on
        title(sprintf('Fi = %d, Fc = %d', fi(n), fc(k)))
        xlabel('Time')
        ylabel('Amplitude')
        count = count + 1;
    end
end

% 4. Now write a program to produce analog FM modulation.

w = 50;
mf = 5;
fi = [10 25 50 100];
fc = 250;
fs = fc*2;
a = 1;
N = 1000;
c = w/N;
count = 1;

figure
for p = 1:4
    for n = 1:N
        dis(n) = n;
        k(n) = a*sin(2*pi*(fc/fs)*n*c + mf*sin(2*pi*(fi(p)/fs)*n*c));
        
% 5. Plot the results for several carrier/input values.
        subplot(2, 2, count)
        plot(dis,k);
        grid on
        xlim([0 N])
        title(sprintf('Intelligence Frequency %d', fi(p)))
        xlabel('Time')
        ylabel('Amplitude')
% % 6. Produce the spectral signature for one of the modulated signals.
% I was unable to get this part to work as my computer was running really
% slowly and the plot seemed to be producing far more samples than 
% seemingly was necessary/specified in the code I wrote
%         carrier = a*sin(2*pi*(fc/fs)*n*c);
%         input = mf*sin(2*pi*(fi(p)/fs)*n*c);
%         hold on
%         plot(dis,carrier,'--red');
%         plot(dis,input,'--blue');
%         hold off
    end
    count = count + 1;
end

% 1. In Matlab, write a general program to generate a cos wave where the 
%    frequency can be varied. The actual formula portion should be a function 
%    call so that you don t need to repeat code when calculating carrier 
%    and input tonal signal.

function y = cos_wave(freq, time)
    y = cos(pi * freq * time);
end

