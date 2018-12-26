function f = meanCentersMatrix(Centers,waveSize)
f = repmat(sum(Centers(:))/size(Centers,1),waveSize);