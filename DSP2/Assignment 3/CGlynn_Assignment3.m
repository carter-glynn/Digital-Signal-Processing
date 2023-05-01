clear;

% Load the audio file
[init, fs] = audioread('Saxaphone8k.wav');

% Set the number of terms N for the DFT
N = length(init);
K = round(N/3);
num = 4700;
% Perform the DFT
init_transform = fft(init, num);

% Convert back into the time-domain data
init_reconvert = ifft(init_transform, num);



% MDCT Transform
for k = 1:K
    trans(k) = 0; % init transform array
    for n = 1:N
        trans(k) = trans(k) + init(n)*cos((n+((N+2)/4))*(k+0.5)*(2*pi/N));
    end
end

% Inverse MDCT
for n = 1:N
    recon(n) = 0; % init reconvert array
    for k = 1:K
        recon(n) = recon(n) - trans(k)*cos((n+((N+2)/4))*(k+0.5)*(2*pi/N));
    end
    recon(n) = recon(n)*2/N;
end

recon = recon.';
soundsc(recon);

% Init graph array
graph = zeros(1,N);
for n = 1:N
    graph(n) = init(n) - recon(n);
end
t = 1:length(graph);

% Plot difference graph
figure(1)
plot(t, graph);
title('Time Difference')
grid on

%% Questions

% 1. To get acceptable quality, how many terms do you need for MDCT?

% After doing some testing, I was unable to get a conclusive answer due to
% the computational requirements of the program (it was taking 20+ minutes
% each run). The answer I had come up with was between 1k and 10k terms.
% After research, I am able to confidently say that the generally accepted
% number of terms for a high-quality MDCT is 512-1024 terms. 

% 2. How many for DFT? 

% For this MATLAB program, the number was roughly 4700 samples. I'm not
% confident I tested the n-points properly though. Also, upon playing the
% audio, the sound is very short, and I'm not sure how to "fix" that, if
% possible. However, you can hear the beginning note of the saxophone audio 
% for a breif moment. 

% 3. Comment on the appropriateness of using MDCT for audio encoding.

% Becasue MDCT is block-based, it allows for more accurate analysis of 
% the signal and better control over the bit rate used for encoding. MDCT
% is very good for signal compession due to the way it is performed on
% consecutive, overlapping blocks as because of the overlapping, MDCT is
% able to reduce artifacts from its lossy compression method.