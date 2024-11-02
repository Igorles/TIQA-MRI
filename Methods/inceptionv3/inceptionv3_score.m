function score = inceptionv3_score(imdist,modelName)

load(modelName)

data = imresize(imdist,[299 299]);
score = predict(lgraph,data);

end