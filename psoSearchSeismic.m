function [populationBestFitness,populationBestPosition] = psoSearchSeismic(wave,fitnessFunctionHandler,speciesSize,dimentionLimits,params)
%dimentionLimits
%x1 lower bound, upper bound
%x2 lower bound, upper bound
%...
%xn lower bound, upper bound
%[x1l,x1u;x2l,x2u;...]
%It's a n*2 matrix

%params A vector of pso params
%[w,c1,c2]

%Showing
tic
% figure;hold on;

stopPrecision = 1.0E-6;

dimention = size(dimentionLimits,1);
speedLimits = [-2,2];
inertiaW = params(1);
C1 = params(2);
C2 = params(3);
%Initialization
individualsCurrentPosition = dimentionLimits(:,1)+(dimentionLimits(:,2)-dimentionLimits(:,1)).*rand(dimention,speciesSize);

individualsSpeedV = rand(dimention,speciesSize);
individualsBestPosition = individualsCurrentPosition;
populationBestPosition = zeros(dimention,1);
individualsBestFitness = ones(1,speciesSize).*(-inf);
populationBestFitness = -inf;
individualsCurrentFitness = zeros(1,speciesSize);

%Update population
for i = 1:intmax('int32')
    for j = 1:speciesSize
        individualsCurrentFitness(j) = fitnessFunctionHandler(wave,individualsCurrentPosition(:,j));
    end
    %Update the individuals' best fitness and position
    lessThanIndex = individualsBestFitness < individualsCurrentFitness;
    individualsBestFitness(lessThanIndex) = individualsCurrentFitness(lessThanIndex);
    individualsBestPosition(lessThanIndex) = individualsCurrentPosition(lessThanIndex);
    
    %Update population best fitness and position
    if populationBestFitness < max(individualsBestFitness)
        %Break if stop condition is triggered
        if abs(populationBestFitness - max(individualsBestFitness)) < stopPrecision
            break;
        end
        [populationBestFitness,maxIndex] = max(individualsBestFitness);
        populationBestPosition = individualsBestPosition(:,maxIndex);
    end
    
    %Update velocity of individuals
    individualsSpeedV = inertiaW*individualsSpeedV +...
        C1*(individualsBestPosition-individualsCurrentPosition).*rand(dimention,speciesSize) +...
        C2*((repmat(populationBestPosition,1,speciesSize) - individualsCurrentPosition)).*rand(dimention,speciesSize);

    %Check velocity
    overBoundsIndex = individualsSpeedV > speedLimits(2);
	individualsSpeedV(overBoundsIndex) = speedLimits(2);
	overBoundsIndex = individualsSpeedV < speedLimits(1);
	individualsSpeedV(overBoundsIndex) = speedLimits(1);
    %Update position of individuals
    individualsCurrentPosition = individualsCurrentPosition + individualsSpeedV;
    %Check position
    overBoundsIndex = individualsCurrentPosition > dimentionLimits(:,2);
    adjustOverBounds = repmat(dimentionLimits(:,2),1,speciesSize);
    individualsCurrentPosition(overBoundsIndex) = adjustOverBounds(overBoundsIndex);
    overBoundsIndex = individualsCurrentPosition < dimentionLimits(:,1);
    adjustOverBounds = repmat(dimentionLimits(:,1),1,speciesSize);
    individualsCurrentPosition(overBoundsIndex) = adjustOverBounds(overBoundsIndex);
    
    disp(strcat('Iteration:',num2str(i),'-Min:',num2str(populationBestFitness)));
end
[populationBestFitness,maxIndex] = max(individualsBestFitness);
populationBestPosition = individualsBestPosition(:,maxIndex);
disp(strcat('Best fitness:',num2str(populationBestFitness)));
disp('Best solution:');populationBestPosition
toc