%this function performs fully connected
function [outarray] = apply_fullconnect(inarray, filterbank, biasvals)
    load 'CNNparameters.mat'
    for l = 1 : length(biasvals)
            temp = 0;
            for x = 1 : size(inarray,1)
                for y = 1 : size(inarray,2)
                    for z = 1 : size(inarray,3)
                        temp = temp + filterbank(x, y, z, l)*inarray(x, y, z);
                    end
                end
            end
            outarray(1, 1, l) = temp + biasvals(l);
    end