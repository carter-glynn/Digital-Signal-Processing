clear; 
load handel.mat
%% Lab 1 - Creating Music
%   Carter Glynn
%   Mary Had A Little Lamb
%   Using the 'sound' function

Fs = 8000;
t = 0:1/Fs:0.3;

REST = 0; % rest is made so the song sounds nicer
C = 523.25; D = 587.33; E = 659.25; F = 698.46; G = 783.99;

notes = [E, D, C, D, E, E, E, REST, D, D, D, REST, E, G, G, REST, E, D, C, D, E, E, E, E, D, D, E, D, C];
song = 0; % declares variable so it can be added onto in the loop below

for n = 1:length(notes)
    y = sin(2*pi*notes(n)*t);
    soundsc(y, Fs);
    pause(0.3); % required otherwise all of the notes would play when calculated (all at almost exactly the same time)
    song = [song y];
end

figure(1)
plot(song) % plots the whole song
title('Mary Had A Little Lamb')
ylabel('Amplitude')
xlabel('seconds')

audiowrite('Cglynn_Song.wav',song,Fs); % creates .wav file and puts it in the same folder

%% How Does .wav Work?

% .wav is a collection of samples taken ata certain/specified frequency

% .wav encodes a stream of bits that represent an ADC conversion of sound

% .wav uses 'containers' to store audio data, sample rate, and bit rate

% .wav files are raw/lossless, meaning they preserve all of the file's 
% original data (i.e. it's not compressed)

% when playing a .wav file, either a DAC or a PWM fixed-voltage DC signal 
% (at a specified sample size and rate) is used
