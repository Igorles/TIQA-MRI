function googlenet_train(imdist,mos,fileName)

lgraph = imagePretrainedNetwork("googlenet");
lgraph = removeLayers(lgraph, {'loss3-classifier', 'prob', 'prob'});
lgraph = addLayers(lgraph, fullyConnectedLayer(1, 'Name', 'fc_regression'));
lgraph = addLayers(lgraph, regressionLayer('Name', 'regressionoutput'));

lgraph = connectLayers(lgraph, 'pool5-drop_7x7_s1', 'fc_regression');
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

lgraph = layerGraph(lgraph);
lgraph = trainNetwork(dsTrain, lgraph, options);


savePath = fullfile(pwd, 'Methods', 'GoogLeNet', 'models');

if ~exist(savePath, 'dir')
    mkdir(savePath); % Create the directory if it doesn't exist
end

save(strcat(pwd,filesep,'Methods',filesep,'GoogLeNet',filesep,'models',filesep,strcat(fileName,'.mat')),'lgraph')
end

function data = customReadImage(filename)
% code from default function:
onState = warning('off', 'backtrace');
c = onCleanup(@() warning(onState));
data = imread(filename); % added lines:
data = imresize(data,[224 224]);
end