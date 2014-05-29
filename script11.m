% All the commands, in order, to run experiments on family tree diagrams.
% Shape classes to be tested: ellipse, arrow, box, line, polyline

fprintf('\n\n***** STARTING *****\n');


%SWITCH FROM REGULAR TO RANDOM MODE
random = 1;

if(random == 1)
    fprintf('MODE = random\n\n');
    crossvalidationgenerator;
else
    fprintf('MODE = regular\n\n');
end    

extract_familytree;
extractgrouped_familytree;


fprintf('=============== GENERATING TEMPLATES =================\n');

fprintf('Generating ellipse template...');
ELLIPSEtemplate = genlengthtemplatemedian(ELLIPSEexamples{1}, ELLIPSEexamples);
fprintf('...success\n');

fprintf('Generating ellipse template...');
ARROWtemplate = genlengthtemplatemedian(ARROWexamples{1}, ARROWexamples);
fprintf('...success\n');

fprintf('Generating ellipse template...');
BOXtemplate = genlengthtemplatemedian(BOXexamples{1}, BOXexamples);
fprintf('...success\n');

fprintf('Generating ellipse template...');
LINEtemplate = genlengthtemplatemedian(LINEexamples{1}, LINEexamples);
fprintf('...success\n');

fprintf('Generating ellipse template...');
POLYLINEtemplate = genlengthtemplatemedian(POLYLINEexamples{1}, POLYLINEexamples);
fprintf('...success\n');

script10;

fprintf('\n\n\n***** DONE!!! *****\n');