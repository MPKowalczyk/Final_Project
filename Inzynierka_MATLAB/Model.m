%% Parameters of DC control
A=1;
T=0.15;
dc=tf(A,[T 1 0]);
K=1/6/T;
W_SIZE=1280;
cam_angle=140;
imp_90=2000;
imp_0=6000;
fs=60;
h=1/fs;

%% Model of servomechanism for critical amplification
A=[0 1;-1/4/T^2 -1/T];
B=[0;1];
C=[1/4/T^2 0];
sys=ss(A,B,C,0);

%% Model for critical amplification
Ad=[(1+h/2/T)*exp(-h/2/T) h*exp(-h/2/T);-h/4/T^2*exp(-h/2/T) (1-h/2/T)*exp(-h/2/T)];
Bd=[-2*T*exp(-h/2/T)*(h+2*T)+4*T^2;h*exp(-h/2/T)];
Cd=[1/4/T^2 0];
sysd=ss(Ad,Bd,Cd,0,h);