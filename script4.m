% classifylentemplatesfull( primaryNOT, 10, ANDlentemplate3, NANDlentemplate3, ORlentemplate3, NORlentemplate3, NOTlentemplate3, XORlentemplate3, ANDrotations, NANDrotations, ORrotations, NORrotations, NOTrotations, XORrotations)
 classifylentemplatesfull( XORexamples{89}, 10, ANDlentemplate3, NANDlentemplate3, ORlentemplate3, NORlentemplate3, NOTlentemplate3, XORlentemplate3, ANDrotations, NANDrotations, ORrotations, NORrotations, NOTrotations, XORrotations)
% NORstats = zeros(2,length(NORcorrrotation));
% for i=1:length(NORstats)
%     NORstats(:,i) = [NORscales(i+1,NORcorrrotation(i));NORintervals(i+1,NORcorrrotation(i))];
% end
% 
% XORstats = zeros(2,length(XORcorrrotation));
% for i=1:length(XORstats)
%     XORstats(:,i) = [XORscales(i+1,XORcorrrotation(i));XORintervals(i+1,XORcorrrotation(i))];
% end

% 'AND'
% [ANDrotations, tempAND] = genlengthtemplate(primaryAND, ANDexamples);
% 'NAND'
% [NANDrotations, tempNAND] = genlengthtemplate(primaryNAND, NANDexamples);
% 'OR'
% [ORrotations, tempOR] = genlengthtemplate(primaryOR, ORexamples);
% 'NOR'
% [NORrotations, tempNOR ]= genlengthtemplate(NORexamples{78}, NORexamples(2:551));
% 'XOR'
% [XORrotations, tempXOR] = genlengthtemplate(primaryXOR, XORexamples(2:613));
% 'NOT'
%[NOTrotations, tempNOT] = genlengthtemplate(primaryNOT, NOTexamples);
% 
% 'AND2'
% ANDlentemplate4 = genlengthtemplate(primaryAND, ANDexamples(1:170));
% 'NAND2'
% NANDlentemplate4 = genlengthtemplate(primaryNAND, NANDexamples(1:170));
% 'OR2'
% ORlentemplate4 = genlengthtemplate(primaryOR, ORexamples(1:170));
% 'NOR2'
% NORlentemplate4 = genlengthtemplate(primaryNOR, NORexamples(1:170));
% 'XOR2'
% XORlentemplate4 = genlengthtemplate(primaryXOR, XORexamples(1:170));
% 'NOT2'
% NOTlentemplate4 = genlengthtemplate(primaryNOT, NOTexamples(1:170));

