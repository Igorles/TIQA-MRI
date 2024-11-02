function score = SSEQ_score(imdist,modelName)

load(modelName)

feat = feature_extract_SEEQ(imdist,3);
feat = double(normVec(feat,maxyO,minyO));
feat(isnan(feat))=0;
[score, ~, ~] = svmpredict(1,feat, model_SSEQ ,' -q');

end