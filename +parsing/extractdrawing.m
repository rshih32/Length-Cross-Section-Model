%files = parsing.getAllFiles('data/Labeled/Labeled_Summer_2007');
files = parsing.getAllFiles('data/UCR_Gate_Study_Data');
Sketches={};
for f=1: 5%length(files)
    f
    xmlfile = files{f};
    DOMnode = xmlread(xmlfile);
    allShapes = DOMnode.getElementsByTagName('shape');
    allPoints = DOMnode.getElementsByTagName('point');

    substrokes = containers.Map;
    points = containers.Map;
    
    for i=0:allShapes.getLength-1
        
        if allShapes.item(i).getAttribute('type').equals('substroke')
            substrokes(char(allShapes.item(i).getAttribute('id')))=allShapes.item(i);
        end
        
    end
    
    for i=0:allPoints.getLength-1
        points(char(allPoints.item(i).getAttribute('id'))) = allPoints.item(i);
    end
    allPoints.getLength
    
    Sketches = parsing.getsketch(substrokes, points, Sketches);
    

end

