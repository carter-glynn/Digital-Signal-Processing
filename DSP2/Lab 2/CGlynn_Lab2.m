% Carter Glynn
% 2023-02-24
% EECE3265 - DSP 2
% Lab 2 - Creating DTMF

%% LAB 2 - CODE

clear;

row = [697, 770, 852, 941];
col = [1209, 1336, 1477];

%        1209    1336    1477
%      =========================
% 697  |   1   |   2   |   3   |
%      =========================
% 770  |   4   |   5   |   6   |
%      =========================
% 852  |   7   |   8   |   9   |
%      =========================
% 941  |   #   |   0   |   *   |
%      =========================

fs = 8192;      % sample rate
dur = 0.3;      % duration of tone in seconds
t = 0:1/fs:dur; % creating time variable

rowNum = round(1 + (4-1).*rand(1,10));  % random num for row frequency
colNum = round(1 + (3-1).*rand(1,10));  % random num for column frequency
wave = [];                              % init waveform array

for n = 1:10 
    % generates random tone based on random numbers generated 
    % (ex. row(1) + column(3) = tone of number '7')
    tone = sin(2*pi*row(rowNum(n))*t) + sin(2*pi*col(colNum(n))*t);

    rest = sin(2*pi*0*t); % for ease of listening (not required)

    wave = [wave tone rest]; % concatenates tones into waveform + rest
end

soundsc(wave, fs); % plays waveform

% plots waveform
plot(wave);
xlabel('Time (seconds)');    
ylabel('Amplitude');
title('DTMF Tone Waveform');

%% LAB 2 - WRITTEN

% a) How are the received tones to be decoded?
% b) Can one tone be mistaken or “aliased” as another tone?
% Discussion: How is this system better/worse than the older pulse tone concept?

% a) The recieved tones are probably decoded using a few bandpass filters
%    to tes/isolate for the frequency options. After this I assume it's as
%    simple as using a lookup table 
%    (After looking through the notes, I've seen this is exactly how it's
%    done, lucky guess I suppose)

% b) The tones could be aliased if the sampling rate is too low, so we
%    should adhere to the Nyquist rule (Other than that I feel like these 
%    frequencies were chosen specifically to avoid harmonics, so it's 
%    probably pretty hard to get them mixed up) 

% Discussion: Generally, the only downsides to using DTMF is the potential
%             for aliasing, and the cost to manufacture a more complex 
%             dialing pad. The advantages are that it is far faster in 
%             terms or both user speed and pulse tone signaling speed. It 
%             is more accurate than pulse tones, where the user can input 
%             tones either too quickly or too slowly and it will confuse 
%             the receiving end. 


