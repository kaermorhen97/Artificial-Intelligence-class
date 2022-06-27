function [prediction] = euclidean_dist(data, ID, k)

P = size(data,1)-1;
X = [data(ID,2), data(ID,3)];
label = zeros(P,1);
Y = data(1:end-1,1);
for i = 1:P
    % Euclidean distance between two points
    A = repmat(data(i,2:3),size(X,1),1)-X;
    distances(i,1) = Y(i,1);
    distances(i,2) = sqrt(sum(A.^2,2));
end
 % Sort the distances in ascending order
[~,I] = sort(distances(:,2));
Ynearest = Y(I(1:k,1));
prediction = mean(data(Ynearest,4));
end