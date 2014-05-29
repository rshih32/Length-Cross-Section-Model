randomexamples = {};
randomexamples3 = {};

%==========================================================================
%{BODY_START%}
    %turn this on for debug mode (0 OFF, 1 COLLECTION, 2 SELECTING PERFECTS, 3 SELECTING SYNTHESIZED, 4 COMBINING)
    debug = 0;
    fprintf('\n====== CROSS VALIDATION GENERATOR ======\n');
    
    MAXEXAMPLES = 10;       % max number of examples to be chosen to create templates NOT FOR POLYLINE
   
    
    
    
    
    
    % =========================== COLLECTION ===============================    
    
    perfectfiles = parsing.getAllFiles('C:\Users\Ren\Desktop\Week9_data\perfect');
    %synthesizedfiles = parsing.getAllFiles('C:\Users\Ren\Desktop\Week9_data\synthesized\unclean');
    synthesizedfiles = parsing.getAllFiles('C:\Users\Ren\Desktop\Week9_data\synthesized\clean');
    if(debug == 1)
        length(perfectfiles)
        length(synthesizedfiles)
    end

    
    ellipse_count = 0;
    box_count = 0;
    arrow_count = 0;
    line_count = 0;
    polyline_count = 0;
    
    ellipse_perfects = {};
    box_perfects = {};
    arrow_perfects = {};
    line_perfects = {};
    polyline_perfects = {};
    
    fprintf('Counting perfect files...');
    for f=1: length(perfectfiles)

        xmlfile = perfectfiles{f};

        if( ~isempty(strfind(xmlfile, 'ellipse')) )
          ellipse_count = ellipse_count + 1;
          ellipse_perfects{length(ellipse_perfects)+1} = xmlfile;
        elseif( ~isempty(strfind(xmlfile, 'box')) )
          box_count = box_count + 1;
          box_perfects{length(box_perfects)+1} = xmlfile;
        elseif( ~isempty(strfind(xmlfile, 'arrow')) )
          arrow_count = arrow_count + 1;
          arrow_perfects{length(arrow_perfects)+1} = xmlfile;
        elseif( ~isempty(strfind(xmlfile, 'poly')) )
          polyline_count = polyline_count + 1;
          polyline_perfects{length(polyline_perfects)+1} = xmlfile;
        elseif( ~isempty(strfind(xmlfile, 'line')) )
          line_count = line_count + 1;
          line_perfects{length(line_perfects)+1} = xmlfile;
        else
           xmlfile 
        end
    end
    if( length(perfectfiles) ~= (ellipse_count + box_count + arrow_count + line_count + polyline_count) )
         fprintf('!!! ERROR !!! perfect counts do not match up with number of files \n');
         (ellipse_count + box_count + arrow_count + line_count + polyline_count)
    else
        fprintf('...success.\n');
    end
    if(debug == 1)
        ellipse_count
        box_count
        arrow_count
        line_count
        polyline_count
        (ellipse_count + box_count + arrow_count + line_count + polyline_count)
        length(ellipse_perfects)+length(box_perfects)+length(arrow_perfects)+length(line_perfects)+length(polyline_perfects) 
    end    
    
   
    ellipse_count = 0;
    box_count = 0;
    arrow_count = 0;
    line_count = 0;
    polyline_count = 0;
   
    ellipse_synthesized = {};
    box_synthesized = {};
    arrow_synthesized = {};
    line_synthesized = {};
    polyline_synthesized = {};
    

    fprintf('Counting synthesized files...');
    for f=1: length(synthesizedfiles)

        xmlfile = synthesizedfiles{f};

        if( ~isempty(strfind(xmlfile, 'ellipse')) )
          ellipse_count = ellipse_count + 1;
          ellipse_synthesized{length(ellipse_synthesized)+1} = xmlfile;
        elseif( ~isempty(strfind(xmlfile, 'box')) )
          box_count = box_count + 1;
          box_synthesized{length(box_synthesized)+1} = xmlfile;
        elseif( ~isempty(strfind(xmlfile, 'arrow')) )
          arrow_count = arrow_count + 1;
          arrow_synthesized{length(arrow_synthesized)+1} = xmlfile;
        elseif( ~isempty(strfind(xmlfile, 'poly')) )
          polyline_count = polyline_count + 1;
          polyline_synthesized{length(polyline_synthesized)+1} = xmlfile;
        elseif( ~isempty(strfind(xmlfile, 'line')) )
          line_count = line_count + 1;
          line_synthesized{length(line_synthesized)+1} = xmlfile;
        else
           xmlfile
        end
    end
    if( length(synthesizedfiles) ~= (ellipse_count + box_count + arrow_count + line_count + polyline_count) )
         fprintf('!!! ERROR !!! synthesized counts do not match up with number of files \n');
         (ellipse_count + box_count + arrow_count + line_count + polyline_count)
    else
        fprintf('...success.\n');
    end

    if(debug == 1) 
        ellipse_count
        box_count
        arrow_count
        line_count
        polyline_count
        (ellipse_count + box_count + arrow_count + line_count + polyline_count)
        length(ellipse_synthesized)+length(box_synthesized)+length(arrow_synthesized)+length(line_synthesized)+length(polyline_synthesized)         
    end

    
    
    
    
    
    
    % =========================== SELECTING PERFECT EXAMPLES ===============================
    
    totalperfectcount = 0;
    
    %ellipse perfect examples
    fprintf('Choosing perfect examples for ellipse...');
    ellipseselected = cell(MAXEXAMPLES, 1);
    ellipseselected(:) = {''};
    
    if(length(ellipseselected) ~= MAXEXAMPLES)
        fprintf('!!! ERROR !!! wrong ellipseselected');
    end
    if(debug == 2)
        ellipseselected
    end
 
    found = 1;
    while(found < (MAXEXAMPLES+1))
       r = randi(length(ellipse_perfects), 1); 
       tofind = ellipse_perfects{r};
       [tf, index] = ismember(tofind, ellipseselected);

       if(tf == 0)
           ellipseselected{found} = ellipse_perfects{r};
           found = found + 1;
       end
    end
    if(debug == 2)
        ellipseselected
    end
    ellipse_perfect_count = length(ellipseselected);
    totalperfectcount = totalperfectcount + ellipse_perfect_count;
    fprintf('...success.\n');
    
    
    %box perfect examples
    fprintf('Choosing perfect examples for box...');
    boxselected = cell(MAXEXAMPLES, 1);
    boxselected(:) = {''};
    
    if(length(boxselected) ~= MAXEXAMPLES)
        fprintf('!!! ERROR !!! wrong boxselected');
    end
    if(debug == 2)
        boxselected
    end    
    
    found = 1;
    while(found < (MAXEXAMPLES+1))
       r = randi(length(box_perfects), 1); 
       tofind = box_perfects{r};
       [tf, index] = ismember(tofind, boxselected);

       if(tf == 0)
           boxselected{found} = box_perfects{r};
           found = found + 1;
       end
    end
    if(debug == 2)
        boxselected
    end    
    box_perfect_count = length(boxselected);
    totalperfectcount = totalperfectcount + box_perfect_count;
    fprintf('...success.\n');
    
    
    %arrow perfect examples
    fprintf('Choosing perfect examples for perfect...');
    arrowselected = cell(MAXEXAMPLES, 1);
    arrowselected(:) = {''};
    
    if(length(arrowselected) ~= MAXEXAMPLES)
        fprintf('!!! ERROR !!! wrong arrowselected');
    end
    if(debug == 2)
        arrowselected
    end       
    
    found = 1;
    while(found < (MAXEXAMPLES+1))
       r = randi(length(arrow_perfects), 1); 
       tofind = arrow_perfects{r};
       [tf, index] = ismember(tofind, arrowselected);

       if(tf == 0)
           arrowselected{found} = arrow_perfects{r};
           found = found + 1;
       end
    end
    if(debug == 2)
        arrowselected
    end      
    arrow_perfect_count = length(arrowselected);
    totalperfectcount = totalperfectcount + arrow_perfect_count;
    fprintf('...success.\n');
    
     
    %line perfect examples
    fprintf('Choosing perfect examples for line...');
    lineselected = cell(MAXEXAMPLES, 1);
    lineselected(:) = {''};
    
    if(length(lineselected) ~= MAXEXAMPLES)
        fprintf('!!! ERROR !!! wrong arrowselected');
    end
    if(debug == 2)
        lineselected
    end       
    
    found = 1;
    while(found < (MAXEXAMPLES+1))
       r = randi(length(line_perfects), 1); 
       tofind = line_perfects{r};
       [tf, index] = ismember(tofind, lineselected);

       if(tf == 0)
           lineselected{found} = line_perfects{r};
           found = found + 1;
       end
    end
    if(debug == 2)
        lineselected
    end     
    line_perfect_count = length(lineselected);
    totalperfectcount = totalperfectcount + line_perfect_count;
    fprintf('...success.\n');
    
    
    %do nothing for polyline - use all perfect examples (for now)
    fprintf('Choosing perfect examples for polyline...');
    polylineselected = polyline_perfects;
    if(debug == 2)
        polylineselected
    end 
    polyline_perfect_count = length(polylineselected);
    totalperfectcount = totalperfectcount + polyline_perfect_count;
    fprintf('...success.\n');

    
    
    
    % =========================== SELECTING SYNTHESIZED EXAMPLES ===============================

    totalsynthesizedcount = 0;
    
    
    % parse (41:44 // 53:56) - perfect, (41:44 // 51:54) - synthesized -- WILL CHANGE BASED ON PATH TO FILES
    MINP = 41;
    MAXP = 44;
    
    MINS = 51;
    MAXS = 54;
    
    %ellipses
    fprintf('Choosing synthesized examples for ellipse...');
    ellipse_synthchosen = {};
    for i=1:length(ellipseselected)
        tmp = ellipseselected{i};
        sketchnum = tmp(MINP:MAXP);
        
        for j=1: length(ellipse_synthesized)
            tmp2 = ellipse_synthesized{j};
            synthnum = tmp2(MINS:MAXS);
          
            if(debug == 3)
                sketchnum 
                synthnum
            end    
            
            if(strcmp(sketchnum,synthnum) ~= 0)
               ellipse_synthchosen{length(ellipse_synthchosen)+1} = tmp2;
            end    
        end
    end
    if(debug == 3)
        ellipse_synthchosen
    end    
    ellipse_synths_count = length(ellipse_synthchosen);
    totalsynthesizedcount = totalsynthesizedcount + ellipse_synths_count;
    fprintf('...success.\n');
   
    
    %box
    fprintf('Choosing synthesized examples for box...');
    box_synthchosen = {};
    for i=1:length(boxselected)
        tmp = boxselected{i};
        sketchnum = tmp(MINP:MAXP);
        
        for j=1: length(box_synthesized)
            tmp2 = box_synthesized{j};
            synthnum = tmp2(MINS:MAXS);
        
            if(strcmp(sketchnum,synthnum) ~= 0)
               box_synthchosen{length(box_synthchosen)+1} = tmp2;
            end    
        end
    end
    if(debug == 3)
        box_synthchosen
    end     
    box_synths_count = length(box_synthchosen);
    totalsynthesizedcount = totalsynthesizedcount + box_synths_count;
    fprintf('...success.\n');
    
    
    %arrow
    fprintf('Choosing synthesized examples for arrow...');
    arrow_synthchosen = {};
    for i=1:length(arrowselected)
        tmp = arrowselected{i};
        sketchnum = tmp(MINP:MAXP);
        
        for j=1: length(arrow_synthesized)
            tmp2 = arrow_synthesized{j};
            synthnum = tmp2(MINS:MAXS);
        
            if(strcmp(sketchnum,synthnum) ~= 0)
               arrow_synthchosen{length(arrow_synthchosen)+1} = tmp2;
            end    
        end
    end
    if(debug == 3)
        arrow_synthchosen
    end      
    arrow_synths_count = length(arrow_synthchosen);
    totalsynthesizedcount = totalsynthesizedcount + arrow_synths_count;
    fprintf('...success.\n');
    
    
    %line
    fprintf('Choosing synthesized examples for line...');
    line_synthchosen = {};
    for i=1:length(lineselected)
        tmp = lineselected{i};
        sketchnum = tmp(MINP:MAXP);
        
        for j=1: length(line_synthesized)
            tmp2 = line_synthesized{j};
            synthnum = tmp2(MINS:MAXS);
        
            if(strcmp(sketchnum,synthnum) ~= 0)
               line_synthchosen{length(line_synthchosen)+1} = tmp2;
            end    
        end
    end
    if(debug == 3)
        line_synthchosen
    end     
    line_synths_count = length(line_synthchosen);
    totalsynthesizedcount = totalsynthesizedcount + line_synths_count;
    fprintf('...success.\n');
    
    
    %polyline
    fprintf('Choosing synthesized examples for polyline...');
    polyline_synthchosen = {};
    for i=1:length(polylineselected)
        tmp = polylineselected{i};
        sketchnum = tmp(MINP:MAXP);
        
        for j=1: length(polyline_synthesized)
            tmp2 = polyline_synthesized{j};
            synthnum = tmp2(MINS:MAXS);
        
            if(strcmp(sketchnum,synthnum) ~= 0)
               polyline_synthchosen{length(polyline_synthchosen)+1} = tmp2;
            end    
        end
    end
    if(debug == 3)
        polyline_synthchosen
    end       
    polyline_synths_count = length(polyline_synthchosen);
    totalsynthesizedcount = totalsynthesizedcount + polyline_synths_count;
    fprintf('...success.\n');
    
    
    
    
    % =========================== COMBINING =============================== 
    
    fprintf('Combining perfect and synthesized examples...');
    %perfect examples
    randomexamples = { ellipseselected{:}, boxselected{:}, arrowselected{:}, lineselected{:}, polylineselected{:}};
    
    %synthesized examples
    randomexamples3 = { ellipse_synthchosen{:}, box_synthchosen{:}, arrow_synthchosen{:}, line_synthchosen{:}, polyline_synthchosen{:}};
    
    if((length(randomexamples) ~= totalperfectcount) || (totalperfectcount == 0))
        fprintf('!!! ERROR !!! total perfect counts are wrong');
    end
    
    if((length(randomexamples3) ~= totalsynthesizedcount) || (totalsynthesizedcount == 0) )
        fprintf('!!! ERROR !!! total synthesized counts are wrong');
    end    
    fprintf('...success.\n');
    
    if(debug == 4)
        length(randomexamples)
        totalperfectcount
        length(randomexamples3)
        totalsynthesizedcount
    end    
    
    
    fprintf('- FINISHED -\n');
%{BODY_END%}


