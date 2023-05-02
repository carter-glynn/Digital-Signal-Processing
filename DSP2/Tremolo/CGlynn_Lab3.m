clear; 

% Reading the .wav file
[x, fs] = audioread("Saxaphone8k.wav");

% Choosing a modulating frequency
fr = 200;

% Number of samples so tremolo is produced
N = length(x);

% Modulating and producing tremolo
for n=0:length(x)-1
    AM(n+1) = sin(2*pi*fr*n/N);
    y(n+1) = (1 + AM(n+1))*x(n+1);
end

% Playing the saxaphone with effect
soundsc(y, fs);