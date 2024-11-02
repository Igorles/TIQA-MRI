function score = gwh_glbp_biqa(imdist,modelName)

load(modelName)

feat = gwhglbp_feature(double(rgb2gray(imdist)));

[score, ~, ~] = svmpredict(1,feat, model_gwhglbp ,' -q');

end