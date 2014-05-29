ELLIPSEexamples = {};
ARROWexamples = {};
BOXexamples = {};
LINEexamples = {};
POLYLINEexamples = {};



fprintf('\n====== EXTRACT_FAMILYTREE ======\n');

%check if random mode
if(random == 0)
    fprintf('extract_familytree - regular mode: working with ');
    files = parsing.getAllFiles('C:\Users\Ren\Desktop\Week9_data\perfect');  % CHANGE DATAPATH
    fprintf('%d examples.\n', length(files));
else
    fprintf('extract_familytree - random mode : working with ');
    files = randomexamples; 
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

    substrokes = containers.Map;
    strokes = containers.Map;
    points = containers.Map;
    
    %f
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
    %allShapes.getLength
    for i=0:allPoints.getLength-1
        points(char(allPoints.item(i).getAttribute('id'))) = allPoints.item(i);
    end
    %allPoints.getLength 
    
    ELLIPSEexamples = parsing.center(ELLIPSEshape.values, substrokes, points, ELLIPSEexamples);
    ARROWexamples = parsing.center(ARROWshape.values, substrokes, points, ARROWexamples);
    BOXexamples = parsing.center(BOXshape.values, substrokes, points, BOXexamples);
    LINEexamples = parsing.center(LINEshape.values, substrokes, points, LINEexamples);
    POLYLINEexamples = parsing.center(POLYLINEshape.values, substrokes, points, POLYLINEexamples);
    
end  

    fprintf('- FINISHED -\n\n');
