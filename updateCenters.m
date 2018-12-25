function Vk = updateCenters(wave,Uk,m,categoryCount)
Vk = zeros(categoryCount,1);

for c = 1:categoryCount
    extractMatrix(:,:) = (Uk(:,:,c).^m);
    Vk(c) = sum(sum(extractMatrix.*wave))/sum(sum(Uk(:,:,c).^m));
end