function score = SNRTOI(image)
image = rgb2gray(image);
windowSize=13;
s1=size(image,2);
s2=size(image,1);
pointMiddle=[s1/2,s2/2];
pointEdge=[windowSize+1,windowSize+1];
pS=extractFeatures(image, pointMiddle,'Method', 'BLOCK','BlockSize' ,windowSize);
pB=extractFeatures(image, pointEdge,'Method', 'BLOCK','BlockSize' ,windowSize);
snR= 0.655*mean(double(pS))/std(double(pB));
score=snR;
end