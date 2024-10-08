data = load("[0]HistTest.mat");
data.costHist;
costHist = data.costHist;
payHist = data.payHist;
offerHist = data.offerHist;
priceHist = data.priceHist;

dataLen = length(payHist);

player = mod(0:dataLen-2,4)+1;
whoPayWhat = zeros(dataLen-1,2);
for i = 1:dataLen-1
    idx = find(payHist{i+1} - payHist{i});
    [a,b] = ind2sub([4,24],idx);
    whoPayWhat(i,:) = [a,b];
end

out = [player',whoPayWhat];

sample = whoPayWhat(:,:);
b = sample(find(sample(:,1)~=0),:);

figure(1)
clf
histogram(b(:,2))

figure(2)
clf
plot(whoPayWhat(:,2))