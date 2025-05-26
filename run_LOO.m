%% Leave-one-out (LOO) cross validation 
% Script adapted from Peter Zeidman's PEB tutorial:
% https://github.com/pzeidman/dcm-peb-example

load('GCM.mat');
load('M.mat');

GCM = DCM; % the GCM is stored in a variable called 'DCM' in the GCM.mat file 
M = dm; % the design matrix; it's stored in a variable called 'dm' in the M.mat file 

% make an output dir for the LOO results 
mkdir('output_LOO');

% B(X, X, X): target region, source region, experimental condition
% regions: 1 = V1, 2 = pulvinar, 3 = insula
% experimental conditions: 1 = TASK, 2 = High precision

%% V1 -> pulvinar
[qE, qC, Q] = spm_dcm_loo(GCM, M, {'B(2, 1, 2)'}); % V1 -> pulvinar

% Get the output figure
fig = gcf;

% Save it as a PNG file
saveas(fig, 'output_LOO/LOO_V1_to_pulvinar.png');  

% Save the output values 
save('output_LOO/LOO_V1_to_pulvinar.mat','qE','qC','Q');

%% Pulvinar -> V1
[qE, qC, Q] = spm_dcm_loo(GCM, M, {'B(1, 2, 2)'}); % pulvinar -> V1

% Get the output figure
fig = gcf;

% Save it as a PNG file
saveas(fig, 'output_LOO/LOO_pulvinar_to_V1.png');  

% Save the output values 
save('output_LOO/LOO_pulvinar_to_V1.mat','qE','qC','Q');

%% Pulvinar -> insula
[qE, qC, Q] = spm_dcm_loo(GCM, M, {'B(3, 2, 2)'}); % pulvinar -> insula

% Get the output figure
fig = gcf;

% Save it as a PNG file
saveas(fig, 'output_LOO/LOO_pulvinar_to_insula.png');  

% Save the output values 
save('output_LOO/LOO_pulvinar_to_insula.mat','qE','qC','Q');

%% Insula -> pulvinar
[qE, qC, Q] = spm_dcm_loo(GCM, M, {'B(2, 3, 2)'}); % insula -> pulvinar

% Get the output figure
fig = gcf;

% Save it as a PNG file
saveas(fig, 'output_LOO/LOO_insula_to_pulvinar.png');  

% Save the output values 
save('output_LOO/LOO_insula_to_pulvinar.mat','qE','qC','Q');


