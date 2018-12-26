function f = distanceMatrixBetweenPixelsAndCenters(wave,centers)
countOfCenters = size(centers,1);
distanceMatrix = zeros([size(wave),countOfCenters]);
for i = 1:countOfCenters
    distanceMatrix(:,:,i) = wave - repmat(centers(i),size(wave));
end

f = distanceMatrix;