%% process CW vectors

% Input file
inputFilebase = '../data/mpqa/mpqa';
inputpos = [inputFilebase '.pos'];
inputneg = [inputFilebase '.neg'];
outputname = '../data/mpqa/allSStrMPQA.mat';


%Create hash table for the word list
fid = fopen(inputpos, 'r');
linespos = textscan(fid, '%s', 'delimiter', '\n', 'bufsize', 100000);
fclose(fid);
linespos=linespos{1};


fid = fopen(inputneg, 'r');
linesneg = textscan(fid, '%s', 'delimiter', '\n', 'bufsize', 100000);
fclose(fid);
linesneg=linesneg{1};

allSStrMPQA = {};
for i = 1:length(linespos)
    if mod(i, 1000) == 0; 
        fprintf('processing line %d of %d\n', i, length(lines));
    end
    
    line = regexp(strtrim(linespos{i}),' ','split');
    
    allSStrMPQA{end+1} = line;
    
end

for i = 1:length(linesneg)
    if mod(i, 100) == 0; 
        fprintf('processing line %d of %d\n', i, length(lines));
    end
    
    line = regexp(strtrim(linesneg{i}),' ','split');
    allSStrMPQA{end+1} = line;
end
labels = false(1,length(allSStrMPQA));
labels(1:length(linespos)) = true;
save(outputname, 'allSStrMPQA', 'labels');