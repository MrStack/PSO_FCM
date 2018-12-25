function f = randomFCM_Iterations(wave,iterations)
iterationRecords = size(iterations,1);
for i = 1:iterations
    [Uk,Vk,iterationRecords(i)] = FCM_Iterate(wave,-1+2*rand(10,1));
    disp(strcat('Iterations:',num2str(iterations),'-J:',num2str(iterationRecords(i))));
end
figure;plot(iterationRecords);
f = iterationRecords;