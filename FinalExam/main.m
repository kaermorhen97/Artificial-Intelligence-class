close all;
clear all;
clc

data = data_set();
No_of_folds = 9;
[test_data,train_data] = KFoldCrossValidation(data,No_of_folds);


Average_Accuracy = zeros(1,1);
KNN = zeros(No_of_folds,1);

for i =1 : No_of_folds
    knn_result = Knn(train_data{i},test_data{1},No_of_folds);
    Average_Accuracy(1)= Average_Accuracy(1)+ Accuracy(knn_result);
    KNN(i) = Accuracy(knn_result);
end
Average_Accuracy = Average_Accuracy./No_of_folds;
Iteration = 1 : No_of_folds;
Iteration = Iteration';
Accuracy_Iteration_Level = table(Iteration , KNN)
names = {'KNN'};
Average_Accuracy = table(Average_Accuracy,'RowNames',names)


data1 = data1_set();

plot(data1(:,3),data1(:,2),'x')
text(data1(1,3),data1(1,2),'\leftarrow 1','Color','red','FontSize',14)
text(data1(2,3),data1(2,2),'\leftarrow 2','Color','red','FontSize',14)
text(data1(3,3),data1(3,2),'\leftarrow 3','Color','red','FontSize',14)
text(data1(4,3),data1(4,2),'\leftarrow 4','Color','red','FontSize',14)
text(data1(5,3),data1(5,2),'\leftarrow 5','Color','red','FontSize',14)
text(data1(6,3),data1(6,2),'\leftarrow 6','Color','red','FontSize',14)
text(data1(7,3),data1(7,2),'\leftarrow 7','Color','red','FontSize',14)
text(data1(8,3),data1(8,2),'\leftarrow 8','Color','red','FontSize',14)
text(data1(9,3),data1(9,2),'\leftarrow 9','Color','red','FontSize',14)
text(data1(10,3),data1(10,2),'\leftarrow 10','Color','red','FontSize',14)
text(data1(11,3),data1(11,2),'\leftarrow 11','Color','red','FontSize',14)
xlabel('Age')
ylabel('Height')
xlim([15 50])
ylim([4 6])

ID = 11; % ID data1 to predict
% train
opt = 2;
% opt:
% 1 --> euclidean
% 2 --> Manhattan
switch (opt)
    case 1
        [prediction] = euclidean_dist(data1, ID, No_of_folds); 
        disp('euclidean')
    case 2
        [prediction] = Manhattan_dist(data1, ID, No_of_folds);
        disp('Manhattan')
end

text = sprintf('ID: %d, Weight %d kg, Round Weight: %d kg.',ID,prediction,round(prediction));
disp(text)
