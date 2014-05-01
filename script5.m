numrotations = 18;
NANDscales=zeros(length(NANDexamples),numrotations);
NANDintervals = zeros(length(NANDexamples),numrotations);
for i=1:length(NANDexamples)
    'NAND' 
    i
    example = NANDexamples{i};
    [votes, startintervalscale]=classifylentemplatesfull( example, 10, NANDlentemplate3, NANDlentemplate3, ORlentemplate3, NORlentemplate3, NOTlentemplate3, XORlentemplate3, ANDrotations, NANDrotations, ORrotations, NORrotations, NOTrotations, XORrotations);
    NANDintervals(i,:) = startintervalscale(2,:);
    NANDscales(i,:) = startintervalscale(3,:);
end

ORscales=zeros(length(ORexamples),numrotations);
ORintervals = zeros(length(ORexamples),numrotations);
for i=1:length(ORexamples)
    'OR' 
    i
    example = ORexamples{i};
    [votes, startintervalscale]=classifylentemplatesfull( example, 10, ORlentemplate3, NANDlentemplate3, ORlentemplate3, NORlentemplate3, NOTlentemplate3, XORlentemplate3, ANDrotations, NANDrotations, ORrotations, NORrotations, NOTrotations, XORrotations);
    ORintervals(i,:) = startintervalscale(2,:);
    ORscales(i,:) = startintervalscale(3,:);
end

NORscales=zeros(length(NORexamples),numrotations);
NORintervals = zeros(length(NORexamples),numrotations);
for i=1:length(NORexamples)
    'NOR' 
    i
    example = NORexamples{i};
    [votes, startintervalscale]=classifylentemplatesfull( example, 10, NORlentemplate3, NANDlentemplate3, ORlentemplate3, NORlentemplate3, NOTlentemplate3, XORlentemplate3, ANDrotations, NANDrotations, ORrotations, NORrotations, NOTrotations, XORrotations);
    NORintervals(i,:) = startintervalscale(2,:);
    NORscales(i,:) = startintervalscale(3,:);
end

NOTscales=zeros(length(NOTexamples),numrotations);
NOTintervals = zeros(length(NOTexamples),numrotations);
for i=1:length(NOTexamples)
    'NOT' 
    i
    example = NOTexamples{i};
    [votes, startintervalscale]=classifylentemplatesfull( example, 10, NOTlentemplate3, NANDlentemplate3, ORlentemplate3, NORlentemplate3, NOTlentemplate3, XORlentemplate3, ANDrotations, NANDrotations, ORrotations, NORrotations, NOTrotations, XORrotations);
    NOTintervals(i,:) = startintervalscale(2,:);
    NOTscales(i,:) = startintervalscale(3,:);
end

XORscales=zeros(length(XORexamples),numrotations);
XORintervals = zeros(length(XORexamples),numrotations);
for i=1:length(XORexamples)
    'XOR' 
    i
    example = XORexamples{i};
    [votes, startintervalscale]=classifylentemplatesfull( example, 10, XORlentemplate3, NANDlentemplate3, ORlentemplate3, NORlentemplate3, NOTlentemplate3, XORlentemplate3, ANDrotations, NANDrotations, ORrotations, NORrotations, NOTrotations, XORrotations);
    XORintervals(i,:) = startintervalscale(2,:);
    XORscales(i,:) = startintervalscale(3,:);
end