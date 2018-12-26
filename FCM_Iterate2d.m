function [Uk,Vk,Jnew] = FCM_Iterate2d(wave,Centers_vk)
tic
categoryCount = size(Centers_vk,1);
epselon = 10E-5;
m = 2;
[Jold,Uk,Vk] = J2d(wave,Centers_vk,m,categoryCount);

for i = 1:intmax('int32')
    Vk = updateCenters(wave,Uk,m,categoryCount);
    [Jnew,Uk,Vk] = J2d(wave,Vk,m,categoryCount);
    if abs(Jnew-Jold) < epselon
        break;
    end
    Jold = Jnew;
    disp(strcat('Iteration:',num2str(i),'-J:',num2str(Jnew)));
end
toc