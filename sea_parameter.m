%----------------------------��ˮ��������---------------------------------%
%���ݺ�ˮ���¶Ⱥ;��鹫ʽ�����㺣ˮ����Ũ�ȡ�����糣�����ų�ʱ�䡢
%��ˮý�ʵĵ絼�ʡ���ˮ��̬��糣����

%
%%
T = 20; %��ˮ�¶�
Ss = 32.54e-3; %��ˮ��Ũ��
if(Ss<0||Ss>40e-3)
    disp('�����븴��Ҫ��ĺ�ˮŨ�̶ȣ�');
end
%��֪����
emsn0 = 1/(36*pi)*1e-9;      %���ɿռ��糣��
a = 0;                       %�ų�ʱ��ֲ��ľ�����
emsnoo = 4.9;                %��ˮ�����޴�Ƶ��ʱ�Ľ�糣��
emsn_T_0 = 87.134-1.949e-1*T-1.276e-2*T^2+2.491e-4*T^3; %��ˮ�Ľ�糣�����¶ȵı仯
a_T_Ss = 1.0+1.613e-5*T*Ss-3.656e-3*Ss+3.21e-5*Ss^2-4.232e-7*Ss^3;
%tao_T_0 = 1/(2*pi)*(1.1109e-10-3.824e-1*T-1.276e-2*T^2+2.491e-4*T^3);%��ˮ���ų�ʱ��
tao_T_0 = 1.768e-11-6.086e-13*T+1.104e-14*T^2-8.111e-17*T^3;
b_T_Ss = 1.0+2.282e-5*T*Ss-7.638e-4*Ss-7.76e-6*Ss^2+1.105e-8*Ss^3;
emsn_s_T_Ss = emsn_T_0*a_T_Ss;    %��ˮ��̬��糣��
tao_T_Ss = tao_T_0*b_T_Ss;        %�ų�ʱ��

deta = 25-T;
deta_25_Ss = Ss*(0.18252-1.4619e-3*Ss+2.093e-5*Ss^2-1.282e-7*Ss^3);%25���϶�ʱ��ˮ�ĵ絼��
afa = 2.033e-2+1.266e-4*deta+2.464e-6*deta^2-...
          Ss*(1.849e-5-2.551e-7*deta+2.551e-8*deta^2);
deta_T_Ss = deta_25_Ss*exp(-deta*afa);         %��ˮ�絼��
%f=0.5e9:0.1e9:20e9;                     %Ƶ�ʲ���
%f = 1e9:1e9:1000e9;
f = 5.5e9;
emsn = emsnoo+(emsn_s_T_Ss-emsnoo)./(1+(2j*pi*f*tao_T_Ss).^(1-a))-1j*deta_T_Ss./(2*pi*f*emsn0); %��ˮ��糣��
real_emsn = real(emsn);
imag_emsn = abs(imag(emsn));
%imag_emsn1 = 2*pi*f*tao_T_Ss*(emsn_s_T_Ss-emsnoo)./(1+(2*pi*f*tao_T_Ss).^(1-a));
 %%
% figure(1)  
% plot(f./1e9,real_emsn)
% hold on
 
 %figure(2)
 %plot(f./1e9,imag_emsn)
 %hold on
 
 %figure(3)
 %plot(f./1e9,imag_emsn1)
 
   

