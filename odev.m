%% ödev son

clc;
clear;

n=[3 5 8 10 12]; % 
mu=[5 5 5 5 5 ];
sigma=[1 1 1 1 1]; 

% [x xo xv]= datagen(n,mu,sigma)

k=length(n);
xg=sum(n.*xo)/sum(n); % tüm x değerlerinin ortalaması
A=sum(n.*(xo-xg).^2)/(k-1); %SST/(k-1) =>MST
B=sum(xv.*(n-1))/sum(n)-k; %SSE/(N-k) =>MSE
Fh=A/B; %F test value F=MST/MSE
p=1-fcdf(Fh,k-1,sum(n)-k); 

F_orj=Fh
SSX_orj=sum(n.*(xo).^2)
SS_per=sum(n.*(xg).^2)
F_per=[]
SSX_per=[]
%%
x1=x(2,1:n(1))
x2=x(2,n(1)+1:n(2)+n(1))
x3=x(2,n(2)+n(1)+1:n(3)+n(2)+n(1))
x4=x(2,n(3)+n(2)+n(1)+1:n(4)+n(3)+n(2)+n(1))
x5=x(2,n(4)+n(3)+n(2)+n(1)+1:n(5)+n(4)+n(3)+n(2)+n(1))
%%
function [r p T ]=permutasyon(x1,x2,x3,x4,x5,alfa,ds)

n1=length(x1);n2=length(x2);
n3=length(x3);n2=length(x4);
n5=length(x5);
N=n1+n2+n3+n4+n5
% T=mean(x1)-mean(x2);
x=[x1 x2 x3 x4 x5]; % 1. adım
n=5;
k=5;
for i=1:ds % 4. adım
    xp=x(randperm(N)); % randperm ile rastgele birleştirildi (2.adım)
    x1p=xp(1:n1); % ikiye bölme işlemi (2.adım)
    x2p=xp(n1+1:n2+n1); % ikiye bölme işlemi (2.adım)
    x3p=xp(n2+n1+1:n3+n2+n1)
    x4p=xp(n3+n2+n1+1:n4+n3+n2+n1)
    x5p=xp(n4+n3n+n2+n1+1:N)
    
    SSx=n1*mean(x1)^2+n2*mean(x2)^2+n3*mean(x3)^2+n4*mean(x4)^2+n5*mean(x5)^2
%     SSX_per[i]=SSx %xg
    SST_per=SSx-SS_per  %A
    SSE_per=SStotal-SST_per  %B
    F_per(i)=(SST_per/k-1)/(SSE_per/N-k) %A/B
end
    
%     xg=sum(n.*xo)/sum(n); % tüm x değerlerinin ortalaması
%     A=sum(n.*(xo-xg).^2)/(k-1); %SST/(k-1) =>MST
%     B=sum(xv.*(n-1))/sum(n)-k; %SSE/(N-k) =>MSE
%     Fh=A/B; %F test value F=MST/MSE
%     Tp(i)=mean(x1p)-mean(x2p); % (3.adım)
% end

% p_SSX=mean(SSX_per>SSX_orj); % 5.adım
p_F=mean(F_per>F_orj)
r=p_F<alfa

print("Permutation F-Test","\n")
print("F Test Değeri:",F_orj,"\n")
print("SSX Değeri:",SSX_orj,"\n")
print("Number of Permutation: ",ds,"\n")

end

