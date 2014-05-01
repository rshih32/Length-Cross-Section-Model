ANDexamplesnorm={};
normindex=1;
ANDexamplesextra={};
extraindex=1;
ANDextrastrokerelations={};
for i =1:length(ANDexamples3)
    strokerelation = ANDstrokerelations{i};
    if(min(strokerelation) == -1 || max(strokerelation) == 1)
    %if(min(strokerelation) == -1)
        ANDexamplesextra{extraindex} = ANDexamples3{i};
        ANDextrastrokerelations{extraindex} = strokerelation;
        extraindex = extraindex+1;
    else
        ANDexamplesnorm{normindex} = ANDexamples3{i};
        normindex = normindex+1;
    end
end

NANDexamplesnorm={};
normindex=1;
NANDexamplesextra={};
extraindex=1;
NANDextrastrokerelations={};
for i =1:length(NANDexamples3)
    strokerelation = NANDstrokerelations{i};
    if(min(strokerelation) == -1 || max(strokerelation) == 1)
    %if(min(strokerelation) == -1)
        NANDexamplesextra{extraindex} = NANDexamples3{i};
        NANDextrastrokerelations{extraindex} = strokerelation;
        extraindex = extraindex+1;
    else
        NANDexamplesnorm{normindex} = NANDexamples3{i};
        normindex = normindex+1;
    end
end

ORexamplesnorm={};
normindex=1;
ORexamplesextra={};
extraindex=1;
ORextrastrokerelations={};
for i =1:length(ORexamples3)
    strokerelation = ORstrokerelations{i};
    if(min(strokerelation) == -1 || max(strokerelation) == 1)
    %if(min(strokerelation) == -1)
        ORexamplesextra{extraindex} = ORexamples3{i};
        ORextrastrokerelations{extraindex} = strokerelation;
        extraindex = extraindex+1;
    else
        ORexamplesnorm{normindex} = ORexamples3{i};
        normindex = normindex+1;
    end
end

NORexamplesnorm={};
normindex=1;
NORexamplesextra={};
extraindex=1;
NORextrastrokerelations={};
for i =1:length(NORexamples3)
    strokerelation = NORstrokerelations{i};
    if(min(strokerelation) == -1 || max(strokerelation) == 1)
    %if(min(strokerelation) == -1)
        NORexamplesextra{extraindex} = NORexamples3{i};
        NORextrastrokerelations{extraindex} = strokerelation;
        extraindex = extraindex+1;
    else
        NORexamplesnorm{normindex} = NORexamples3{i};
        normindex = normindex+1;
    end
end

NOTexamplesnorm={};
normindex=1;
NOTexamplesextra={};
extraindex=1;
NOTextrastrokerelations={};
for i =1:length(NOTexamples3)
    strokerelation = NOTstrokerelations{i};
    if(min(strokerelation) == -1 || max(strokerelation) == 1)
    %if(min(strokerelation) == -1)
        NOTexamplesextra{extraindex} = NOTexamples3{i};
        NOTextrastrokerelations{extraindex} = strokerelation;
        extraindex = extraindex+1;
    else
        NOTexamplesnorm{normindex} = NOTexamples3{i};
        normindex = normindex+1;
    end
end

XORexamplesnorm={};
normindex=1;
XORexamplesextra={};
extraindex=1;
XORextrastrokerelations={};
for i =1:length(XORexamples3)
    strokerelation = XORstrokerelations{i};
    if(min(strokerelation) == -1 || max(strokerelation) == 1)
    %if(min(strokerelation) == -1)
        XORexamplesextra{extraindex} = XORexamples3{i};
        XORextrastrokerelations{extraindex} = strokerelation;
        extraindex = extraindex+1;
    else
        XORexamplesnorm{normindex} = XORexamples3{i};
        normindex = normindex+1;
    end
end