function SSEQ_train(imdist,mos,fileName)


for i=1:length(mos)

    feat(i,:) = feature_extract_SEEQ(readImage(imdist{i}),3);

end
savePath = fullfile(pwd, 'Methods', 'SSEQ', 'models');

if ~exist(savePath, 'dir')
    mkdir(savePath); % Create the directory if it doesn't exist
end

minyO=min(feat);  %1) Different features have different ranges. Find them.
maxyO=max(feat);
feat=double(normVec(feat,maxyO,minyO));
imdist2 = imdist;
model_SSEQ = svmtrain(mos, feat, '-s 3 -q');
save(strcat(pwd,filesep,'Methods',filesep,'SSEQ',filesep,'models',filesep,strcat(fileName,'.mat')),'model_SSEQ','imdist2','maxyO','minyO')

end