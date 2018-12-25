function [J,fuzzyClassificationMatrix,Centers_vk] = J2d(wave,Centers_vk,m,categoryCount)
fuzzyClassificationMatrix = zeros([size(wave),categoryCount]);
JuvMatrices = 0;
meanWave = meanMatrix(wave);

for c = 1:categoryCount
    dk = distanceOfPixelAndGroupCenterDkij(wave,Centers_vk(c));
    dp = distanceGroupOfPixelAndCentersDpij(wave,Centers_vk);
    fuzzyClassificationMatrix(:,:,c) = fuzzyMatrixElementUk(dk,dp,m);
    JuvMatrices = JuvMatrices+(fuzzyClassificationMatrix(:,:,c).^m) .* (dk.^2);
end
J = sum(JuvMatrices(:));