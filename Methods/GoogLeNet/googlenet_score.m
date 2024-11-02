function score = googlenet_score(imdist,modelName)

load(modelName)

data = imresize(imdist,[224 224]);
score = predict(lgraph,data);

end