function f = fuzzyMatrixElementUk(dk,dp,m)
intermediateMatrices = dk./dp;
intermediateMatrices = intermediateMatrices.^(2/(m-1));
f = 1./sum(intermediateMatrices,3);