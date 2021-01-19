function [xm,t,Xm,f]=fonction(fm,am,v0,B,M,T)
    Bu=B/(2*M);
    k=2500;
    dt=1/B;
    t=0:dt:T-dt;
    t2=0:dt:T-2*dt;
    xm=cos(2*pi*fm*t + (k*am/v0)*sin(2*pi*v0*t));
    xma=hilbert(xm);
    phi=unwrap(angle(xma));
    vm=1/(2*pi) * diff(phi)/dt;
    vmth=fm+k*am*cos(2*pi*v0*t);
    [Xm,f]=TransFourier(xm,t);
    subplot(2,2,1)
    plot(t,xm)
    title('signal xm(t)')
    subplot(2,2,2)
    plot(t2,vm,t,vmth,'--')
    legend('fréquence instantannée estimée','fréquence instantannée théorique')
    subplot(2,2,3)
    plot(f,Xm)
    title('transformée de Fourier de xm(t)')
    subplot(2,2,4)
    plot(f,Xm)
    xlim([-Bu Bu])
    title('zoom sur la bande passante utile de Xm(f)')
end


v0=500;

%[xm1,t,Xm1,f]=fonction(3000,1,500,48000,4,5);
 [xm2,t,Xm2,f]=fonction(9000,1,500,48000,4,0.02);
% [xm3,t,Xm3,f]=fonction(15000,1,500,48000,4,5);
% [xm4,t,Xm4,f]=fonction(21000,1,500,48000,4,5);
%     
% figure(2)
% x=xm1+xm2+xm3+xm4;
% [X,f]=TransFourier(x,t);
% plot(f,X)
% legend('transformée de Fourier du mélange des xm(t)')