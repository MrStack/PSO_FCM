function f = distanceGroupOfPixelAndCentersDpij(Image,Centers)
imagePlanes = repmat(Image,1,1,size(Centers,1));

for c = 1:size(imagePlanes,3)
    imagePlanes(:,:,c) = imagePlanes(:,:,c)-Centers(c);
end

f = imagePlanes;