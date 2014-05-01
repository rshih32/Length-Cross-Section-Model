totest=XORwrong;
real=XORfulltemplates;
totestclass=XORwrongclass;
start=6;
interval=5;
wrong=ANDfulltemplates;
if(start+interval-1 > length(totest))
    interval=length(totest)-start + 1;
end
for i=start:start+interval-1
    figure;
    if strcmp(totestclass{i},'AND')
        wrong=ANDfulltemplates;
    end
    if strcmp(totestclass{i},'NAND')
        wrong=NANDfulltemplates;
    end
    if strcmp(totestclass{i},'NOR')
        wrong=NORfulltemplates;
    end
    if strcmp(totestclass{i},'OR')
        wrong=ORfulltemplates;
    end
    if strcmp(totestclass{i},'NOT')
        wrong=NOTfulltemplates;
    end
    if strcmp(totestclass{i},'XOR')
        wrong=XORfulltemplates;
    end
    image(tempfunc(totest{i}, real, wrong));
end