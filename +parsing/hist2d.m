function [ output_args ] = hist2d( input )
    %HIST2D Summary of this function goes here
    %   Detailed explanation goes here
    %# some random data
    minscale = log(.001);
    maxscale = log(100);
    scaleresolution = 250;
    stepsize = (maxscale-minscale)/(scaleresolution-1);
    X = log(input(1,:));
    Y = input(2,:);

    %# bin centers (integers)
    xbins = min(X):stepsize:max(X);
    ybins = floor(min(Y)):1:ceil(max(Y));
    xNumBins = numel(xbins); yNumBins = numel(ybins);

    %# map X/Y values to bin indices
    Xi = round( interp1(xbins, 1:xNumBins, X, 'linear', 'extrap') );
    Yi = round( interp1(ybins, 1:yNumBins, Y, 'linear', 'extrap') );

    %# limit indices to the range [1,numBins]
    Xi = max( min(Xi,xNumBins), 1);
    Yi = max( min(Yi,yNumBins), 1);

    %# count number of elements in each bin
    H = accumarray([Yi(:) Xi(:)], 1, [yNumBins xNumBins]);

    %# plot 2D histogram
    imagesc(xbins, ybins, H), axis on %# axis image
    colormap hot; colorbar
    hold on, plot(X, Y, 'b.', 'MarkerSize',1); 
    
    xtickval = min(X):(max(X)-min(X))/10:max(X);
    xbinlabels = exp(xtickval);
    xbinlabels=round(xbinlabels*100)/100;
    set(gca,'XTick',xtickval)
    set(gca,'XTickLabel',xbinlabels)
   
    hold off

end

