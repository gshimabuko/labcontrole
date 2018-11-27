t=0:0.002:10;

u=zeros(size(t));
u(501:5001)=10;

n=[18.15];
d=[0.055 1 0];

[A, B, C, D]= tf2ss(n, d);
eig(A)

sys=ss(A,B,C,D)

%%sys=sys*integ;
%%figure
%%lsim(sys, u, t)
p1 = -5;
p2=-7;

K = place(A,B,[p1 p2]);
sys_cl = ss(A-B*K,B,C,0);
%%lsim(sys_cl, u, t)
op=-48;
op2=-48;

L = acker(A',C',[op op2])';

Ae = [ A [0 ; 0]; -C 0] ;
Be= [B ; 0];
Ke=acker(Ae, Be, [(-15+1*i) (-15-1*i) -10]);
K=[Ke(1) Ke(2)];
Ki=Ke(3)
%%Bt = [    B
%%zeros(size(B)) ];

%%Ct = [ C    zeros(size(C)) ];
%%sys_co = ss(At,Bt,Ct,0);
%%sim(sys_co, u, t);
save("controltest.mat");