ELLIPSEexamples3 = {};
ARROWexamples3 = {};
BOXexamples3 = {};
LINEexamples3 = {};
POLYLINEexamples3 = {};

ELLIPSEstrokerelations = {};
ARROWstrokerelations = {};
BOXstrokerelations = {};
LINEstrokerelations = {};
POLYLINEstrokerelations = {};



fprintf('\n====== EXTRACTGROUPED_FAMILYTREE ======\n');

% check if random mode
if(random == 0)
    fprintf('extract_familytree - regular mode: working with ');
    files = parsing.getAllFiles('C:\Users\Ren\Desktop\Week9_data\synthesized\unclean'); % data with confusing examples (more than one shape)
    fprintf('%d examples.\n', length(files));
else
    fprintf('extract_familytree - random mode: working with ');
    files = randomexamples3;
    fprintf('%d examples.\n', length(files));
end    


for f=1: length(files)
    %f
    xmlfile = files{f};
    %xmlfile
    
    DOMnode = xmlread(xmlfile);
    allShapes = DOMnode.getElementsByTagName('shape');
    allPoints = DOMnode.getElementsByTagName('point');

    ELLIPSEshape = containers.Map;
    ARROWshape = containers.Map;
    BOXshape = containers.Map;
    LINEshape = containers.Map;
    POLYLINEshape = containers.Map;
    
    strokes = containers.Map;
    substrokes = containers.Map;
    
    points = containers.Map;
    for i=0:allPoints.getLength-1
        points(char(allPoints.item(i).getAttribute('id'))) = allPoints.item(i);
    end
    %allPoints.getLength    % print number of points
    
    
    for i=0:allShapes.getLength-1
        if allShapes.item(i).getAttribute('type').equals('ellipse')
            ELLIPSEshape(char(allShapes.item(i).getAttribute('id')))=allShapes.item(i);
        end
        if allShapes.item(i).getAttribute('type').equals('arrow')
            ARROWshape(char(allShapes.item(i).getAttribute('id')))=allShapes.item(i);
        end
        if allShapes.item(i).getAttribute('type').equals('box')
            BOXshape(char(allShapes.item(i).getAttribute('id')))=allShapes.item(i);
        end    
        if allShapes.item(i).getAttribute('type').equals('line')
            LINEshape(char(allShapes.item(i).getAttribute('id')))=allShapes.item(i);
        end    
        if allShapes.item(i).getAttribute('type').equals('polyline')
            POLYLINEshape(char(allShapes.item(i).getAttribute('id')))=allShapes.item(i);
        end  
        if allShapes.item(i).getAttribute('type').equals('substroke')
            substrokes(char(allShapes.item(i).getAttribute('id')))=allShapes.item(i);
        end
        if allShapes.item(i).getAttribute('type').equals('stroke')
            strokes(char(allShapes.item(i).getAttribute('id')))=allShapes.item(i);
        end       
    end
    
    
    %ARROWS
    avals = ARROWshape.values;
    for i=1:length(avals)
        DOMsubstrokes = avals{i}.getElementsByTagName('arg');
        %DOMsubstrokes.getLength
        
        rawstrokes = cell(1,DOMsubstrokes.getLength);
        strokerelation = zeros(1,DOMsubstrokes.getLength);
        
        for j=0:DOMsubstrokes.getLength - 1
            relation = char(DOMsubstrokes.item(j).getAttribute('rel'));
            substrokeID = char(DOMsubstrokes.item(j).getFirstChild.getData);
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
            strokerelation(j+1) = str2num(relation);
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
            
        %strokerelation
        %rawstrokes
        ARROWstrokerelations{length(ARROWexamples3) + 1} = strokerelation;
        ARROWexamples3{length(ARROWexamples3) + 1} = rawstrokes;               
    end
    
    
    %ELLIPSES
    evals = ELLIPSEshape.values;
    for i=1:length(evals)
        DOMsubstrokes = evals{i}.getElementsByTagName('arg');
        %DOMsubstrokes.getLength
        
        rawstrokes = cell(1,DOMsubstrokes.getLength);
        strokerelation = zeros(1,DOMsubstrokes.getLength);
        
        for j=0:DOMsubstrokes.getLength - 1
            relation = char(DOMsubstrokes.item(j).getAttribute('rel'));
            substrokeID = char(DOMsubstrokes.item(j).getFirstChild.getData);
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
            strokerelation(j+1) = str2num(relation);
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
            
        %strokerelation
        %rawstrokes
        ELLIPSEstrokerelations{length(ELLIPSEexamples3) + 1} = strokerelation;
        ELLIPSEexamples3{length(ELLIPSEexamples3) + 1} = rawstrokes;               
    end    
    

    
    %BOX
    bvals = BOXshape.values;
    for i=1:length(bvals)
        DOMsubstrokes = bvals{i}.getElementsByTagName('arg');
        %DOMsubstrokes.getLength
        
        rawstrokes = cell(1,DOMsubstrokes.getLength);
        strokerelation = zeros(1,DOMsubstrokes.getLength);
        
        for j=0:DOMsubstrokes.getLength - 1
            relation = char(DOMsubstrokes.item(j).getAttribute('rel'));
            substrokeID = char(DOMsubstrokes.item(j).getFirstChild.getData);
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
            strokerelation(j+1) = str2num(relation);
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
            
        %strokerelation
        %rawstrokes
        BOXstrokerelations{length(BOXexamples3) + 1} = strokerelation;
        BOXexamples3{length(BOXexamples3) + 1} = rawstrokes;               
    end    
    
    
    
    
    %LINES
    lvals = LINEshape.values;
    for i=1:length(lvals)
        DOMsubstrokes = lvals{i}.getElementsByTagName('arg');
        %DOMsubstrokes.getLength
        
        rawstrokes = cell(1,DOMsubstrokes.getLength);
        strokerelation = zeros(1,DOMsubstrokes.getLength);
        
        for j=0:DOMsubstrokes.getLength - 1
            relation = char(DOMsubstrokes.item(j).getAttribute('rel'));
            substrokeID = char(DOMsubstrokes.item(j).getFirstChild.getData);
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
            strokerelation(j+1) = str2num(relation);
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
            
        %strokerelation
        %rawstrokes
        LINEstrokerelations{length(LINEexamples3) + 1} = strokerelation;
        LINEexamples3{length(LINEexamples3) + 1} = rawstrokes;               
    end    
    
   
    
    %POLYLINE
    povals = POLYLINEshape.values;
    for i=1:length(povals)
        DOMsubstrokes = povals{i}.getElementsByTagName('arg');
        %DOMsubstrokes.getLength
        
        rawstrokes = cell(1,DOMsubstrokes.getLength);
        strokerelation = zeros(1,DOMsubstrokes.getLength);
        
        for j=0:DOMsubstrokes.getLength - 1
            relation = char(DOMsubstrokes.item(j).getAttribute('rel'));
            substrokeID = char(DOMsubstrokes.item(j).getFirstChild.getData);
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
            strokerelation(j+1) = str2num(relation);
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
            
        %strokerelation
        %rawstrokes
        POLYLINEstrokerelations{length(POLYLINEexamples3) + 1} = strokerelation;
        POLYLINEexamples3{length(POLYLINEexamples3) + 1} = rawstrokes;               
    end    
    
    
    
    
end

    fprintf('- FINISHED -\n\n');
