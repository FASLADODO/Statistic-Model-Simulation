clear all;
test=floor(10*rand(1,10000));
hist(test)
test=hist(test);
test_theo = 1000*ones(1,10);
disp('Q3_1&2:')
ChisquaredTest = sum((test-test_theo).^2./test_theo);
ChisquaredThreshold_95 = chi2inv(0.95,10);%?? cdf??
sprintf('ChisquaredTest=%d\nChisquaredThreshold_95=%d\nReject?%d',...
ChisquaredTest,ChisquaredThreshold_95,ChisquaredTest>ChisquaredThreshold_95)
disp('Q3_3:')
test=[test(2:end),0];
ChisquaredTest = sum((test-test_theo).^2./test_theo);
ChisquaredThreshold_95 = chi2inv(0.95,10);%?? cdf??
sprintf('ChisquaredTest=%d\nChisquaredThreshold_95=%d\nReject?%d',...
ChisquaredTest,ChisquaredThreshold_95,ChisquaredTest>ChisquaredThreshold_95)