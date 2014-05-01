ANDexamples = {};
NANDexamples = {};
ORexamples = {};
NORexamples = {};
XORexamples = {};
XNORexamples = {};
NOTexamples = {};
NOTBUBBLEexamples = {};
files = parsing.getAllFiles('data/UCR_Gate_Study_Data');
for f=1: length(files)
    f
    xmlfile = files{f};
    DOMnode = xmlread(xmlfile);
    allShapes = DOMnode.getElementsByTagName('shape');
    allPoints = DOMnode.getElementsByTagName('point');

    ANDgates = containers.Map;
    NANDgates = containers.Map;
    ORgates = containers.Map;
    NORgates = containers.Map;
    XORgates = containers.Map;
    XNORgates = containers.Map;
    NOTgates = containers.Map;
    NOTBUBBLEgates = containers.Map;

    Labels = containers.Map;
    Wires = containers.Map;
    substrokes = containers.Map;
    strokes = containers.Map;
    points = containers.Map;
    f
    for i=0:allShapes.getLength-1
        if allShapes.item(i).getAttribute('type').equals('AND')
            ANDgates(char(allShapes.item(i).getAttribute('id')))=allShapes.item(i);
        end
        if allShapes.item(i).getAttribute('type').equals('NAND')
            NANDgates(char(allShapes.item(i).getAttribute('id')))=allShapes.item(i);
        end
        if allShapes.item(i).getAttribute('type').equals('OR')
            ORgates(char(allShapes.item(i).getAttribute('id')))=allShapes.item(i);
        end
        if allShapes.item(i).getAttribute('type').equals('NOR')
            NORgates(char(allShapes.item(i).getAttribute('id')))=allShapes.item(i);
        end
        if allShapes.item(i).getAttribute('type').equals('XOR')
            XORgates(char(allShapes.item(i).getAttribute('id')))=allShapes.item(i);
        end
        if allShapes.item(i).getAttribute('type').equals('XNOR')
            XNORgates(char(allShapes.item(i).getAttribute('id')))=allShapes.item(i);
        end
        if allShapes.item(i).getAttribute('type').equals('NOT')
            NOTgates(char(allShapes.item(i).getAttribute('id')))=allShapes.item(i);
        end
        if allShapes.item(i).getAttribute('type').equals('NOTBUBBLE')
            NOTBUBBLEgates(char(allShapes.item(i).getAttribute('id')))=allShapes.item(i);
        end
        if allShapes.item(i).getAttribute('type').equals('Label')
            Labels(char(allShapes.item(i).getAttribute('id')))=allShapes.item(i);
        end
        if allShapes.item(i).getAttribute('type').equals('Wire')
            Wires(char(allShapes.item(i).getAttribute('id')))=allShapes.item(i);
        end
        if allShapes.item(i).getAttribute('type').equals('substroke')
            substrokes(char(allShapes.item(i).getAttribute('id')))=allShapes.item(i);
        end
        if allShapes.item(i).getAttribute('type').equals('stroke')
            strokes(char(allShapes.item(i).getAttribute('id')))=allShapes.item(i);
        end
    end
    allShapes.getLength
    for i=0:allPoints.getLength-1
        points(char(allPoints.item(i).getAttribute('id'))) = allPoints.item(i);
    end
    allPoints.getLength
    
    ANDexamples = parsing.center(ANDgates.values, substrokes, points, ANDexamples);
    NANDexamples=parsing.center(NANDgates.values, substrokes, points, NANDexamples);
    ORexamples=parsing.center(ORgates.values, substrokes, points, ORexamples);
    NORexamples=parsing.center(NORgates.values, substrokes, points, NORexamples);
    XORexamples=parsing.center(XORgates.values, substrokes, points,XORexamples);
    XNORexamples=parsing.center(XNORgates.values, substrokes, points,XNORexamples);
    NOTexamples=parsing.center(NOTgates.values, substrokes, points,NOTexamples);
    NOTBUBBLEexamples=parsing.center(NOTBUBBLEgates.values, substrokes, points,NOTBUBBLEexamples);

end

