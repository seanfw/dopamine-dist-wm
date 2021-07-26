load anatomical_data/beta_bin_hierarchy_subgraph.mat

% Let's carefully fill in the results from Figures 3 & 4 of Leavitt et al's
% compilations of the delay activity literature.

positive_reports = nan(length(hierarchy_vals_subgraph),1);
negative_reports = nan(length(hierarchy_vals_subgraph),1);

positive_reports(strmatch('V1',subgraph_hierarchical_order,'exact')) = 2;
negative_reports(strmatch('V1',subgraph_hierarchical_order,'exact')) = 3;

positive_reports(strmatch('V2',subgraph_hierarchical_order,'exact')) = 1;
negative_reports(strmatch('V2',subgraph_hierarchical_order,'exact')) = 0;

positive_reports(strmatch('V4',subgraph_hierarchical_order,'exact')) = 2;
negative_reports(strmatch('V4',subgraph_hierarchical_order,'exact')) = 3;

positive_reports(strmatch('1',subgraph_hierarchical_order,'exact')) = 0;
negative_reports(strmatch('1',subgraph_hierarchical_order,'exact')) = 3;

positive_reports(strmatch('3',subgraph_hierarchical_order,'exact')) = 0;
negative_reports(strmatch('3',subgraph_hierarchical_order,'exact')) = 3;

positive_reports(strmatch('MT',subgraph_hierarchical_order,'exact')) = 0;
negative_reports(strmatch('MT',subgraph_hierarchical_order,'exact')) = 5;

% V6 no studies
% DP no studies
% TEO no studies

positive_reports(strmatch('8m',subgraph_hierarchical_order,'exact')) = 18;
negative_reports(strmatch('8m',subgraph_hierarchical_order,'exact')) = 0;

positive_reports(strmatch('F4',subgraph_hierarchical_order,'exact')) = 1;
negative_reports(strmatch('F4',subgraph_hierarchical_order,'exact')) = 0;

positive_reports(strmatch('5',subgraph_hierarchical_order,'exact')) = 1;
negative_reports(strmatch('5',subgraph_hierarchical_order,'exact')) = 0;

positive_reports(strmatch('2',subgraph_hierarchical_order,'exact')) = 1;
negative_reports(strmatch('2',subgraph_hierarchical_order,'exact')) = 2;

positive_reports(strmatch('8l',subgraph_hierarchical_order,'exact')) = 15;
negative_reports(strmatch('8l',subgraph_hierarchical_order,'exact')) = 0;

% F1 no studies

positive_reports(strmatch('STPc',subgraph_hierarchical_order,'exact')) = 1;
negative_reports(strmatch('STPc',subgraph_hierarchical_order,'exact')) = 0;

positive_reports(strmatch('7A',subgraph_hierarchical_order,'exact')) = 6;
negative_reports(strmatch('7A',subgraph_hierarchical_order,'exact')) = 1;

positive_reports(strmatch('10',subgraph_hierarchical_order,'exact')) = 0;
negative_reports(strmatch('10',subgraph_hierarchical_order,'exact')) = 1;

positive_reports(strmatch('F3',subgraph_hierarchical_order,'exact')) = 2;
negative_reports(strmatch('F3',subgraph_hierarchical_order,'exact')) = 0;

positive_reports(strmatch('TEpd',subgraph_hierarchical_order,'exact')) = 2;
negative_reports(strmatch('TEpd',subgraph_hierarchical_order,'exact')) = 2;

positive_reports(strmatch('46d',subgraph_hierarchical_order,'exact')) = 24;
negative_reports(strmatch('46d',subgraph_hierarchical_order,'exact')) = 0;

positive_reports(strmatch('9/46v',subgraph_hierarchical_order,'exact')) = 31;
negative_reports(strmatch('9/46v',subgraph_hierarchical_order,'exact')) = 2;

% PBr no studies

positive_reports(strmatch('9/46d',subgraph_hierarchical_order,'exact')) = 32;
negative_reports(strmatch('9/46d',subgraph_hierarchical_order,'exact')) = 2;

positive_reports(strmatch('F5',subgraph_hierarchical_order,'exact')) = 3;
negative_reports(strmatch('F5',subgraph_hierarchical_order,'exact')) = 0;

% 7m no studies

% 25 no studies

positive_reports(strmatch('LIP',subgraph_hierarchical_order,'exact')) = 7;
negative_reports(strmatch('LIP',subgraph_hierarchical_order,'exact')) = 0;

% 32 no studies

positive_reports(strmatch('STPi',subgraph_hierarchical_order,'exact')) = 1;
negative_reports(strmatch('STPi',subgraph_hierarchical_order,'exact')) = 0;

positive_reports(strmatch('9',subgraph_hierarchical_order,'exact')) = 1;
negative_reports(strmatch('9',subgraph_hierarchical_order,'exact')) = 0;

positive_reports(strmatch('45A',subgraph_hierarchical_order,'exact')) = 6;
negative_reports(strmatch('45A',subgraph_hierarchical_order,'exact')) = 0;

positive_reports(strmatch('8B',subgraph_hierarchical_order,'exact')) = 2;
negative_reports(strmatch('8B',subgraph_hierarchical_order,'exact')) = 0;

% 7b no studies

positive_reports(strmatch('F2',subgraph_hierarchical_order,'exact')) = 3;
negative_reports(strmatch('F2',subgraph_hierarchical_order,'exact')) = 0;

positive_reports(strmatch('F7',subgraph_hierarchical_order,'exact')) = 6;
negative_reports(strmatch('F7',subgraph_hierarchical_order,'exact')) = 0;

% ProM no studies

positive_reports(strmatch('STPr',subgraph_hierarchical_order,'exact')) = 1;
negative_reports(strmatch('STPr',subgraph_hierarchical_order,'exact')) = 0;

positive_reports(strmatch('24c',subgraph_hierarchical_order,'exact')) = 6;
negative_reports(strmatch('24c',subgraph_hierarchical_order,'exact')) = 0;

% OPRO no studies

aggregate_delay_activity = positive_reports - negative_reports

persistent_areas_data = aggregate_delay_activity>2;

num_reports = positive_reports+negative_reports
percent_persistent = 100*(positive_reports)./num_reports

threshold_percent = 50;
threshold_studies = 2;
persistent_areas_data_percent = percent_persistent>threshold_percent & num_reports>threshold_studies;

isequal(persistent_areas_data,persistent_areas_data_percent)

sum(persistent_areas_data_percent)

% Compare with simulations

load DA_1pt5_rates.mat
delay_firing_rates = mean(R(9000:end,:,1),1);
baseline_firing_rates =  mean(R(1000:1999,:,1),1)

persistent_areas_sim = (delay_firing_rates- baseline_firing_rates)>5;


% areas with > 3 studies
well_studied = positive_reports + negative_reports > threshold_studies;
% save anatomical_data/persistent_areas_experimental.mat persistent_areas_data subgraph_hierarchical_order well_studied
% save anatomical_data/persistent_areas_simulations_DA_1pt5.mat persistent_areas_sim subgraph_hierarchical_order well_studied

num_well_studied = sum(well_studied);

% [tbl,chi2_real,p,labels] = crosstab(persistent_areas_data(well_studied),persistent_areas_sim(well_studied)')
% real_percent_overlap = 100*sum(persistent_areas_data(well_studied) ==persistent_areas_sim(well_studied)')/num_well_studied
% 

[tbl,chi2_real,p,labels] = crosstab(persistent_areas_data_percent(well_studied),persistent_areas_sim(well_studied)')
real_percent_overlap = 100*sum(persistent_areas_data_percent(well_studied) ==persistent_areas_sim(well_studied)')/num_well_studied



%% Identify inconsistencies 

persistent_agreement = subgraph_hierarchical_order(logical(well_studied) & logical(persistent_areas_data) & logical(persistent_areas_sim)')

no_persistent_agreement = subgraph_hierarchical_order(logical(well_studied) & logical(~persistent_areas_data) & logical(~persistent_areas_sim)')

data_no_sim = subgraph_hierarchical_order(logical(well_studied) & logical(persistent_areas_data) & logical(~persistent_areas_sim)')

sim_no_data = subgraph_hierarchical_order(logical(well_studied) & logical(~persistent_areas_data) & logical(persistent_areas_sim)')


%% Create activity maps for Leavitt - Martínez-Trujillo data


%load in left hemisphere inflated surface
l_inflated = gifti('/Users/seanfw/Dropbox/SFW_Wang_projects/Research_areas/Gradients/Donahue_et_al_2016_Journal_of_Neuroscience_W336/spec/MacaqueYerkes19.L.inflated.32k_fs_LR.surf.gii');
% load in LH kennedy atlas (91 regions)
kennedy_atlas_91 = gifti('/Users/seanfw/Dropbox/SFW_Wang_projects/Research_areas/Gradients/Palomero_Gallagher/walsh-macaque-receptor-gradients/atlases/kennedy_atlas_91.label.gii');

% get area List in Donahue order
areaList_Donahue = kennedy_atlas_91.labels.name(2:end)';

[~, Sean_areas_in_Donahue_idx] = ismember(subgraph_hierarchical_order,areaList_Donahue);

num_areas = length(positive_reports);
leavitt_vec = zeros(num_areas,1);
% Code areas with evidence (>3 studies) of persistent activity as +1
leavitt_vec(well_studied & persistent_areas_data) = 1;
% Code areas with evidence against persistent activity as -1
leavitt_vec(well_studied & ~persistent_areas_data) = -1;
% Leave areas with insufficient evidence as 0

sim_vec =  zeros(num_areas,1);
% Code areas with persistent activity in the simulation that have been
% assessed in at least 3 empirical studies as +1
sim_vec(well_studied & persistent_areas_sim') = 1;
% Code areas without persistent activity in the simulation that have been
% assessed in at least 3 empirical studies as -1
sim_vec(well_studied & ~persistent_areas_sim') = -1;
% Leave areas with insufficient evidence as 0


example = gifti('/Users/seanfw/Dropbox/SFW_Wang_projects/Research_areas/Gradients/Allen_Human_Brain_Atlas/cortical_thickness.func.gii');
num_vertices = length(example.cdata);
example.cdata = zeros(num_vertices,1);

leavitt_map = example;
simulations_map = example;

    
for current_parcel = 1:num_areas
    
    vertices_in_parcel = find(kennedy_atlas_91.cdata==Sean_areas_in_Donahue_idx(current_parcel)); % note kennedy_atlas_91.cdata ranges from 0-91, not 1-92

    leavitt_map.cdata(vertices_in_parcel) = leavitt_vec(current_parcel);
    simulations_map.cdata(vertices_in_parcel) = sim_vec(current_parcel);

    
end

%% Plot Leavitt surface

% Colours from Colorbrewer2
three_class_BrBG = [216,179,101;245,245,245;90,180,172]./255

customcmap = three_class_BrBG;
myfig = figure('units','normalized','outerposition',[0.5 0.4 0.5 0.6])
set(gcf,'color','w');
colormap(customcmap)
mysurf = plot(l_inflated,leavitt_map);
direction1 = [0 1 0];
direction2 = [0 0 1];
direction3 = [1 0 0];
rotate(mysurf,direction1,60);
rotate(mysurf,direction2,90);
rotate(mysurf,direction3,15);
material([0.5,0.5,0.15])

% saveas(myfig,'/Users/seanfw/Dropbox/SFW_Wang_projects/Active_projects/Large_scale_monkey_dopamine_WM/Paper_draft/visualisations/surfaces/leavitt_persistent_activity_turquoise_gold_lateral.png');

rotate(mysurf,direction1,180);
rotate(mysurf,direction3,30);



% saveas(myfig,'/Users/seanfw/Dropbox/SFW_Wang_projects/Active_projects/Large_scale_monkey_dopamine_WM/Paper_draft/visualisations/surfaces/leavitt_persistent_activity_turquoise_gold_medial.png');

%% Plot simulation surface

myfig = figure('units','normalized','outerposition',[0.5 0.4 0.5 0.6])
set(gcf,'color','w');
colormap(customcmap)
mysurf = plot(l_inflated,simulations_map);
direction1 = [0 1 0];
direction2 = [0 0 1];
direction3 = [1 0 0];
rotate(mysurf,direction1,60);
rotate(mysurf,direction2,90);
rotate(mysurf,direction3,15);
material([0.5,0.5,0.15])

% saveas(myfig,'/Users/seanfw/Dropbox/SFW_Wang_projects/Active_projects/Large_scale_monkey_dopamine_WM/Paper_draft/visualisations/surfaces/leavitt_sims_persistent_activity_turquoise_gold_lateral.png');

rotate(mysurf,direction1,180);
rotate(mysurf,direction3,30);



% saveas(myfig,'/Users/seanfw/Dropbox/SFW_Wang_projects/Active_projects/Large_scale_monkey_dopamine_WM/Paper_draft/visualisations/surfaces/leavitt_sims_persistent_activity_turquoise_gold_medial.png');


%%
% save(leavitt_map,'maps/leavitt_map.func.gifti','Base64Binary');
% save(simulations_map,'maps/sim_vs_leavitt_map_FEF.func.gifti','Base64Binary');

%% compare shuffled FLN data
close all;
num_well_studied = sum(well_studied);
myplot_FLN = figure('units','normalized','outerposition',[0 0.4 0.5 0.6])
persistent_areas_data_well_studied = persistent_areas_data(well_studied)
num_shuffles = 9999;
shuffled_fln_chi2 = zeros(num_shuffles,1)
shuffled_fln_percent_overlap = zeros(num_shuffles,1);

for current_shuffle = 1:num_shuffles;
    sprintf('current_shuffle = %d',current_shuffle)
    % load in the delay activity for the current simulation with shuffled
    % fln activity
    shuffled_delay_activity = readNPY(sprintf('/Users/seanfw/Dropbox/SFW_Wang_projects/Active_projects/Large_scale_monkey_dopamine_WM/Paper_draft/data/shuffles_fln_FEF/E1_delay_activity_fln_%d_FEF.npy',current_shuffle));
    % load in the baseline activity for the current simulation with shuffled
    % fln activity
    shuffled_baseline_activity = readNPY(sprintf('/Users/seanfw/Dropbox/SFW_Wang_projects/Active_projects/Large_scale_monkey_dopamine_WM/Paper_draft/data/shuffles_fln_FEF/E1_baseline_activity_fln_%d_FEF.npy',current_shuffle));
    %
    h(1) = plot(shuffled_delay_activity(well_studied) - shuffled_baseline_activity(well_studied),'Color',[27/255,158/255,119/255,0.01],'LineWidth',1,'DisplayName','shuffled long-range conns.');
    hold on;

    persistent_areas_shuffled = (shuffled_delay_activity - shuffled_baseline_activity)>5;
    
    [~,chi2_current_sim,~,~] = crosstab(persistent_areas_data(well_studied),persistent_areas_shuffled(well_studied));
    if ~isnan(chi2_current_sim)
    shuffled_fln_chi2(current_shuffle) = chi2_current_sim;
    end
    
    shuffled_fln_percent_overlap(current_shuffle) = 100*sum(persistent_areas_data(well_studied) ==persistent_areas_shuffled(well_studied))/num_well_studied;

end

h(2) = plot(delay_firing_rates(well_studied) - baseline_firing_rates(well_studied),'r','LineWidth',5,'DisplayName','real anatomy');

set(gcf,'color','w');
ax = gca;
set(gca,'XTick', 1:num_well_studied, 'XTickLabel', subgraph_hierarchical_order(well_studied));
lsline
ylabel({'delay vs baseline firing rates';'(Hz)'},'FontSize',30,'FontWeight','bold')
xlabel('hierarchally ordered cortical areas','FontSize',28,'FontWeight','bold')
xtickangle(90)
set(gca, 'FontSize', 20)
ax.XGrid = 'on'

%

num_persistent_areas_data_well_studied = sum(persistent_areas_data_well_studied);

for current_area = 1:num_persistent_areas_data_well_studied
   persistent_areas_data_well_studied_ind =  find(persistent_areas_data_well_studied);
   ax.XTickLabel{persistent_areas_data_well_studied_ind(current_area)} = ['\color{blue}' ax.XTickLabel{persistent_areas_data_well_studied_ind(current_area)}];

end
%
[~, hobj, ~, ~] =  legend(h,'location','northwest');
hl = findobj(hobj,'type','line');
set(hl,'LineWidth',3);

pval_fln_vs_null = sum(shuffled_fln_chi2>=chi2_real)/num_shuffles;
dim = [.45 0.63 .3 .3];
str = sprintf('p = %0.4f', pval_fln_vs_null);
a=annotation('textbox',dim,'String',str,'EdgeColor','none');
a.FontSize = 24;

% saveas(myplot_FLN,'/Users/seanfw/Dropbox/SFW_Wang_projects/Active_projects/Large_scale_monkey_dopamine_WM/Paper_draft/visualisations/figures/real_vs_shuffled_FLN_FEF.eps','epsc');

%% compare shuffled D1 data
shuffled_d1_chi2 = zeros(num_shuffles,1);
shuffled_d1_percent_overlap = zeros(num_shuffles,1);

myplot_D1R = figure('units','normalized','outerposition',[0 0.4 0.5 0.6])

for current_shuffle = 1:num_shuffles;
    sprintf('current_shuffle = %d',current_shuffle)
    % load in the delay activity for the current simulation with shuffled
    % fln activity
    shuffled_delay_activity = readNPY(sprintf('/Users/seanfw/Dropbox/SFW_Wang_projects/Active_projects/Large_scale_monkey_dopamine_WM/Paper_draft/data/shuffles_d1_FEF/E1_delay_activity_d1_density_raw_%d_FEF.npy',current_shuffle));
    % load in the baseline activity for the current simulation with shuffled
    % fln activity
    shuffled_baseline_activity = readNPY(sprintf('/Users/seanfw/Dropbox/SFW_Wang_projects/Active_projects/Large_scale_monkey_dopamine_WM/Paper_draft/data/shuffles_d1_FEF/E1_baseline_activity_d1_density_raw_%d_FEF.npy',current_shuffle));
    % 
    h(1) = plot(shuffled_delay_activity(well_studied) - shuffled_baseline_activity(well_studied),'Color',[217/255,95/255,2/255,0.01],'LineWidth',1,'DisplayName','shuffled D1Rs');
    hold on;
    
    persistent_areas_shuffled = (shuffled_delay_activity - shuffled_baseline_activity)>5;
    
    [~,chi2_current_sim,~,~] = crosstab(persistent_areas_data(well_studied),persistent_areas_shuffled(well_studied));
    
    if ~isnan(chi2_current_sim)
    shuffled_d1_chi2(current_shuffle) = chi2_current_sim;
    end
    shuffled_d1_percent_overlap(current_shuffle) = 100*sum(persistent_areas_data(well_studied) ==persistent_areas_shuffled(well_studied))/num_well_studied;

end

h(2) = plot(delay_firing_rates(well_studied) - baseline_firing_rates(well_studied),'r','LineWidth',5,'DisplayName','real anatomy');

set(gcf,'color','w');
ax = gca;
set(gca,'XTick', 1:num_well_studied, 'XTickLabel', subgraph_hierarchical_order(well_studied));
lsline
ylabel({'delay vs baseline firing rates';'(Hz)'},'FontSize',30,'FontWeight','bold')
xlabel('hierarchally ordered cortical areas','FontSize',28,'FontWeight','bold')
xtickangle(90)
set(gca, 'FontSize', 20)
ax.XGrid = 'on'

%

num_persistent_areas_data_well_studied = sum(persistent_areas_data_well_studied);

for current_area = 1:num_persistent_areas_data_well_studied
   persistent_areas_data_well_studied_ind =  find(persistent_areas_data_well_studied);
   ax.XTickLabel{persistent_areas_data_well_studied_ind(current_area)} = ['\color{blue}' ax.XTickLabel{persistent_areas_data_well_studied_ind(current_area)}];

end
%
[~, hobj, ~, ~] =  legend(h,'location','northwest');
hl = findobj(hobj,'type','line');
set(hl,'LineWidth',3);


pval_d1_vs_null = sum(shuffled_d1_chi2>=chi2_real)/num_shuffles
dim = [.33 0.6 .3 .3];
str = sprintf('p = %0.3f', pval_d1_vs_null);
a=annotation('textbox',dim,'String',str,'EdgeColor','none');
a.FontSize = 24;

% saveas(myplot_D1R,'/Users/seanfw/Dropbox/SFW_Wang_projects/Active_projects/Large_scale_monkey_dopamine_WM/Paper_draft/visualisations/figures/real_vs_shuffled_D1R_FEF.eps','epsc');



%% compare shuffled spine count data
shuffled_spines_chi2 = zeros(num_shuffles,1);
shuffled_spines_percent_overlap = zeros(num_shuffles,1);

myplot_spines = figure('units','normalized','outerposition',[0 0.4 0.5 0.6])

for current_shuffle = 1:num_shuffles;
    sprintf('current_shuffle = %d',current_shuffle)
    % load in the delay activity for the current simulation with shuffled
    % fln activity
    shuffled_delay_activity = readNPY(sprintf('/Users/seanfw/Dropbox/SFW_Wang_projects/Active_projects/Large_scale_monkey_dopamine_WM/Paper_draft/data/shuffles_spines_FEF/E1_delay_activity_spine_count_raw_%d_FEF.npy',current_shuffle));
    % load in the baseline activity for the current simulation with shuffled
    % fln activity
    shuffled_baseline_activity = readNPY(sprintf('/Users/seanfw/Dropbox/SFW_Wang_projects/Active_projects/Large_scale_monkey_dopamine_WM/Paper_draft/data/shuffles_spines_FEF/E1_baseline_activity_spine_count_raw_%d_FEF.npy',current_shuffle));
    % 
    persistent_areas_shuffled = (shuffled_delay_activity - shuffled_baseline_activity)>5;
    
    h(1) = plot(shuffled_delay_activity(well_studied) - shuffled_baseline_activity(well_studied),'Color',[117/255,112/255,179/255,0.01],'LineWidth',1,'DisplayName','shuffled spines');
    hold on;
    
    [~,chi2_current_sim,~,~] = crosstab(persistent_areas_data(well_studied),persistent_areas_shuffled(well_studied));
    
    if ~isnan(chi2_current_sim)
    shuffled_spines_chi2(current_shuffle) = chi2_current_sim;
    end
    shuffled_spines_percent_overlap(current_shuffle) = 100*sum(persistent_areas_data(well_studied) ==persistent_areas_shuffled(well_studied))/num_well_studied;

end

h(2) = plot(delay_firing_rates(well_studied) - baseline_firing_rates(well_studied),'r','LineWidth',5,'DisplayName','real anatomy');

set(gcf,'color','w');
ax = gca;
set(gca,'XTick', 1:num_well_studied, 'XTickLabel', subgraph_hierarchical_order(well_studied));
lsline
ylabel({'delay vs baseline firing rates';'(Hz)'},'FontSize',30,'FontWeight','bold')
xlabel('hierarchally ordered cortical areas','FontSize',28,'FontWeight','bold')
xtickangle(90)
set(gca, 'FontSize', 20)
ax.XGrid = 'on'

%

num_persistent_areas_data_well_studied = sum(persistent_areas_data_well_studied);

for current_area = 1:num_persistent_areas_data_well_studied
   persistent_areas_data_well_studied_ind =  find(persistent_areas_data_well_studied);
   ax.XTickLabel{persistent_areas_data_well_studied_ind(current_area)} = ['\color{blue}' ax.XTickLabel{persistent_areas_data_well_studied_ind(current_area)}];

end
%
[~, hobj, ~, ~] =  legend(h,'location','northwest');
hl = findobj(hobj,'type','line');
set(hl,'LineWidth',3);

pval_spines_vs_null = sum(shuffled_spines_chi2>=chi2_real)/num_shuffles
dim = [.35 0.6 .3 .3];
str = sprintf('p = %0.2f', pval_spines_vs_null);
a=annotation('textbox',dim,'String',str,'EdgeColor','none');
a.FontSize = 24;

% saveas(myplot_spines,'/Users/seanfw/Dropbox/SFW_Wang_projects/Active_projects/Large_scale_monkey_dopamine_WM/Paper_draft/visualisations/figures/real_vs_shuffled_spines_FEF.eps','epsc');

%% compare shuffled spine and D1 count data
shuffled_spines_and_d1_chi2 = zeros(num_shuffles,1);
shuffled_spines_and_d1_percent_overlap = zeros(num_shuffles,1);

myplot_spines_and_d1 = figure('units','normalized','outerposition',[0 0.4 0.5 0.6])

for current_shuffle = 1:num_shuffles;
    sprintf('current_shuffle = %d',current_shuffle)
    % load in the delay activity for the current simulation with shuffled
    % fln activity
    shuffled_delay_activity = readNPY(sprintf('/Users/seanfw/Dropbox/SFW_Wang_projects/Active_projects/Large_scale_monkey_dopamine_WM/Paper_draft/data/shuffles_spines_and_d1_FEF/E1_delay_activity_spines_and_d1_%d_FEF.npy',current_shuffle));
    % load in the baseline activity for the current simulation with shuffled
    % fln activity
    shuffled_baseline_activity = readNPY(sprintf('/Users/seanfw/Dropbox/SFW_Wang_projects/Active_projects/Large_scale_monkey_dopamine_WM/Paper_draft/data/shuffles_spines_and_d1_FEF/E1_baseline_activity_spines_and_d1_%d_FEF.npy',current_shuffle));
    % 
    persistent_areas_shuffled = (shuffled_delay_activity - shuffled_baseline_activity)>5;
    
    h(1) = plot(shuffled_delay_activity(well_studied) - shuffled_baseline_activity(well_studied),'Color',[117/255,112/255,179/255,0.01],'LineWidth',1,'DisplayName','shuffled spines and D1Rs');
    hold on;
    
    [~,chi2_current_sim,~,~] = crosstab(persistent_areas_data(well_studied),persistent_areas_shuffled(well_studied));
    
    if ~isnan(chi2_current_sim)
    shuffled_spines_and_d1_chi2(current_shuffle) = chi2_current_sim;
    end
    shuffled_spines_and_d1_percent_overlap(current_shuffle) = 100*sum(persistent_areas_data(well_studied) ==persistent_areas_shuffled(well_studied))/num_well_studied;

end

h(2) = plot(delay_firing_rates(well_studied) - baseline_firing_rates(well_studied),'r','LineWidth',5,'DisplayName','real anatomy');

set(gcf,'color','w');
ax = gca;
set(gca,'XTick', 1:num_well_studied, 'XTickLabel', subgraph_hierarchical_order(well_studied));
lsline
ylabel({'delay vs baseline firing rates';'(Hz)'},'FontSize',30,'FontWeight','bold')
xlabel('hierarchally ordered cortical areas','FontSize',28,'FontWeight','bold')
xtickangle(90)
set(gca, 'FontSize', 20)
ax.XGrid = 'on'

%

num_persistent_areas_data_well_studied = sum(persistent_areas_data_well_studied);

for current_area = 1:num_persistent_areas_data_well_studied
   persistent_areas_data_well_studied_ind =  find(persistent_areas_data_well_studied);
   ax.XTickLabel{persistent_areas_data_well_studied_ind(current_area)} = ['\color{blue}' ax.XTickLabel{persistent_areas_data_well_studied_ind(current_area)}];

end
%
[~, hobj, ~, ~] =  legend(h,'location','northwest');
hl = findobj(hobj,'type','line');
set(hl,'LineWidth',3);

pval_spines_vs_null = sum(shuffled_spines_and_d1_chi2>=chi2_real)/num_shuffles
dim = [.45 0.6 .3 .3];
str = sprintf('p = %0.2f', pval_spines_vs_null);
a=annotation('textbox',dim,'String',str,'EdgeColor','none');
a.FontSize = 24;

% saveas(myplot_spines_and_d1,'/Users/seanfw/Dropbox/SFW_Wang_projects/Active_projects/Large_scale_monkey_dopamine_WM/Paper_draft/visualisations/figures/real_vs_shuffled_spines_and_d1_FEF.eps','epsc');


%% Plot histograms of chi-squared matches to Leavitt
close all;
myplot_rain = figure('units','normalized','outerposition',[0 0.4 0.2 0.3])
set(gcf,'color','w');
% nhist(shuffled_data,'legend',{'shuffled FLN','shuffled D1R', 'shuffled spines'},'separate');
h3 = raincloud_plot(shuffled_fln_percent_overlap,'band_width',0.2,'lwr_bnd',0.7,'color',[27,158,119]/255,'alpha',1,'dot_dodge_amount',10,'density_type','rash')
h2 = raincloud_plot(shuffled_d1_percent_overlap,'band_width',0.2,'lwr_bnd',0.7,'color',[217,95,2]/255,'alpha',0.5,'dot_dodge_amount',10,'density_type','rash')
h1 = raincloud_plot(shuffled_spines_percent_overlap,'band_width',0.2,'lwr_bnd',0.7,'color',[117,112,179]/255,'alpha',0.5,'dot_dodge_amount',10,'density_type','rash')

% hide legend for scatterplot (raindrops)
set(get(get(h1{2},'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
set(get(get(h2{2},'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
set(get(get(h3{2},'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
% make dots (raindrops) a bit transparent to see all colours
h1{2}.MarkerFaceAlpha = 0.2;
h2{2}.MarkerFaceAlpha = 0.5;


ax = gca;
ylabel({'shuffled simulations','indiv. sims          prob. dens. fun.'},'FontSize',10,'FontWeight','bold')
xlabel({'percent overlap with','experimental activity pattern'},'FontSize',10,'FontWeight','bold')
xtickangle(90)
set(gca, 'FontSize', 12);
set(gca,'fontname','Arial')  % Set it to times
ax.XGrid = 'on'
ylim([-0.15 0.25])
xlim([20 100])
l = line([real_percent_overlap real_percent_overlap], [-0.15 0.25]);
l.Color = 'r';
l.LineWidth = 5;

legend('shuffled long range conns.','shuffled D1R','shuffled spines','real anatomy','Location','best');
set(gca,'box','off');

% 
% saveas(myplot_rain,'/Users/seanfw/Dropbox/SFW_Wang_projects/Active_projects/Large_scale_monkey_dopamine_WM/Paper_draft/visualisations/figures/raincloud_shuffled_simulations_FEF','epsc');
% 


%% Explore different study number and percent thresholds
threshold_percent = 50:10:90
threshold_studies = 1:5
real_percent_overlap_mat = zeros(length(threshold_percent),length(threshold_studies));

for current_studies_threshold = 1:length(threshold_studies)
   for current_percent_threshold = 1:length(threshold_percent)
       persistent_areas_data_percent = percent_persistent>threshold_percent(current_percent_threshold) & num_reports>threshold_studies(current_studies_threshold);
       well_studied = num_reports > threshold_studies(current_studies_threshold);
       num_well_studied = sum(well_studied);
       real_percent_overlap_mat(current_percent_threshold,current_studies_threshold) = round(100*sum(persistent_areas_data_percent(well_studied) ==persistent_areas_sim(well_studied)')/num_well_studied);
   end
end
real_percent_overlap_mat
%% Define sensory areas strictly
sensory_areas = zeros(length(persistent_areas_data),1);
sensory_areas(strmatch('V1',subgraph_hierarchical_order,'exact')) = 1;
sensory_areas(strmatch('V2',subgraph_hierarchical_order,'exact')) = 1;
sensory_areas(strmatch('V4',subgraph_hierarchical_order,'exact')) = 1;
sensory_areas(strmatch('1',subgraph_hierarchical_order,'exact')) = 1;
sensory_areas(strmatch('3',subgraph_hierarchical_order,'exact')) = 1;
sensory_areas(strmatch('MT',subgraph_hierarchical_order,'exact')) = 1;
sensory_areas(strmatch('V6',subgraph_hierarchical_order,'exact')) = 1;
sensory_areas(strmatch('5',subgraph_hierarchical_order,'exact')) = 1;
sensory_areas(strmatch('2',subgraph_hierarchical_order,'exact')) = 1;

associative_areas = ~sensory_areas;
% save anatomical_data/associative_areas.mat associative_areas subgraph_hierarchical_order
% save anatomical_data/sensory_areas.mat sensory_areas subgraph_hierarchical_order
% 
