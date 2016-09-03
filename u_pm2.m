%%*********����PM���������ؿ��巽������2-D�������(U)********%%
%%
clear
clc
%��ʼ��������
Lx = 20;%input('���뺣��ߴ�=');
Ly = Lx;

dx = 0.1;%input('������������=');
dy = dx;

U = 10;%input('����=');

fire = 0;%input('�������=');

lambda = 0.3;%input('�������䲨��=');

%%
%���ݼ򵥴���
ku1 = 5*lambda;
M = Lx/(2*dx);
N = Ly/(2*dy);
X = zeros(2*M+1,2*N+1);
TOTAL_NUM = (2*M+1)*(2*N+1);
Kp = sqrt(2*0.74/3)*9.81/U^2;
ku2 = 8*Kp;
if ku1>ku2;
    ku=ku1;
else
    ku=ku2;
end
%%
%���ɸ�˹������
gama = randn(2*M+1,2*N+1);%��˹����������gamamn
beta = randn(2*M,2*N);%��˹����������betamn
gauss = zeros(2*M+1,2*N+1);

   for m=0:2*M
        for n=0:2*N 
           if m== 0
                gama(m+1,1) = gama(m+1,1)/2;
           elseif n == 0
                gama(1,n+1) = gama(1,n+1)/2;
           else
                gama(m+1,n+1) = gama(m+1,n+1)+i*beta(m,n);
           end
                gauss(m+1,n+1) = gama(m+1,n+1);
        end
   end

%%
%�׺���ȡ��
for m = 0:M
    for n = 0:N
        kx = 2*pi*m/Lx;
        ky = 2*pi*n/Ly;
        K = kx*kx +ky*ky;
        if (K== 0||abs(kx) > ku)
           W_pm = 0;
        else
        tmp=8.1e-3/(2*K^4);
        W_pm=tmp*exp(-0.74*9.81*9.81/(K^2*U^4))*(cos(fire))^2/pi;
        end
        X(m+1,n+1) = W_pm;
        X(2*M-m+1,2*N-n+1) = X(m+1,n+1);
        X(m+1,2*N-n+1) = X(m+1,n+1);
        X(2*M-m+1,n+1) = X(m+1,n+1);
    end
end

%%
%������ɸ�˹�������
for m=0:2*M
        for n=0:2*N
        eta(m+1,n+1) = pi*sqrt(X(m+1,n+1)/(Lx*Ly))*gauss(m+1,n+1);
        end
end
%%
%����Ҷ�任����ͼ
eta0 =fft2(eta);
z = 2*real(eta0);
z = z*1e3;
save('D:\\pm\\z1.mat','z')
t = linspace(-Lx/2*1e3,Lx/2*1e3,2*M+1);
save('D:\\pm\\t.mat','t')
[x,y] = meshgrid(t,t);
surf(x,y,z) 

 