
Inputexamples = ANDexamples3;
training = Inputexamples(1:int32(length(Inputexamples)/10));
ANDtrainingfeaturegrids = zeros(12,12,5,25);
for i=1:25%length(training)
    
    ANDtrainingfeaturegrids(:,:,:,i) = ouyang.smoothdownsample(ouyang.featuregrid(training{i}));
end
Inputexamples = NANDexamples3;
training = Inputexamples(1:int32(length(Inputexamples)/10));
NANDtrainingfeaturegrids = zeros(12,12,5,25);
for i=1:25%length(training)
    NANDtrainingfeaturegrids(:,:,:,i) = ouyang.smoothdownsample(ouyang.featuregrid(training{i}));
end
Inputexamples = ORexamples3;
training = Inputexamples(1:int32(length(Inputexamples)/10));
ORtrainingfeaturegrids = zeros(12,12,5,25);
for i=1:25%length(training)
    ORtrainingfeaturegrids(:,:,:,i) = ouyang.smoothdownsample(ouyang.featuregrid(training{i}));
end
Inputexamples = NORexamples3;
training = Inputexamples(1:int32(length(Inputexamples)/10));
NORtrainingfeaturegrids = zeros(12,12,5,25);
for i=1:25%length(training)
    NORtrainingfeaturegrids(:,:,:,i) = ouyang.smoothdownsample(ouyang.featuregrid(training{i}));
end
Inputexamples = NOTexamples3;
training = Inputexamples(1:int32(length(Inputexamples)/10));
NOTtrainingfeaturegrids = zeros(12,12,5,25);
for i=1:25%length(training)
    NOTtrainingfeaturegrids(:,:,:,i) = ouyang.smoothdownsample(ouyang.featuregrid(training{i}));
end
Inputexamples = XORexamples3;
training = Inputexamples(1:int32(length(Inputexamples)/10));
XORtrainingfeaturegrids = zeros(12,12,5,25);
for i=1:25%length(training)
    XORtrainingfeaturegrids(:,:,:,i) = ouyang.smoothdownsample(ouyang.featuregrid(training{i}));
end