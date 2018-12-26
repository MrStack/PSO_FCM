function [J,fuzzyClassificationMatrix,Centers_vk] = J2d(wave,Centers_vk,m,categoryCount)
fuzzyClassificationMatrix = zeros([size(wave),categoryCount]);
JuvMatrices = 0;
adjacentMeanMatrix = meanMatrix(wave);
centerMeanMatrix = meanCentersMatrix(Centers_vk,size(wave));

distanceMatrixPixelsAndCenters = distanceMatrixBetweenPixelsAndCenters(wave,Centers_vk);
distanceMatrixAdjacentAndCenterMean = distanceMatrixBetweenAdjacentMeanAndCenterMean(adjacentMeanMatrix,centerMeanMatrix);

distanceProductMatrix = abs(distanceMatrixPixelsAndCenters).*abs(distanceMatrixAdjacentAndCenterMean);

for c = 1:categoryCount
    dk = distanceOfPixelAndGroupCenterDkij(wave,Centers_vk(c));
    dp = distanceGroupOfPixelAndCentersDpij(wave,Centers_vk);
    fuzzyClassificationMatrix(:,:,c) = fuzzyMatrixElementUk(dk,dp,m);
    JuvMatrices = JuvMatrices+(fuzzyClassificationMatrix(:,:,c).^m) .* distanceProductMatrix(:,:,c);
end
J = sum(JuvMatrices(:));