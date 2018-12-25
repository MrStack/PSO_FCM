function showFCMResults(Uk)
figure;hold on;
while 1
    for c = 1:size(Uk,3)
        slice(:,:) = Uk(:,:,c);
        clf;
        imagesc(slice);
        title(strcat('Class:',num2str(c)));
        pause(0.8);
    end
end