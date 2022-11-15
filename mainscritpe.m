clear all ; clc ; close all 
R1 = 1000; R2 = 1000; R = 1:2000;E = 10;

Req = (R2.*R)./(R2+R);
V = Req*E./(Req+R1);
P = (V.^2)./R;
Pmax= max(P)
t = [R',P'];
Rmax = t(P == Pmax)

hold on
plot(R,P,'r') %Tracer P=f(R)

plot(0,Pmax,'rx') % Tracer Pmax sur axe de Oy
plot(Rmax, 0, 'yx') % Tracer R(Pmax) sur l'axe de Ox
plot(Rmax,Pmax,'b*') % Tracer M(R(Pmax),Pmax)


 p1 = P;
 p1(:) = Pmax;
 r1  =R;
 r1(:) = Rmax;
plot(R, p1,'k--')
plot(r1,P,'k--')
    
xlabel('R (ohms) ')
ylabel('P (Wattes)')
title('P = f(R) ')
legend('P = f(R)', 'Pmax','Rmax','m(Rmax,Pmax)')