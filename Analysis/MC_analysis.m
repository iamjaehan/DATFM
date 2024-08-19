data = load("MC.mat");
data = data.Record;

data = cell2mat(data);

avgVal = mean(data');
stdVal = std(data');

figure(2)
clf
boxplot(data','Whisker',2)
xticklabels({'Auction','Voting'})
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times','fontsize',18)
grid on
ylabel("Optimality gap",'FontName','Times','FontSize',18)
title("Monte-Carlo test (4-player)","FontName",'Times','FontSize',18)
ylim([0 inf])

saveas(gcf,"resultPlot.png")