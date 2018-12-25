function f = objectiveFunctionJuv(wave,Centers_vk)
categoryCount  = 10;
m = 1.5;
fuzzyClassificationMatrix = zeros([size(wave),categoryCount]);
JuvMatrices = 0;
for c = 1:categoryCount
    dk = distanceOfPixelAndGroupCenterDkij(wave,Centers_vk(c));
    dp = distanceGroupOfPixelAndCentersDpij(wave,Centers_vk);
    fuzzyClassificationMatrix(:,:,c) = fuzzyMatrixElementUk(dk,dp,m);
    JuvMatrices = JuvMatrices+(fuzzyClassificationMatrix(:,:,c).^m) .* (dk.^2);
end
f = 1/(sum(JuvMatrices(:))+1);