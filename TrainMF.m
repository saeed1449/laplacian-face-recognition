function [Train] = TrainMF(~)
clc
load dataset2
load subsets
alldata={X01,X02,X03,X04,X05,X06,X07,X08,X09,X10};
train_index=[sub1 sub2];
Train=zeros(length(train_index)*length(alldata),length(alldata{1}(1,:)));
for i=1:length(alldata)
    for j=1:length(train_index)
        Train(((i-1)*length(train_index))+j,:)=alldata{i}(train_index(j),:);
    end
end
clear X01 X02 X03 X04 X05 X06 X07 X08 X09 X10
clear sub1 sub2 sub3 sub4 sub5
clear train_index i j