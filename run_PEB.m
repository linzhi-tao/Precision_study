%% Parametric empirical Bayes (PEB)
% Script adapted from Peter Zeidman's PEB tutorial:
% https://github.com/pzeidman/dcm-peb-example

% Expects the GCM.mat & M.mat file in the current directory

clear 
close all 

%% Load GCM.mat & M.mat (design matrix) files and run BMR 
load('GCM.mat');
load('M.mat'); % a list of ones (n = 29) and a list of values of the behavioural measure: high-precision effect 
% High-precision effect = response accuracy in the high precision condition - average response accuracy across all precision conditions

mkdir('output_PEB');

%% PEB specification
X = dm.X; % dm stores the prepared design matrix 
K = width(X);
X(:,2:K)=X(:,2:K)-mean(X(:,2:K)); % the Zeidman tutorial: Optionally, you might want to mean-centre columns 2 to K, where K is the number of columns. This will give the 1st column the interpretation of the mean connectivity across subjects. If they are not mean-centred, the 1st column will represent the baseline or intercept. 
X_labels = dm.labels; 

M = struct();
M.Q = 'all'; % the PEB tutorial uses 'all' and explains: The 'all' option means the between-subject variability of each connection will be estimated individually
M.X = X;
M.Xnames = X_labels;

%% PEB model estimation (select DCM parameters to take to 2nd level)
% Under Fields, select which fields of the DCM to model at the group level. 
% The PEB tutorial: We recommend keeping this to a small number of parameters. If, for instance, you're interested in the A-matrix and the B-matrix, then run a separate PEB analysis on each.
[PEB, RCM] = spm_dcm_peb(DCM, M, {'B'});
save('output_PEB/PEB.mat', 'PEB', 'RCM');

%% PEB model comparison (automatic search over reduced PEB models)
% Perform Bayesian Model Reduction (BMR) and Bayesian Model Averaging (BMA)
% BMR: the software specifies and compares all candidate reduced PEB models, in which different combinations of parmeters have been switched off
% BMA: the software then averages the parameters (connection strengths) from the best reduced models

BMA = spm_dcm_peb_bmc(PEB); 
save('output_PEB/BMA_search.mat', 'BMA');

%% Review BMA
spm_dcm_peb_review(BMA, DCM);

% prepare to save the output figures
figHandles = findall(0, 'Type', 'figure');

% save each of the figures
for i = 1:length(figHandles)
    fig = figHandles(i);
    filename = fullfile('output_PEB', sprintf('PEB_review_plot%d.png', i));
    saveas(fig, filename);
end
