%this function performs convolve
function [outarray] = apply_convolve(inarray, filterbank, biasvals)
    load 'CNNparameters.mat'
    for l = 1:length(biasvals)
         temp = biasvals(l);

         for k = 1:size(filterbank,3)

               temp = temp + double(imfilter(inarray(:,:,k),filterbank(:,:,k,l),'conv'));
          end;
          outarray(:,:,l) = temp;
    end;

    