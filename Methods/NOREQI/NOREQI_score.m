function score = NOREQI_score(imdist,modelName)

load(modelName)

feat = NOREQI(imdist);
feat = double(normVec(feat,maxyO,minyO));
feat(isnan(feat))=0;
[score, ~, ~] = svmpredict(1,feat, model_NOREQI ,' -q');

end






 
