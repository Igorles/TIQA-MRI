function inceptionv3_train(imdist,mos,fileName)

lgraph = imagePretrainedNetwork("inceptionv3");
lgraph = removeLayers(lgraph, {'predictions', 'predictions_softmax'});
lgraph = addLayers(lgraph, fullyConnectedLayer(1, 'Name', 'fc_regression'));
lgraph = addLayers(lgraph, regressionLayer('Name', 'regressionoutput'));

lgraph = connectLayers(lgraph, 'avg_pool', 'fc_regression');
lgraph = connectLayers(lgraph, 'fc_regression', 'regressionoutput');

train = imageDatastore(imdist);
trainScores = arrayDatastore(mos);
train.ReadFcn = @customReadImage;

miniBatchSize = 16;
maxEpochs = 15;

dsTrain = combine(train,trainScores);

options = trainingOptions("sgdm", ...
    MiniBatchSize=miniBatchSize, ...
    InitialLearnRate=1e-3, ...
    LearnRateSchedule="piecewise", ...
    LearnRateDropFactor=0.1, ...
    MaxEpochs=maxEpochs, ...
    Shuffle="every-epoch", ...
    Plots="none", ...
    Verbose=false);

savePath = fullfile(pwd, 'Methods', 'inceptionv3', 'models');

if ~exist(savePath, 'dir')
    mkdir(savePath); % Create the directory if it doesn't exist
end

lgraph = layerGraph(lgraph);
lgraph = trainNetwork(dsTrain, lgraph, options);
save(strcat(pwd,filesep,'Methods',filesep,'inceptionv3',filesep,'models',filesep,strcat(fileName,'.mat')),'lgraph')
end

function data = customReadImage(filename)
% code from default function:
onState = warning('off', 'backtrace');
c = onCleanup(@() warning(onState));
data = imread(filename); % added lines:
data = imresize(data,[299 299]);
end