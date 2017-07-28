clear
disp('Q2(a)')%use
a=rand(1,1000);%
X_K=[a(1:end),0];%
X_K1=[0,a(1:end)];%
cov(X_K,X_K1,1)
coef=corrcoef(X_K,X_K1)%correlated coef

disp('Q2(b):')%use
XK=X_K;
XK1=[a(1:end),0];%
XK2=[a(2:end),0,0];%
XK3=[a(3:end),0,0,0];%
YK=XK-2*XK1+0.5*XK2-XK3;
cov(YK,XK,1)
corrcoef(YK,XK)