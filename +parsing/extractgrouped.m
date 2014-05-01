ANDexamples3 = {};
NANDexamples3 = {};
ORexamples3 = {};
NORexamples3 = {};
XORexamples3 = {};
NOTexamples3 = {};

ANDstrokerelations = {};
NANDstrokerelations = {};
ORstrokerelations = {};
NORstrokerelations = {};
XORstrokerelations = {};
NOTstrokerelations = {};

files = parsing.getAllFiles('data/UCR_Gate_Study_Data');
prefixsize = length('data/UCR_Gate_Study_Data');
gfiles = parsing.getAllFiles('data/GateStyleStudyGrouped');
gprefixsize = length('data/GateStyleStudyGrouped');

ambilist=[];
for f=1: length(gfiles)
    f
    gxmlfile = gfiles{f};
    gidentifier = gxmlfile(gprefixsize+2:strfind(gxmlfile,'.labeled_groupLabeled.xml')-1);
    xmlfile='NA';
    for f2=1:length(files)
        tempfile=files{f2};
        if(strcmp(gidentifier,tempfile(prefixsize+2:strfind(tempfile,'.labeled.xml')-1)))
            xmlfile = tempfile;
        end
    end
    
    gDOMnode = xmlread(gxmlfile);
    gallShapes = gDOMnode.getElementsByTagName('shape');
    
    DOMnode = xmlread(xmlfile);
    allShapes = DOMnode.getElementsByTagName('shape');
    allPoints = DOMnode.getElementsByTagName('point');

%     ANDgates = containers.Map;
%     NANDgates = containers.Map;
%     ORgates = containers.Map;
%     NORgates = containers.Map;
%     XORgates = containers.Map;
%     XNORgates = containers.Map;
%     NOTgates = containers.Map;
%     NOTBUBBLEgates = containers.Map;

    %Labels = containers.Map;
    %Wires = containers.Map;
    
    %strokes = containers.Map;
    
    substrokes = containers.Map;
    substrokeStartEndMap = containers.Map;
    for i=0:allShapes.getLength-1
        if allShapes.item(i).getAttribute('type').equals('substroke')
            substrokeID = char(allShapes.item(i).getAttribute('id'));
            substrokes(substrokeID)=allShapes.item(i);
            startpointID = char(allShapes.item(i).getAttribute('start'));
            endpointID = char(allShapes.item(i).getAttribute('end'));
            substrokeStartEndMap(strcat(startpointID,endpointID)) = substrokeID;
        end
    end
    
    substrokeToType = containers.Map;
    substrokeToGate = containers.Map;
    
    for i=0:allShapes.getLength-1
        if allShapes.item(i).getAttribute('type').equals('AND')
            DOMsubstrokes = allShapes.item(i).getElementsByTagName('arg');
            for j = 0: DOMsubstrokes.getLength - 1
                substrokeID = char(DOMsubstrokes.item(j).getFirstChild.getData);
                substrokeToType(substrokeID) = 'AND';
                substrokeToGate(substrokeID) = allShapes.item(i);
            end 
        end
        if allShapes.item(i).getAttribute('type').equals('NAND')
            DOMsubstrokes = allShapes.item(i).getElementsByTagName('arg');
            for j = 0: DOMsubstrokes.getLength - 1
                substrokeID = char(DOMsubstrokes.item(j).getFirstChild.getData);
                substrokeToType(substrokeID) = 'NAND';
                substrokeToGate(substrokeID) = allShapes.item(i);
            end 
        end
        if allShapes.item(i).getAttribute('type').equals('NOR')
            DOMsubstrokes = allShapes.item(i).getElementsByTagName('arg');
            for j = 0: DOMsubstrokes.getLength - 1
                substrokeID = char(DOMsubstrokes.item(j).getFirstChild.getData);
                substrokeToType(substrokeID) = 'NOR';
                substrokeToGate(substrokeID) = allShapes.item(i);
            end 
        end
        if allShapes.item(i).getAttribute('type').equals('NOT')
            DOMsubstrokes = allShapes.item(i).getElementsByTagName('arg');
            for j = 0: DOMsubstrokes.getLength - 1
                substrokeID = char(DOMsubstrokes.item(j).getFirstChild.getData);
                substrokeToType(substrokeID) = 'NOT';
                substrokeToGate(substrokeID) = allShapes.item(i);
            end 
        end
        if allShapes.item(i).getAttribute('type').equals('OR')
            DOMsubstrokes = allShapes.item(i).getElementsByTagName('arg');
            for j = 0: DOMsubstrokes.getLength - 1
                substrokeID = char(DOMsubstrokes.item(j).getFirstChild.getData);
                substrokeToType(substrokeID) = 'OR';
                substrokeToGate(substrokeID) = allShapes.item(i);
            end 
        end
        if allShapes.item(i).getAttribute('type').equals('XOR')
            DOMsubstrokes = allShapes.item(i).getElementsByTagName('arg');
            for j = 0: DOMsubstrokes.getLength - 1
                substrokeID = char(DOMsubstrokes.item(j).getFirstChild.getData);
                substrokeToType(substrokeID) = 'XOR';
                substrokeToGate(substrokeID) = allShapes.item(i);
            end 
        end
        
        
    end
    
    Gates = containers.Map;
    gsubstrokes = containers.Map;
    gsubstrokeToSubstroke = containers.Map;
    for i=0:gallShapes.getLength-1
        if gallShapes.item(i).getAttribute('type').equals('substroke')
            gsubstrokeid = char(gallShapes.item(i).getAttribute('id'));
            gsubstrokes(gsubstrokeid)=gallShapes.item(i);
            startpointID = char(gallShapes.item(i).getAttribute('start'));
            endpointID = char(gallShapes.item(i).getAttribute('end'));
            index = strcat(startpointID,endpointID);
            
            gsubstrokeToSubstroke(gsubstrokeid) = substrokeStartEndMap(index);
          
            
        end
        if gallShapes.item(i).getAttribute('type').equals('Unknown') && gallShapes.item(i).getAttribute('classification').equals('Gate')
            Gates(char(gallShapes.item(i).getAttribute('id')))=gallShapes.item(i);
        end
    end

    gallShapes.getLength
    
    points = containers.Map;
    for i=0:allPoints.getLength-1
        points(char(allPoints.item(i).getAttribute('id'))) = allPoints.item(i);
    end
    allPoints.getLength
%     

    GGates = Gates.values;
    for i=1:length(GGates)
    
        type='NA';
        
        DOMsubstrokes = GGates{i}.getElementsByTagName('arg');
        rawstrokes = cell(1,DOMsubstrokes.getLength);
        strokerelation = zeros(1,DOMsubstrokes.getLength);
        for j = 0: DOMsubstrokes.getLength - 1
            gsubstrokeID = char(DOMsubstrokes.item(j).getFirstChild.getData);
            
            substrokeID = gsubstrokeToSubstroke(gsubstrokeID);
            
            if(isKey(substrokeToType, substrokeID))
                
                if(strcmp(type, 'NA'))
                    type = substrokeToType(substrokeID);
                    gateclass = substrokeToGate(substrokeID);
                    DOMgate = substrokeToGate(substrokeID);
                elseif ~strcmp(type, substrokeToType(substrokeID)) || ~ gateclass.equals(substrokeToGate(substrokeID))
                    type
                    substrokeToType(substrokeID)
                    ambilist=[ambilist f];
                    type='X';
                end
            end
            
                
        end
        
        if(~ strcmp(type, 'NA') && ~ strcmp(type, 'X'))
            
            DOMss = DOMgate.getElementsByTagName('arg');
            thegatesubstrokes = {};
            for j = 0: DOMss.getLength - 1
                thegatesubstrokes{j+1} = char(DOMss.item(j).getFirstChild.getData);
            end
            
            %add strokes in the grouped data
          
            for j = 0: DOMsubstrokes.getLength - 1

                gsubstrokeID = char(DOMsubstrokes.item(j).getFirstChild.getData);
                
                substrokeID = gsubstrokeToSubstroke(gsubstrokeID);
                
                contains = false;
                removeindex = 1;
                for k=1: length(thegatesubstrokes)
                    if(strcmp(thegatesubstrokes{k}, substrokeID))
                        contains = true;
                        removeindex = k;
                    end
                end
                if contains
                    thegatesubstrokes(removeindex)=[];
                end
                DOMsubstroke = substrokes(substrokeID);

                DOMpoints = DOMsubstroke.getElementsByTagName('arg');
                rawstroke = zeros(2,DOMpoints.getLength);
                for k = 0: DOMpoints.getLength - 1
                     pointID = char(DOMpoints.item(k).getFirstChild.getData);
                     DOMpoint = points(pointID);
                     xraw = str2double(char(DOMpoint.getAttribute('x')));
                     yraw = str2double(char(DOMpoint.getAttribute('y')));
                     rawstroke(:,k+1) = [xraw;yraw];


                end
                rawstrokes{j+1} = rawstroke;
                strokerelation(j+1) = ~ contains;

            end
            
            %add strokes that were missed
            for j = 1: length(thegatesubstrokes)

                substrokeID = thegatesubstrokes{j};
                
                DOMsubstroke = substrokes(substrokeID);

                DOMpoints = DOMsubstroke.getElementsByTagName('arg');
                rawstroke = zeros(2,DOMpoints.getLength);
                for k = 0: DOMpoints.getLength - 1
                     pointID = char(DOMpoints.item(k).getFirstChild.getData);
                     DOMpoint = points(pointID);
                     xraw = str2double(char(DOMpoint.getAttribute('x')));
                     yraw = str2double(char(DOMpoint.getAttribute('y')));
                     rawstroke(:,k+1) = [xraw;yraw];


                end
                
                rawstrokes{j+DOMsubstrokes.getLength} = rawstroke;
                strokerelation(j+DOMsubstrokes.getLength) = -1;

            end
            
            
            

            temp = parsing.fill(rawstrokes);
            xfilled = temp(1,:);
            yfilled = temp(2,:);


            meanx=mean(xfilled);
            meany=mean(yfilled);
            for j = 1: length(rawstrokes)
                rawstroke = rawstrokes{j};
                rawstroke(1,:) = rawstroke(1,:) - meanx;
                rawstroke(2,:) = rawstroke(2,:) - meany;
                rawstrokes{j} = rawstroke;
            end
            if(strcmp(type,'AND'))
                ANDstrokerelations{length(ANDexamples3) + 1} = strokerelation;
                ANDexamples3{length(ANDexamples3) + 1} = rawstrokes;    
            end
            if(strcmp(type,'NAND'))
                NANDstrokerelations{length(NANDexamples3) + 1} = strokerelation;
                NANDexamples3{length(NANDexamples3) + 1} = rawstrokes;    
            end
            if(strcmp(type,'NOR'))
                NORstrokerelations{length(NORexamples3) + 1} = strokerelation;
                NORexamples3{length(NORexamples3) + 1} = rawstrokes;    
            end
            if(strcmp(type,'NOT'))
                NOTstrokerelations{length(NOTexamples3) + 1} = strokerelation;
                NOTexamples3{length(NOTexamples3) + 1} = rawstrokes;    
            end
            if(strcmp(type,'XOR'))
                XORstrokerelations{length(XORexamples3) + 1} = strokerelation;
                XORexamples3{length(XORexamples3) + 1} = rawstrokes;    
            end
            if(strcmp(type,'OR'))
                ORstrokerelations{length(ORexamples3) + 1} = strokerelation;
                ORexamples3{length(ORexamples3) + 1} = rawstrokes;    
            end
            
        end
    end

%     ANDexamples = parsing.center(ANDgates.values, substrokes, points, ANDexamples);
%     NANDexamples=parsing.center(NANDgates.values, substrokes, points, NANDexamples);
%     ORexamples=parsing.center(ORgates.values, substrokes, points, ORexamples);
%     NORexamples=parsing.center(NORgates.values, substrokes, points, NORexamples);
%     XORexamples=parsing.center(XORgates.values, substrokes, points,XORexamples);
%     NOTexamples=parsing.center(NOTgates.values, substrokes, points,NOTexamples);

end

