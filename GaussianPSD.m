fs=500; %sampling frequency
sigma=1;
t=-0.5:1/fs:0.5; %time base

variance=sigma^2;
x=1/(sqrt(2*pi*variance))*(exp(-t.^2/(2*variance)));
subplot(2,1,1)
plot(t,x,'b');
title(['Gaussian Pulse \sigma=', num2str(sigma),'s']);
xlabel('Time(s)');
ylabel('Amplitude');

L=length(x);
NFFT = 1024;
X = fftshift(fft(x,NFFT));
Pxx=X.*conj(X)/(NFFT*NFFT); %computing power with proper scaling
f = fs*(-NFFT/2:NFFT/2-1)/NFFT; %Frequency Vector

subplot(2,1,2)
plot(f,abs(X)/fs,'r');
title('Magnitude of FFT');
xlabel('Frequency (Hz)')
ylabel('Magnitude |X(f)|');
xlim([-10 10])

Pxx=X.*conj(X)/(L*L); %computing power with proper scaling
figure;
plot(f,10*log10(Pxx),'r');
title('Double Sided - Power Spectral Density');
xlabel('Frequency (Hz)')
ylabel('Power Spectral Density- P_{xx} dB/Hz');

bt = 0.3;
span = 4;
sps = 8;
h = gaussdesign(bt,span,sps);

