function NOREQI_train(imdist,mos,fileName)


for i=1:length(mos)

    feat(i,:) = NOREQI(readImage(imdist{i}));

end
savePath = fullfile(pwd, 'Methods', 'NOREQI', 'models');

if ~exist(savePath, 'dir')
    mkdir(savePath); % Create the directory if it doesn't exist
end

minyO=min(feat);  %1) Different features have different ranges. Find them.
maxyO=max(feat);
feat=double(normVec(feat,maxyO,minyO));
imdist2 = imdist;
model_NOREQI = svmtrain(mos, feat, '-s 3 -g 0.02083 -c 50 -p 0 -q');
save(strcat(pwd,filesep,'Methods',filesep,'NOREQI',filesep,'models',filesep,strcat(fileName,'.mat')),'model_NOREQI','maxyO','minyO','imdist2','mos')

end