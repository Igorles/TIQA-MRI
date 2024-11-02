function qualityscore  = BRISQUE(imdist)

if(size(imdist,3)==3)
    imdist = uint8(imdist);
    imdist = rgb2gray(imdist);
end

feat = double(imdist);

% if(nargin<2)
% feat = brisque_feature(imdist);
% 
% end


%---------------------------------------------------------------------
%Quality Score Computation
%---------------------------------------------------------------------
load(strcat(pwd,filesep,'Methods',filesep,'BRISQUE',filesep','model.mat'),'model_Brisque')

            % cd(strcat(pwd,filesep,'IQA_Methods',filesep,'BRISQUE'))
            feat = brisque_feature(feat);
            feat(isnan(feat))=0;
            [qualityscore, ~, ~] = svmpredict(1,feat, model_Brisque ,' -q');


% fid = fopen('test_ind','w');
% 
% for jj = 1:size(feat,1)
%     
% fprintf(fid,'1 ');
% for kk = 1:size(feat,2)
% fprintf(fid,'%d:%f ',kk,feat(jj,kk));
% end
% fprintf(fid,'\n');
% end
% 
% fclose(fid);
% % warning off all
% delete output test_ind_scaled dump
% system('svm-scale -r allrange test_ind >> test_ind_scaled');
% system('svm-predict -b 1 test_ind_scaled allmodel output >>dump');
% 
% load output
% qualityscore = output;


