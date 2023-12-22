% Time-resolved functional connectivity matrix generation
% Revised from Hayoung Song (hyssong@uchicago.edu)

% go to 2 step back parent directory
path = fileparts(fileparts(pwd));

% Load BOLD signal
load([path,'/data/brain/Merlin/a_output/ROIsum.mat']);

% setup parameteres
story = 'Merlin';
wsize = 30;
sigma = 3; 
nsub = size(pure_ROIsum,1);
nR = size(pure_ROIsum,2);
nT = size(pure_ROIsum,3);

disp(' ');
disp('Create dynamic functional connectivity');
disp(['  story         = ',story]);
disp(['  nsubj         = ',num2str(nsub)]);
disp(['  nregion       = ',num2str(nR)]);
disp(['  ntime         = ',num2str(nT)]);

dynFeat = [];

for sub = 1:nsub

    disp(['    sub ',num2str(sub),' / ',num2str(nsub)]);

    ts = squeeze(pure_ROIsum(sub,:,:));
    ts = ts';
    
    if any(isnan(ts(:,1)))
        nT_sub = length(find(~isnan(ts(:,1))));
        nanid = find(isnan(ts(:,1)));
        disp('******* include missing values in the timeseries');
        ts = ts(find(~isnan(ts(:,1))),:);
    else
        nT_subj = nT;
    end
    
    % code created by Bo-yong Park: https://by9433.wixsite.com/boyongpark
    % Normalize within region, then divide it by the total stddev
    
    grot=ts;
    grot=grot-repmat(mean(grot),size(grot,1),1); % demean
    grot=grot/std(grot(:));
    ts = grot;
    
     % compute sliding window
    
    if size(ts,1)~= nT_subj
        error('check time series column/row');
    end
    
    if mod(nT_subj,2) ~= 0
        m = ceil(nT_subj/2);
        x = 0:nT_subj;
    else
        m = nT_subj/2;
        x = 0:nT_subj-1;
    end
    
    w = round(wsize/2);
    gw = exp(- ((x-m).^2) / (2*sigma*sigma))';
    b = zeros(nT_subj,1); b((m-w+1):(m+w)) = 1;
    c = conv(gw, b); c = c/max(c); c = c(m+1:end-m+1);
    c = c(1:nT_subj);
    
    % Dynamic connectivity
    A = repmat(c,1,nR);
    Nwin = nT_subj - wsize;
    FNCdyn = zeros(Nwin, nR*(nR - 1)/2);
    
    % Apply circular shift to time series
    tcwin = zeros(Nwin, nT_subj, nR);
    for ii = 1:Nwin
        % slide gaussian centered on [1+wsize/2, nT_subj-wsize/2]
        Ashift = circshift(A, round(-nT_subj/2) + round(wsize/2) + ii);
        % when using "circshift", prevent spillover of the gaussian
        % to either the beginning or an end of the timeseries
        if ii<floor(Nwin/2) & Ashift(end,1)~=0
            Ashift(ceil(Nwin/2):end,:) = 0;
            Ashift = Ashift.*(sum(A(:,1))/sum(Ashift(1:floor(Nwin/2),1)));
        elseif ii>floor(Nwin/2) & Ashift(1,1)~=0
            Ashift(1:floor(Nwin/2),:) = 0;
            Ashift = Ashift.*(sum(A(:,1))/sum(Ashift(ceil(Nwin/2):end,1)));
        end
    
        % apply gaussian weighted sliding window of the timeseries
        tcwin(ii, :, :) = squeeze(ts).*Ashift;
    end
    
    % Fisher's r-to-z transformed dynamic functional connectivity matrix
    tapered_pearsonz = zeros(Nwin,nR,nR);
    for ii = 1:Nwin
        tmp = atanh(corr(squeeze(tcwin(ii,:,:))));
        for i = 1:nR; tmp(i,i) = 0; end
        tapered_pearsonz(ii,:,:) = tmp;
    end
    
    if nT_subj~=nT
        disp('******* add NaN dynFC at the end');
        tapered_pearsonz = cat(1,tapered_pearsonz,zeros(length(nanid),nR,nR)*NaN);
    end
    
    % to reduce data size, reduce into feature dimension
    dynft = [];
    for tm = 1:(nT-wsize)
        tmp = squeeze(tapered_pearsonz(tm,:,:));
        feat = [];
        for i1 = 1:nR-1
            for i2 = i1+1:nR
                feat = [feat; tmp(i1,i2)];
            end
        end
        dynft = [dynft, feat];
    end
    dynFeat = cat(3, dynFeat, dynft);
end

% dynamic brain connectivity "feature": (nsubj, nRx(nR-1)/2, nT-wsize)
dynFeat = permute(dynFeat, [3,1,2]);

disp('Saving .....');
if exist([path,'/data/brain/Merlin/a_output/FC'])==0
    mkdir([path,'/data/brain/Merlin/a_output/FC']);
end

save([path,'/data/brain/Merlin/a_output/FC','/sliding-dynFeat.mat'],'dynFeat', '-v7.3');
disp('Finished Hooyay!')
