function gwh_glbp_biqa_train(imdist,mos,fileName)


for i=1:length(mos)

    feat(i,:) = gwhglbp_feature(double(rgb2gray(readImage(imdist{i}))));
end

savePath = fullfile(pwd, 'Methods', 'GWH-GLBP-BIQA', 'models');

if ~exist(savePath, 'dir')
    mkdir(savePath); % Create the directory if it doesn't exist
end

imdist2 = imdist;
model_gwhglbp = svmtrain(mos, feat, '-s 3 -g 2 -c 100  -q ');
save(strcat(pwd,filesep,'Methods',filesep,'GWH-GLBP-BIQA',filesep,'models',filesep,strcat(fileName,'.mat')),'model_gwhglbp','imdist2')

end