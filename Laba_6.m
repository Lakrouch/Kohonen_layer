clear all;
close all;
X = load('data3.txt');
scatter(X(:,1),X(:,2));

size = length(X);
hold on;
m = 4; 
W = X(1:m,:);
figure;
scatter(W(:,1),W(:,2))
U = zeros(size,2);
F = 500;
e = 0.0001;
h = 0.1;
k = 1;
k_max = 10;

while k <= k_max
  
  Rtchk = X(randi(size),:); 
  d = zeros(m,1);
  for j= 1:m
    d(j) = pdist([W(j,:); Rtchk],'euclidean');
  end
  place = find(d==min(d));
 
  W(place, :) =W(place, :)+ h*(Rtchk(1,:)-W(place,:));
  k = k+1;
end

for i = 1:size
    d = zeros(m,1);
    for j= 1:m
      d(j) = pdist([W(j,:);X(i,:)],'euclidean');
    end
    U(i,2)= min(d);
    U(i,1) = find(d==U(i,2));
end
hold on
gscatter(X(:,1),X(:,2), U(:,1));
