function results = readImage(file)

file = convertStringsToChars(file);
if file(end-3:end) == '.dcm'
    results = (dicomread(file));
else
    results = imread(file);
end
if size(results,3) == 1
    results =cat(3,results,results,results);
end

end