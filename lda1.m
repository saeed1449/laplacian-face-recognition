clear all
close all
clc
nop=10;
pcaD=10;
data=TrainMF();
%xlabel=xLableMaking();
%x=pca2(data,pcaD);
x=data;
idx=size(x,1)/nop;
GM=0; SW=0; SB=0;  %Global Mean
for i=1:nop
    p{i}=x((i-1)*idx+1:i*idx,:);
    D{i}=pca2(p{i},pcaD);
    M{i}=mean(D{i});
    GM=GM+M{i};
    for j=1:size(D{i})
        X{i}(j,:)=D{i}(j,:)-M{i};
    end
     S{i}=(X{i}'*X{i});
     SW=SW+S{i};
     SB=SB+(M{i}-GM)'*(M{i}-GM);
end
GM=GM./nop;
J=inv(SW)*SB;
[V L]=eigs(J);
for i=1:nop
    U{i}=D{i}*V;
end
Y=[U{1};U{2};U{3};U{4};U{5};U{6};U{7};U{8};U{9};U{10}];
% % W(:,1)=U(:,1);
% % W(:,2)=U(:,2);
% % W(:,3)=U(:,3);
% % Y=x'*W;
% % Colors % blue% green % red% %magenta % black %yellow
color={'mo'  'rs' 'go' 'bo' 'y*' 'b*' 'g*' 'r*' 'ks' 'k*' 'ys'};
for i=1:size(Y,1)
    hold on
    scatter3(Y(i,1),Y(i,2),Y(i,3),color{ceil(i/18)},'Linewidth',2);
end
grid