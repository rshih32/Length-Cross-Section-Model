stats=XORstats;
rotations = XORcorrrotation;
modmat = rotations==1|rotations==2|rotations==18;
stats1=stats(1,:);
stats2=stats(2,:);
stats1(~ modmat)=[];
stats2(~ modmat)=[];
stats=[stats1;stats2];
count1=0;
count2=0;
count3=0;
minscale = log(.001);
maxscale = log(100);
scaleresolution = 250;
stepsize = (maxscale-minscale)/(scaleresolution-1)
for i=1:length(stats)
    if(stats(2,i) > 8)
        if(stats(1,i) > (1-stepsize*3) && stats(1,i) < (1+stepsize*3))
            count1=count1+1;
        end
        if(stats(1,i) > (1-stepsize*5) && stats(1,i) < (1+stepsize*5))
             count2=count2+1;
        end
       if(stats(1,i) > (1-stepsize*7) && stats(1,i) < (1+stepsize*7))
             count3=count3+1;
        end
    end 
end
(1-stepsize*3),(1+stepsize*3),(1-stepsize*5),(1+stepsize*5),(1-stepsize*7),(1+stepsize*7)
acc1 = count1/length(stats)
acc2 = count2/length(stats)
acc3 = count3/length(stats)
figure;
parsing.hist2d(stats);
saveas(gcf,'pics/2dhistfull/XORhistf.jpg');