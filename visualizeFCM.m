function f = visualizeFCM(Uk)
color = load('colorMap.mat');
threshold = 0.9;
colorPlane = zeros(200,150,3);
for c = 1:size(Uk,3)
    for i = 1:size(Uk,1)
        for j = 1:size(Uk,2)
            if Uk(i,j,c) >= threshold
                colorPlane(i,j,:) = color.colorMap(c,:);
            end
        end
    end
end
imshow(colorPlane);
f = colorPlane;