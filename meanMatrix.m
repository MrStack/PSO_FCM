function f = meanMatrix(wave)
sumCore = repmat(1/8,3,3);
sumCore(2,2) = 0;
meanWaveMatrix = zeros(size(wave));

%Inner entries
for i = 2:size(meanWaveMatrix,1)-1
    for j = 2:size(meanWaveMatrix,2)-1
        intermediaMatrix = sumCore.*wave(i-1:i+1,j-1:j+1);
        meanWaveMatrix(i,j) = sum(intermediaMatrix(:));
    end
end

%%Edge entries
%Upper
sumCore = repmat(1/5,2,3);
sumCore(1,2) = 0;
for i = 2:size(meanWaveMatrix,2)-1
    intermediaMatrix = sumCore.*wave(1:2,i-1:i+1);
    meanWaveMatrix(1,i) = sum(intermediaMatrix(:));
end
%Lower
sumCore = repmat(1/5,2,3);
sumCore(2,2) = 0;
for i = 2:size(meanWaveMatrix,2)-1
    intermediaMatrix = sumCore.*wave(end-1:end,i-1:i+1);
    meanWaveMatrix(end,i) = sum(intermediaMatrix(:));
end
%Left
sumCore = repmat(1/5,3,2);
sumCore(2,1) = 0;
for i = 2:size(meanWaveMatrix,1)-1
    intermediaMatrix = sumCore.*wave(i-1:i+1,1:2);
    meanWaveMatrix(i,1) = sum(intermediaMatrix(:));
end
%Right
sumCore = repmat(1/5,3,2);
sumCore(2,2) = 0;
for i = 2:size(meanWaveMatrix,1)-1
    intermediaMatrix = sumCore.*wave(i-1:i+1,end-1:end);
    meanWaveMatrix(i,end) = sum(intermediaMatrix(:));
end

%Corner entries
%TopLeft
sumCore = repmat(1/3,2,2);
sumCore(1,1) = 0;
intermediateMatrix = sumCore.*wave(1:2,1:2);
meanWaveMatrix(1,1) = sum(intermediateMatrix(:));
%TopRight
sumCore = repmat(1/3,2,2);
sumCore(1,2) = 0;
intermediateMatrix = sumCore.*wave(1:2,end-1:end);
meanWaveMatrix(1,end) = sum(intermediateMatrix(:));
%BottomLeft
sumCore = repmat(1/3,2,2);
sumCore(2,1) = 0;
intermediateMatrix = sumCore.*wave(end-1:end,1:2);
meanWaveMatrix(end,1) = sum(intermediateMatrix(:));
%BottomRight
sumCore = repmat(1/3,2,2);
sumCore(2,2) = 0;
intermediateMatrix = sumCore.*wave(end-1:end,end-1:end);
meanWaveMatrix(end,end) = sum(intermediateMatrix(:));

f = meanWaveMatrix;