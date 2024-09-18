%this function performs image Normalization
function [outarray] = apply_imnormalize(inarray)
    for k = 1:size(inarray,3)
      for j = 1:size(inarray,2)
        for i = 1:size(inarray,1)
          outarray(i,j,k) = (double(inarray(i,j,k))/255.0) - 0.5;
        end;
      end;
    end;