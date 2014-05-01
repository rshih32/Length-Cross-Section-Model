ANDexamples2 = {};
ANDextras = [];
NANDexamples2 = {};
NANDextras = [];
ORexamples2 = {};
ORextras = [];
NORexamples2 = {};
NORextras = [];
XORexamples2 = {};
XORextras = [];
XNORexamples2 = {};
XNORextras = [];
NOTexamples2 = {};
NOTextras = [];
NOTBUBBLEexamples2 = {};
NOTBUBBLEextras = [];
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
    
    [ANDexamples2, ANDextras] = parsing.centerwwire(ANDgates.values, Wires.values, substrokes, points, ANDexamples2, ANDextras);
    [NANDexamples2, NANDextras]=parsing.centerwwire(NANDgates.values, Wires.values, substrokes, points, NANDexamples2, NANDextras);
   [ ORexamples2, ORextras]=parsing.centerwwire(ORgates.values, Wires.values,substrokes, points, ORexamples2, ORextras);
    [NORexamples2, NORextras]=parsing.centerwwire(NORgates.values, Wires.values,substrokes, points, NORexamples2, NORextras);
   [ XORexamples2, XORextras]=parsing.centerwwire(XORgates.values, Wires.values,substrokes, points,XORexamples2, XORextras);
   [ XNORexamples2, XNORextras]=parsing.centerwwire(XNORgates.values, Wires.values,substrokes, points,XNORexamples2, XNORextras);
  [  NOTexamples2, NOTextras]=parsing.centerwwire(NOTgates.values, Wires.values,substrokes, points,NOTexamples2, NOTextras);
   [ NOTBUBBLEexamples2, NOTBUBBLEextras]=parsing.centerwwire(NOTBUBBLEgates.values, Wires.values,substrokes, points,NOTBUBBLEexamples2, NOTBUBBLEextras);

end

