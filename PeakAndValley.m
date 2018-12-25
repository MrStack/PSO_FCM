function f = PeakAndValley(wave)
WaveFiltered = zeros(size(wave));
DiffWave = diff(wave);
for j = 1:size(DiffWave,2)
    for i = 1:size(DiffWave,1)-1
        if DiffWave(i,j)*DiffWave(i+1,j) < 0
            WaveFiltered(i+1,j) = wave(i+1,j);
        end
    end
end

f = WaveFiltered;
