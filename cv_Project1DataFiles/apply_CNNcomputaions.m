%this function performs CNN computations
function [outimg] = apply_CNNcomputaions(img)
    load 'CNNparameters.mat'
    for d = 1:length(layertypes)
        if isequal(layertypes{d},'imnormalize')
            img = apply_imnormalize(img);
        elseif isequal(layertypes{d},'convolve')
            img = apply_convolve(img,filterbanks{d},biasvectors{d});
        elseif isequal(layertypes{d},'fullconnect')
            img = apply_fullconnect(img,filterbanks{d},biasvectors{d});
        elseif isequal(layertypes{d},'relu')
            img = apply_relu(img);
        elseif isequal(layertypes{d},'maxpool')
            img = apply_maxpool(img);
        else
            img = apply_softmax(img);
        end;
    end
    outimg = img;