function [Y] = pca2(x,m)
clc
xmean=ceil(mean(x));
X=zeros(size(x));
for i=1:size(x,1)
    X(i,:)=x(i,:)-xmean;
end
S=(X*X')/size(x,1);
[V L]=eig(S);
L=max(L);
Lm=zeros(1,m);
Vm=zeros(size(x,1),m);
for i=1:m
    Lm(i)=L(size(Lm,2)-i+1);
    Vm(:,i)=V(:,size(Lm,2)-i+1);
end
W=X'*Vm;
Wn=zeros(size(W));
for i=1:m
    Wn(:,i)=W(:,i)./((size(x,1).*L(size(Lm,2)-i+1)).^0.5);
end
Y=x*Wn;